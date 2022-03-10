#include <iostream>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <math.h>
#include <stdlib.h>
#include <fstream>
#include <string>
#define TWO_PI 2*M_PI
typedef ap_uint<8> pixel_type;
typedef ap_int<8> pixel_type_s;
typedef ap_ufixed<8,0, AP_RND, AP_SAT> comp_type;

typedef ap_axiu<24,1,1,1> pixel;
typedef hls::stream<pixel> video_stream;

struct channels {
	pixel_type_s p1;
	pixel_type_s p2;
	pixel_type_s p3;
	channels() {}
	channels(ap_uint<24> pixel)
				: p1(pixel(7,0)), p2(pixel(15,8)), p3(pixel(23,16)) {}
};


void Blur(video_stream &in_data,video_stream& out_data,
		int w, int h,int kernal);
int main(){
	video_stream in,out;


	/*pixel p[9];
	p[0].data=17;;
	p[1].data=14;
	p[2].data=13;
	p[3].data=21;
	p[4].data=64;
	p[5].data=62;
	p[6].data=42;
	p[7].data=54;
	p[8].data=61;p[8].last=1;

	for(int i=0;i<9;i++)
		in.write(p[i]);
	Blur(in,out,3,3,1,9);//*/


	static constexpr int TEST_IMG_ROWS=1024;
	static constexpr int TEST_IMG_COLS=1280;
	std::ifstream red_in("Homer_Grey.txt");
	std::fstream green_in("Homer_Grey1.txt");
	std::fstream blue_in("Homer_Grey2.txt");
	for(int i=0;i<TEST_IMG_COLS*TEST_IMG_ROWS;i++){
		std::string red_data,blue_data,green_data;

		std::getline(red_in,red_data,'\n');
		//std::cout<<red_data<<" "<<std::stoi(red_data)<<std::endl;
		std::getline(green_in,green_data);
		std::getline(blue_in,blue_data);
		//std::cout<<std::stoi(red_data)<<" "<<std::stoi(green_data)<<" "<<std::stoi(blue_data)<<std::endl;
		pixel p; p.data=std::stoi(red_data)<<16|std::stoi(green_data)<<8|std::stoi(blue_data);
		in.write(p);
	}
	red_in.close();
	green_in.close();
	blue_in.close();
	pixel p;
	std::ofstream fout("Homer_blurred.txt");

	Blur(in,out,TEST_IMG_COLS,TEST_IMG_ROWS,21);
	for(int row=0;row<TEST_IMG_ROWS;row++){
		for(int col=0;col<TEST_IMG_COLS;col++){
			out.read(p);
			fout<<(unsigned int)(p.data)<< " ";

			//std::cout<<p.data<<" ";
		}
		//std::cout<<std::endl;
	}//*/
fout.close();

	/*pixel o;
	out.read(o);
	std::cout<<o.data<<" ";
	out.read(o);
	std::cout<<o.data<<" ";
	out.read(o);
	std::cout<<o.data<<" ";
	std::cout<<std::endl;
	out.read(o);
	std::cout<<o.data<<" ";
	out.read(o);
	std::cout<<o.data<<" ";
	out.read(o);
	std::cout<<o.data<<" ";
	std::cout<<std::endl;
	out.read(o);
	std::cout<<o.data<<" ";
	out.read(o);
	std::cout<<o.data<<" ";
	out.read(o);
	std::cout<<o.data<<" ";
	std::cout<<std::endl;*/
	return 0;
}

