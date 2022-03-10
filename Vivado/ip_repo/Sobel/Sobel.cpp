#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <math.h>
#include <assert.h>
#include <stdint.h>

typedef ap_axiu<8,1,1,1> pixel;
typedef hls::stream<pixel> video_stream;

#define MAX_IMG_ROWS 1080
#define MAX_IMG_COLS 1920

//1080 rows
//1920 columns

template<typename T, int K>
static void convolution_strm(int width, int height,
		video_stream &in_data, video_stream& out_data,
		const char *hcoeff,
		const char *vcoeff)
{
    const int border_width=int(K/2);
    // Horizontal pixel buffer
    T hwin[K];
    hls::stream<T> hconv("hconv");
    // Vertical pixel buffer
    static T linebuf[K-1][MAX_IMG_COLS];
    hls::stream<T> vconv("vconv");
    const int vconv_xlim=width-(K-1);
    // Line-buffer for border pixels
    T borderbuf[MAX_IMG_COLS-(K-1)];
#pragma HLS ARRAY_PARTITION variable=linebuf dim=1 complete
#pragma HLS INLINE // Into a DATAFLOW region
    // These assertions let HLS know the upper bounds of loops
    assert(height<MAX_IMG_ROWS);
    assert(width<MAX_IMG_COLS);
    assert(vconv_xlim<MAX_IMG_COLS-(K-1));
    // Horizontal convolution
    HConvH:for(int col=0;col<height;col++){
        HConvW:for(int row=0;row<width;row++){
#pragma HLS PIPELINE
        	pixel pixel_in=in_data.read();
			T in_val=pixel_in.data;
        	T out_val=0;
            HConv:for(int i=0;i<K;i++){
                hwin[i]=i<K-1?hwin[i+1]:in_val;
                out_val=hwin[i]*hcoeff[i];
            }
            if (row>=K-1){
            	hconv.write(out_val);
            }
        }
    }
    // Vertical convolution
    VConvH:for(int col=0;col<height;col++) {
        VConvW:for(int row=0;row<vconv_xlim;row++){
#pragma HLS DEPENDENCE variable=linebuf inter false
#pragma HLS PIPELINE
        	T in_val=hconv.read();
        	T out_val = 0;
            VConv:for(int i=0;i<K;i++) {
                T vwin_val=i<K-1?linebuf[i][row]:in_val;
                out_val=vwin_val*vcoeff[i];
                if(i>0)
                    linebuf[i-1][row]=vwin_val;
            }
            if (col>=K-1){
				vconv.write(out_val);
            }
        }
    }
    Border:for(int i=0;i<height;i++){
        for(int j=0;j<width;j++){
            T pix_in, l_edge_pix, r_edge_pix, pix_out;
#pragma HLS PIPELINE
            if (i==0||(i>border_width&&i<height-border_width)){
                // read a pixel out of the input stream and cache it for
                // immediate use and later replication purposes
                if(j<width-(K-1)){
                    vconv.read(pix_in);
                    borderbuf[j]=pix_in;
                }
                if(j==0){
                    l_edge_pix=pix_in;}
                if (j==width-K){
                    r_edge_pix=pix_in;}
            }
            if(j<=border_width){
                pix_out=l_edge_pix;}
            else if(j>=width-border_width-1){
                pix_out=r_edge_pix;}
            else{
                pix_out=borderbuf[j-border_width];}
            pixel output;
			output.data=pix_out;
			output.keep=-1;
			output.strb=1;
			output.last=((i==height-1)&&(j==width-1))?1:0;
			out_data<<(output);
        }
    }
}
void Sobel(video_stream &in_data,video_stream& out_data,
		int w, int h) {
#pragma hls interface ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_data
#pragma HLS INTERFACE s_axilite port=w
#pragma HLS INTERFACE s_axilite port=h

	static const char hcoeff[3] = {1, 0, -1};
	static const char vcoeff[3] = {1, 2, 1};

	#pragma HLS DATAFLOW
	#pragma HLS INLINE
	convolution_strm<ap_uint<8>,3>(w,h,in_data,out_data,hcoeff,vcoeff);



}
