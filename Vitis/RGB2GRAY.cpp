#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

void RGB2GRAY(hls::stream<ap_axiu<24,1,1,1>> &in_data,hls::stream<ap_axiu<8,1,1,1>>& out_data){
#pragma hls interface ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_data

ap_axiu<8,1,1,1> gray;
ap_axiu<24,1,1,1> p;p.last=0;
while(!p.last){
	p=in_data.read();
	gray.data =((p.data>>16)*0.114+
	      ((p.data>>8)&0xFF)*0.587+
		   (p.data&0xFF)*0.299);
	gray.last=p.last;
	gray.strb=p.strb;
	gray.keep=p.keep;
	out_data.write(gray);
}





}
