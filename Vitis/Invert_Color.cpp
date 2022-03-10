#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
typedef ap_axiu<24,1,0,0> pixel;
typedef hls::stream<pixel> video_stream;

void Invert_Color(video_stream& in_data,video_stream & out_data) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=in_data register
#pragma HLS INTERFACE axis port=out_data register
	pixel p;p.last=0;
	while(!p.last){
		in_data.read(p);
		p.data=~p.data;
		out_data.write(p);
	}
	return;
}
