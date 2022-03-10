#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <math.h>
#include <assert.h>
#include <stdint.h>

#define TWO_PI 2*M_PI

typedef ap_axiu<24,1,1,1> pixel;
typedef hls::stream<pixel> video_stream;

void gray(video_stream &in_data,video_stream& out_data){
#pragma hls interface ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_data

	pixel p;p.last=0;
	while(!p.last){
		in_data.read(p);
		p.data=(p.data>>16)*0.299+
			   ((p.data>>8)&0xFF)*0.587+
			   (p.data&0xFF)*0.114;
		out_data.write(p);
	}
	return;
}
