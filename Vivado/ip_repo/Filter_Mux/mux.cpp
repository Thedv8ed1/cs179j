
void Mux(int filter_setting,bool& gray,bool&invert ){
#pragma hls interface ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=filter_setting register
#pragma HLS INTERFACE ap_none port=gray
#pragma HLS INTERFACE ap_none port=invert

	switch(filter_setting){
		case 0: gray=0;invert=0; break;
		case 1: gray=1;invert=0; break;
		case 2: gray=0;invert=1; break;
		case 3: gray=1;invert=1; break;
		default: gray=0;invert=0; break;
	}

	return;
}
