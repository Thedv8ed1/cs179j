#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
typedef ap_uint<8> pixel_type;
typedef ap_int<8> pixel_type_s;
typedef ap_ufixed<8,0, AP_RND, AP_SAT> comp_type;
//#include <opencv2/core.hpp>

typedef ap_axiu<24,1,0,0> pixel;
typedef hls::stream<pixel> video_stream;

int col = 0;

struct channels {
	pixel_type_s p1;
	pixel_type_s p2;
	pixel_type_s p3;
	channels() {}
	channels(ap_uint<24> pixel)
				: p1(pixel(7,0)), p2(pixel(15,8)), p3(pixel(23,16)) {}
};


void Invert_Color(video_stream& in_data,video_stream & out_data,int a) {

#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=in_data register
#pragma HLS INTERFACE axis port=out_data register
#pragma HLS INTERFACE s_axilite port=a register

#pragma HLS pipeline II=1 // what's this do?

	pixel curr_pixel;
	in_data.read(curr_pixel);
	auto v=channels(curr_pixel.data);

	comp_type in1, in2, in3, out1, out2, out3;
	in1.range()=v.p1;
	in2.range()=v.p2;
	in3.range()=v.p3;

	if(a==1){
		out1=~in1;
		out2=~in2;
		out3=~in3;
	}else{
		out1=in1;
		out2=in2;
		out3=in3;
	}

	if(curr_pixel.last)
		col=0;
	col++;

	//out1=in1;out2=in2;out3=in3;
	curr_pixel.data=(out3.range(), out2.range(), out1.range());

	out_data.write(curr_pixel);

}
