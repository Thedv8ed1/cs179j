#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

void GRAY2RGB(hls::stream<ap_axiu<8,1,1,1>> &in_data,hls::stream<ap_axiu<24,1,1,1>>& out_data){
#pragma hls interface ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_data

ap_axiu<24,1,1,1> rgb;
ap_axiu<8,1,1,1> gray;gray.last=0;
while(!gray.last){
	gray=in_data.read();
	unsigned int r=gray.data;
	unsigned int g=r;
	unsigned int b=r;
	rgb.data =(r<<16)|(g<<8)|(b);
	rgb.keep=-1;
	rgb.strb=1;
	rgb.last=gray.last;
	out_data.write(rgb);
}





}
