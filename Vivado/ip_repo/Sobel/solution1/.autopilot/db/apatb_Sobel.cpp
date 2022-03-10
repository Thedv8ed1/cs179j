#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_in_data_V_data_V "../tv/cdatafile/c.Sobel.autotvin_in_data_V_data_V.dat"
#define AUTOTB_TVOUT_in_data_V_data_V "../tv/cdatafile/c.Sobel.autotvout_in_data_V_data_V.dat"
#define AUTOTB_TVIN_in_data_V_keep_V "../tv/cdatafile/c.Sobel.autotvin_in_data_V_keep_V.dat"
#define AUTOTB_TVOUT_in_data_V_keep_V "../tv/cdatafile/c.Sobel.autotvout_in_data_V_keep_V.dat"
#define AUTOTB_TVIN_in_data_V_strb_V "../tv/cdatafile/c.Sobel.autotvin_in_data_V_strb_V.dat"
#define AUTOTB_TVOUT_in_data_V_strb_V "../tv/cdatafile/c.Sobel.autotvout_in_data_V_strb_V.dat"
#define AUTOTB_TVIN_in_data_V_user_V "../tv/cdatafile/c.Sobel.autotvin_in_data_V_user_V.dat"
#define AUTOTB_TVOUT_in_data_V_user_V "../tv/cdatafile/c.Sobel.autotvout_in_data_V_user_V.dat"
#define AUTOTB_TVIN_in_data_V_last_V "../tv/cdatafile/c.Sobel.autotvin_in_data_V_last_V.dat"
#define AUTOTB_TVOUT_in_data_V_last_V "../tv/cdatafile/c.Sobel.autotvout_in_data_V_last_V.dat"
#define AUTOTB_TVIN_in_data_V_id_V "../tv/cdatafile/c.Sobel.autotvin_in_data_V_id_V.dat"
#define AUTOTB_TVOUT_in_data_V_id_V "../tv/cdatafile/c.Sobel.autotvout_in_data_V_id_V.dat"
#define AUTOTB_TVIN_in_data_V_dest_V "../tv/cdatafile/c.Sobel.autotvin_in_data_V_dest_V.dat"
#define AUTOTB_TVOUT_in_data_V_dest_V "../tv/cdatafile/c.Sobel.autotvout_in_data_V_dest_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_data_V_data_V "../tv/stream_size/stream_size_in_in_data_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_data_V_data_V "../tv/stream_size/stream_ingress_status_in_data_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_data_V_keep_V "../tv/stream_size/stream_size_in_in_data_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_data_V_keep_V "../tv/stream_size/stream_ingress_status_in_data_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_data_V_strb_V "../tv/stream_size/stream_size_in_in_data_V_strb_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_data_V_strb_V "../tv/stream_size/stream_ingress_status_in_data_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_data_V_user_V "../tv/stream_size/stream_size_in_in_data_V_user_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_data_V_user_V "../tv/stream_size/stream_ingress_status_in_data_V_user_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_data_V_last_V "../tv/stream_size/stream_size_in_in_data_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_data_V_last_V "../tv/stream_size/stream_ingress_status_in_data_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_data_V_id_V "../tv/stream_size/stream_size_in_in_data_V_id_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_data_V_id_V "../tv/stream_size/stream_ingress_status_in_data_V_id_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_data_V_dest_V "../tv/stream_size/stream_size_in_in_data_V_dest_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_data_V_dest_V "../tv/stream_size/stream_ingress_status_in_data_V_dest_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_out_data_V_data_V "../tv/cdatafile/c.Sobel.autotvin_out_data_V_data_V.dat"
#define AUTOTB_TVOUT_out_data_V_data_V "../tv/cdatafile/c.Sobel.autotvout_out_data_V_data_V.dat"
#define AUTOTB_TVIN_out_data_V_keep_V "../tv/cdatafile/c.Sobel.autotvin_out_data_V_keep_V.dat"
#define AUTOTB_TVOUT_out_data_V_keep_V "../tv/cdatafile/c.Sobel.autotvout_out_data_V_keep_V.dat"
#define AUTOTB_TVIN_out_data_V_strb_V "../tv/cdatafile/c.Sobel.autotvin_out_data_V_strb_V.dat"
#define AUTOTB_TVOUT_out_data_V_strb_V "../tv/cdatafile/c.Sobel.autotvout_out_data_V_strb_V.dat"
#define AUTOTB_TVIN_out_data_V_user_V "../tv/cdatafile/c.Sobel.autotvin_out_data_V_user_V.dat"
#define AUTOTB_TVOUT_out_data_V_user_V "../tv/cdatafile/c.Sobel.autotvout_out_data_V_user_V.dat"
#define AUTOTB_TVIN_out_data_V_last_V "../tv/cdatafile/c.Sobel.autotvin_out_data_V_last_V.dat"
#define AUTOTB_TVOUT_out_data_V_last_V "../tv/cdatafile/c.Sobel.autotvout_out_data_V_last_V.dat"
#define AUTOTB_TVIN_out_data_V_id_V "../tv/cdatafile/c.Sobel.autotvin_out_data_V_id_V.dat"
#define AUTOTB_TVOUT_out_data_V_id_V "../tv/cdatafile/c.Sobel.autotvout_out_data_V_id_V.dat"
#define AUTOTB_TVIN_out_data_V_dest_V "../tv/cdatafile/c.Sobel.autotvin_out_data_V_dest_V.dat"
#define AUTOTB_TVOUT_out_data_V_dest_V "../tv/cdatafile/c.Sobel.autotvout_out_data_V_dest_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_data_V_data_V "../tv/stream_size/stream_size_out_out_data_V_data_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_data_V_data_V "../tv/stream_size/stream_egress_status_out_data_V_data_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_data_V_keep_V "../tv/stream_size/stream_size_out_out_data_V_keep_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_data_V_keep_V "../tv/stream_size/stream_egress_status_out_data_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_data_V_strb_V "../tv/stream_size/stream_size_out_out_data_V_strb_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_data_V_strb_V "../tv/stream_size/stream_egress_status_out_data_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_data_V_user_V "../tv/stream_size/stream_size_out_out_data_V_user_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_data_V_user_V "../tv/stream_size/stream_egress_status_out_data_V_user_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_data_V_last_V "../tv/stream_size/stream_size_out_out_data_V_last_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_data_V_last_V "../tv/stream_size/stream_egress_status_out_data_V_last_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_data_V_id_V "../tv/stream_size/stream_size_out_out_data_V_id_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_data_V_id_V "../tv/stream_size/stream_egress_status_out_data_V_id_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_data_V_dest_V "../tv/stream_size/stream_size_out_out_data_V_dest_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_data_V_dest_V "../tv/stream_size/stream_egress_status_out_data_V_dest_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_w "../tv/cdatafile/c.Sobel.autotvin_w.dat"
#define AUTOTB_TVOUT_w "../tv/cdatafile/c.Sobel.autotvout_w.dat"
// wrapc file define:
#define AUTOTB_TVIN_h "../tv/cdatafile/c.Sobel.autotvin_h.dat"
#define AUTOTB_TVOUT_h "../tv/cdatafile/c.Sobel.autotvout_h.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_in_data_V_data_V "../tv/rtldatafile/rtl.Sobel.autotvout_in_data_V_data_V.dat"
#define AUTOTB_TVOUT_PC_in_data_V_keep_V "../tv/rtldatafile/rtl.Sobel.autotvout_in_data_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_in_data_V_strb_V "../tv/rtldatafile/rtl.Sobel.autotvout_in_data_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_in_data_V_user_V "../tv/rtldatafile/rtl.Sobel.autotvout_in_data_V_user_V.dat"
#define AUTOTB_TVOUT_PC_in_data_V_last_V "../tv/rtldatafile/rtl.Sobel.autotvout_in_data_V_last_V.dat"
#define AUTOTB_TVOUT_PC_in_data_V_id_V "../tv/rtldatafile/rtl.Sobel.autotvout_in_data_V_id_V.dat"
#define AUTOTB_TVOUT_PC_in_data_V_dest_V "../tv/rtldatafile/rtl.Sobel.autotvout_in_data_V_dest_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_out_data_V_data_V "../tv/rtldatafile/rtl.Sobel.autotvout_out_data_V_data_V.dat"
#define AUTOTB_TVOUT_PC_out_data_V_keep_V "../tv/rtldatafile/rtl.Sobel.autotvout_out_data_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_out_data_V_strb_V "../tv/rtldatafile/rtl.Sobel.autotvout_out_data_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_out_data_V_user_V "../tv/rtldatafile/rtl.Sobel.autotvout_out_data_V_user_V.dat"
#define AUTOTB_TVOUT_PC_out_data_V_last_V "../tv/rtldatafile/rtl.Sobel.autotvout_out_data_V_last_V.dat"
#define AUTOTB_TVOUT_PC_out_data_V_id_V "../tv/rtldatafile/rtl.Sobel.autotvout_out_data_V_id_V.dat"
#define AUTOTB_TVOUT_PC_out_data_V_dest_V "../tv/rtldatafile/rtl.Sobel.autotvout_out_data_V_dest_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_w "../tv/rtldatafile/rtl.Sobel.autotvout_w.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_h "../tv/rtldatafile/rtl.Sobel.autotvout_h.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  in_data_V_data_V_depth = 0;
  in_data_V_keep_V_depth = 0;
  in_data_V_strb_V_depth = 0;
  in_data_V_user_V_depth = 0;
  in_data_V_last_V_depth = 0;
  in_data_V_id_V_depth = 0;
  in_data_V_dest_V_depth = 0;
  out_data_V_data_V_depth = 0;
  out_data_V_keep_V_depth = 0;
  out_data_V_strb_V_depth = 0;
  out_data_V_user_V_depth = 0;
  out_data_V_last_V_depth = 0;
  out_data_V_id_V_depth = 0;
  out_data_V_dest_V_depth = 0;
  w_depth = 0;
  h_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{in_data_V_data_V " << in_data_V_data_V_depth << "}\n";
  total_list << "{in_data_V_keep_V " << in_data_V_keep_V_depth << "}\n";
  total_list << "{in_data_V_strb_V " << in_data_V_strb_V_depth << "}\n";
  total_list << "{in_data_V_user_V " << in_data_V_user_V_depth << "}\n";
  total_list << "{in_data_V_last_V " << in_data_V_last_V_depth << "}\n";
  total_list << "{in_data_V_id_V " << in_data_V_id_V_depth << "}\n";
  total_list << "{in_data_V_dest_V " << in_data_V_dest_V_depth << "}\n";
  total_list << "{out_data_V_data_V " << out_data_V_data_V_depth << "}\n";
  total_list << "{out_data_V_keep_V " << out_data_V_keep_V_depth << "}\n";
  total_list << "{out_data_V_strb_V " << out_data_V_strb_V_depth << "}\n";
  total_list << "{out_data_V_user_V " << out_data_V_user_V_depth << "}\n";
  total_list << "{out_data_V_last_V " << out_data_V_last_V_depth << "}\n";
  total_list << "{out_data_V_id_V " << out_data_V_id_V_depth << "}\n";
  total_list << "{out_data_V_dest_V " << out_data_V_dest_V_depth << "}\n";
  total_list << "{w " << w_depth << "}\n";
  total_list << "{h " << h_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int in_data_V_data_V_depth;
    int in_data_V_keep_V_depth;
    int in_data_V_strb_V_depth;
    int in_data_V_user_V_depth;
    int in_data_V_last_V_depth;
    int in_data_V_id_V_depth;
    int in_data_V_dest_V_depth;
    int out_data_V_data_V_depth;
    int out_data_V_keep_V_depth;
    int out_data_V_strb_V_depth;
    int out_data_V_user_V_depth;
    int out_data_V_last_V_depth;
    int out_data_V_id_V_depth;
    int out_data_V_dest_V_depth;
    int w_depth;
    int h_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
struct __cosim_s7__ { char data[7]; };
extern "C" void Sobel_hw_stub_wrapper(volatile void *, volatile void *, int, int);

extern "C" void apatb_Sobel_hw(volatile void * __xlx_apatb_param_in_data, volatile void * __xlx_apatb_param_out_data, int __xlx_apatb_param_w, int __xlx_apatb_param_h) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;long __xlx_apatb_param_in_data_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_in_data_V_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_in_data_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_in_data_stream_buf_final_size; ++i)((hls::stream<__cosim_s7__>*)__xlx_apatb_param_in_data)->read();
{sc_bv<56> xlx_stream_out_data_pc_buffer;
unsigned xlx_stream_out_data_size = 0;

          std::vector<sc_bv<8> > out_data_V_data_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_data_V_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > out_data_V_data_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_data");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_data_V_data_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_data_size=out_data_V_data_V_pc_buffer.size();
out_data_V_data_V_pc_buffer_Copy=out_data_V_data_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<8> > out_data_V_keep_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_data_V_keep_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > out_data_V_keep_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_data");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_data_V_keep_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_data_size=out_data_V_keep_V_pc_buffer.size();
out_data_V_keep_V_pc_buffer_Copy=out_data_V_keep_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<8> > out_data_V_strb_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_data_V_strb_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > out_data_V_strb_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_data");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_data_V_strb_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_data_size=out_data_V_strb_V_pc_buffer.size();
out_data_V_strb_V_pc_buffer_Copy=out_data_V_strb_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<8> > out_data_V_user_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_data_V_user_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > out_data_V_user_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_data");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_data_V_user_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_data_size=out_data_V_user_V_pc_buffer.size();
out_data_V_user_V_pc_buffer_Copy=out_data_V_user_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<8> > out_data_V_last_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_data_V_last_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > out_data_V_last_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_data");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_data_V_last_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_data_size=out_data_V_last_V_pc_buffer.size();
out_data_V_last_V_pc_buffer_Copy=out_data_V_last_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<8> > out_data_V_id_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_data_V_id_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > out_data_V_id_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_data");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_data_V_id_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_data_size=out_data_V_id_V_pc_buffer.size();
out_data_V_id_V_pc_buffer_Copy=out_data_V_id_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<8> > out_data_V_dest_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_data_V_dest_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > out_data_V_dest_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_data");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_data_V_dest_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_data_size=out_data_V_dest_V_pc_buffer.size();
out_data_V_dest_V_pc_buffer_Copy=out_data_V_dest_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (int j = 0, e = xlx_stream_out_data_size; j != e; ++j) {
xlx_stream_out_data_pc_buffer.range(7, 0) = out_data_V_data_V_pc_buffer_Copy[j];
xlx_stream_out_data_pc_buffer.range(15, 8) = out_data_V_keep_V_pc_buffer_Copy[j];
xlx_stream_out_data_pc_buffer.range(23, 16) = out_data_V_strb_V_pc_buffer_Copy[j];
xlx_stream_out_data_pc_buffer.range(31, 24) = out_data_V_user_V_pc_buffer_Copy[j];
xlx_stream_out_data_pc_buffer.range(39, 32) = out_data_V_last_V_pc_buffer_Copy[j];
xlx_stream_out_data_pc_buffer.range(47, 40) = out_data_V_id_V_pc_buffer_Copy[j];
xlx_stream_out_data_pc_buffer.range(55, 48) = out_data_V_dest_V_pc_buffer_Copy[j];
__cosim_s7__ xlx_stream_elt;
((long long*)&xlx_stream_elt)[0] = xlx_stream_out_data_pc_buffer.to_int64();
((hls::stream<__cosim_s7__>*)__xlx_apatb_param_out_data)->write(xlx_stream_elt);
}}
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//in_data
aesl_fh.touch(AUTOTB_TVIN_in_data_V_data_V);
aesl_fh.touch(AUTOTB_TVOUT_in_data_V_data_V);
aesl_fh.touch(AUTOTB_TVIN_in_data_V_keep_V);
aesl_fh.touch(AUTOTB_TVOUT_in_data_V_keep_V);
aesl_fh.touch(AUTOTB_TVIN_in_data_V_strb_V);
aesl_fh.touch(AUTOTB_TVOUT_in_data_V_strb_V);
aesl_fh.touch(AUTOTB_TVIN_in_data_V_user_V);
aesl_fh.touch(AUTOTB_TVOUT_in_data_V_user_V);
aesl_fh.touch(AUTOTB_TVIN_in_data_V_last_V);
aesl_fh.touch(AUTOTB_TVOUT_in_data_V_last_V);
aesl_fh.touch(AUTOTB_TVIN_in_data_V_id_V);
aesl_fh.touch(AUTOTB_TVOUT_in_data_V_id_V);
aesl_fh.touch(AUTOTB_TVIN_in_data_V_dest_V);
aesl_fh.touch(AUTOTB_TVOUT_in_data_V_dest_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_in_data_V_data_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_in_data_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_in_data_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_in_data_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_in_data_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_in_data_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_in_data_V_user_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_in_data_V_user_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_in_data_V_last_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_in_data_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_in_data_V_id_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_in_data_V_id_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_in_data_V_dest_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_in_data_V_dest_V);
//out_data
aesl_fh.touch(AUTOTB_TVIN_out_data_V_data_V);
aesl_fh.touch(AUTOTB_TVOUT_out_data_V_data_V);
aesl_fh.touch(AUTOTB_TVIN_out_data_V_keep_V);
aesl_fh.touch(AUTOTB_TVOUT_out_data_V_keep_V);
aesl_fh.touch(AUTOTB_TVIN_out_data_V_strb_V);
aesl_fh.touch(AUTOTB_TVOUT_out_data_V_strb_V);
aesl_fh.touch(AUTOTB_TVIN_out_data_V_user_V);
aesl_fh.touch(AUTOTB_TVOUT_out_data_V_user_V);
aesl_fh.touch(AUTOTB_TVIN_out_data_V_last_V);
aesl_fh.touch(AUTOTB_TVOUT_out_data_V_last_V);
aesl_fh.touch(AUTOTB_TVIN_out_data_V_id_V);
aesl_fh.touch(AUTOTB_TVOUT_out_data_V_id_V);
aesl_fh.touch(AUTOTB_TVIN_out_data_V_dest_V);
aesl_fh.touch(AUTOTB_TVOUT_out_data_V_dest_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_data_V_data_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_data_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_data_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_data_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_data_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_data_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_data_V_user_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_data_V_user_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_data_V_last_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_data_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_data_V_id_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_data_V_id_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_data_V_dest_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_data_V_dest_V);
//w
aesl_fh.touch(AUTOTB_TVIN_w);
aesl_fh.touch(AUTOTB_TVOUT_w);
//h
aesl_fh.touch(AUTOTB_TVIN_h);
aesl_fh.touch(AUTOTB_TVOUT_h);
CodeState = DUMP_INPUTS;
std::vector<__cosim_s7__> __xlx_apatb_param_in_data_stream_buf;
{
  while (!((hls::stream<__cosim_s7__>*)__xlx_apatb_param_in_data)->empty())
    __xlx_apatb_param_in_data_stream_buf.push_back(((hls::stream<__cosim_s7__>*)__xlx_apatb_param_in_data)->read());
  for (int i = 0; i < __xlx_apatb_param_in_data_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s7__>*)__xlx_apatb_param_in_data)->write(__xlx_apatb_param_in_data_stream_buf[i]);
  }
long __xlx_apatb_param_in_data_stream_buf_size = ((hls::stream<__cosim_s7__>*)__xlx_apatb_param_in_data)->size();
std::vector<__cosim_s7__> __xlx_apatb_param_out_data_stream_buf;
long __xlx_apatb_param_out_data_stream_buf_size = ((hls::stream<__cosim_s7__>*)__xlx_apatb_param_out_data)->size();
// print w Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_w, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_w);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_w, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.w_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_w, __xlx_sprintf_buffer.data());
}
// print h Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_h, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_h);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_h, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.h_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_h, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
Sobel_hw_stub_wrapper(__xlx_apatb_param_in_data, __xlx_apatb_param_out_data, __xlx_apatb_param_w, __xlx_apatb_param_h);
CodeState = DUMP_OUTPUTS;
long __xlx_apatb_param_in_data_stream_buf_final_size = __xlx_apatb_param_in_data_stream_buf_size - ((hls::stream<__cosim_s7__>*)__xlx_apatb_param_in_data)->size();

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_data_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_data_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_data_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_data_V_user_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_data_V_last_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_data_V_id_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_data_V_dest_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_in_data_stream_buf_final_size; j != e; ++j) {
sc_bv<56> __xlx_tmp_lv = ((long long*)&__xlx_apatb_param_in_data_stream_buf[j])[0];
sc_bv<8> __xlx_tmp_0_lv = __xlx_tmp_lv.range(7, 0);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_in_data_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = __xlx_tmp_lv.range(15, 8);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_in_data_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = __xlx_tmp_lv.range(23, 16);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_in_data_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_3_lv = __xlx_tmp_lv.range(31, 24);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_3_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_in_data_V_user_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_4_lv = __xlx_tmp_lv.range(39, 32);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_in_data_V_last_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_5_lv = __xlx_tmp_lv.range(47, 40);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_5_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_in_data_V_id_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_6_lv = __xlx_tmp_lv.range(55, 48);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_6_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_in_data_V_dest_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_in_data_stream_buf_final_size, &tcl_file.in_data_V_data_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_data_V_data_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_in_data_stream_buf_final_size, &tcl_file.in_data_V_keep_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_data_V_keep_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_in_data_stream_buf_final_size, &tcl_file.in_data_V_strb_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_data_V_strb_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_in_data_stream_buf_final_size, &tcl_file.in_data_V_user_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_data_V_user_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_in_data_stream_buf_final_size, &tcl_file.in_data_V_last_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_data_V_last_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_in_data_stream_buf_final_size, &tcl_file.in_data_V_id_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_data_V_id_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_in_data_stream_buf_final_size, &tcl_file.in_data_V_dest_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_data_V_dest_V, __xlx_sprintf_buffer.data());

// dump stream ingress status to file

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_data_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_in_data_stream_buf_final_size > 0) {
  long in_data_V_data_V_stream_ingress_size = __xlx_apatb_param_in_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_data_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_in_data_stream_buf_final_size; j != e; j++) {
    in_data_V_data_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_data_V, __xlx_sprintf_buffer.data());
  }
} else {
  long in_data_V_data_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_data_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_data_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_keep_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_in_data_stream_buf_final_size > 0) {
  long in_data_V_keep_V_stream_ingress_size = __xlx_apatb_param_in_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_keep_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_in_data_stream_buf_final_size; j != e; j++) {
    in_data_V_keep_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_keep_V, __xlx_sprintf_buffer.data());
  }
} else {
  long in_data_V_keep_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_keep_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_keep_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_strb_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_in_data_stream_buf_final_size > 0) {
  long in_data_V_strb_V_stream_ingress_size = __xlx_apatb_param_in_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_strb_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_in_data_stream_buf_final_size; j != e; j++) {
    in_data_V_strb_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_strb_V, __xlx_sprintf_buffer.data());
  }
} else {
  long in_data_V_strb_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_strb_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_strb_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_user_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_in_data_stream_buf_final_size > 0) {
  long in_data_V_user_V_stream_ingress_size = __xlx_apatb_param_in_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_user_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_user_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_in_data_stream_buf_final_size; j != e; j++) {
    in_data_V_user_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_user_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_user_V, __xlx_sprintf_buffer.data());
  }
} else {
  long in_data_V_user_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_user_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_user_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_user_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_last_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_in_data_stream_buf_final_size > 0) {
  long in_data_V_last_V_stream_ingress_size = __xlx_apatb_param_in_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_in_data_stream_buf_final_size; j != e; j++) {
    in_data_V_last_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_last_V, __xlx_sprintf_buffer.data());
  }
} else {
  long in_data_V_last_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_last_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_last_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_id_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_in_data_stream_buf_final_size > 0) {
  long in_data_V_id_V_stream_ingress_size = __xlx_apatb_param_in_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_id_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_id_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_in_data_stream_buf_final_size; j != e; j++) {
    in_data_V_id_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_id_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_id_V, __xlx_sprintf_buffer.data());
  }
} else {
  long in_data_V_id_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_id_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_id_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_id_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_dest_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_in_data_stream_buf_final_size > 0) {
  long in_data_V_dest_V_stream_ingress_size = __xlx_apatb_param_in_data_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_dest_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_dest_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_in_data_stream_buf_final_size; j != e; j++) {
    in_data_V_dest_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_dest_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_dest_V, __xlx_sprintf_buffer.data());
  }
} else {
  long in_data_V_dest_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", in_data_V_dest_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_dest_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_in_data_V_dest_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_data_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_in_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_data_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_data_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_keep_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_in_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_keep_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_keep_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_strb_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_in_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_strb_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_strb_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_user_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_in_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_user_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_user_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_last_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_in_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_last_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_last_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_id_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_in_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_id_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_id_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_dest_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_in_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_dest_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_in_data_V_dest_V, __xlx_sprintf_buffer.data());
}
//********************** dump C output stream *******************
long __xlx_apatb_param_out_data_stream_buf_final_size = ((hls::stream<__cosim_s7__>*)__xlx_apatb_param_out_data)->size() - __xlx_apatb_param_out_data_stream_buf_size;
{
  while (!((hls::stream<__cosim_s7__>*)__xlx_apatb_param_out_data)->empty())
    __xlx_apatb_param_out_data_stream_buf.push_back(((hls::stream<__cosim_s7__>*)__xlx_apatb_param_out_data)->read());
  for (int i = 0; i < __xlx_apatb_param_out_data_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s7__>*)__xlx_apatb_param_out_data)->write(__xlx_apatb_param_out_data_stream_buf[i]);
  }

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_user_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_last_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_id_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_dest_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_out_data_stream_buf_final_size; j != e; ++j) {
sc_bv<56> __xlx_tmp_lv = ((long long*)&__xlx_apatb_param_out_data_stream_buf[__xlx_apatb_param_out_data_stream_buf_size+j])[0];
sc_bv<8> __xlx_tmp_0_lv = __xlx_tmp_lv.range(7, 0);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_data_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = __xlx_tmp_lv.range(15, 8);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_data_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = __xlx_tmp_lv.range(23, 16);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_data_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_3_lv = __xlx_tmp_lv.range(31, 24);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_3_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_data_V_user_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_4_lv = __xlx_tmp_lv.range(39, 32);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_data_V_last_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_5_lv = __xlx_tmp_lv.range(47, 40);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_5_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_data_V_id_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_6_lv = __xlx_tmp_lv.range(55, 48);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_6_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_data_V_dest_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_out_data_stream_buf_final_size, &tcl_file.out_data_V_data_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_data_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_out_data_stream_buf_final_size, &tcl_file.out_data_V_keep_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_keep_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_out_data_stream_buf_final_size, &tcl_file.out_data_V_strb_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_strb_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_out_data_stream_buf_final_size, &tcl_file.out_data_V_user_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_user_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_out_data_stream_buf_final_size, &tcl_file.out_data_V_last_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_last_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_out_data_stream_buf_final_size, &tcl_file.out_data_V_id_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_id_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_out_data_stream_buf_final_size, &tcl_file.out_data_V_dest_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_data_V_dest_V, __xlx_sprintf_buffer.data());
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_data_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_data_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_data_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_keep_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_keep_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_keep_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_strb_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_strb_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_strb_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_user_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_user_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_user_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_last_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_last_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_last_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_id_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_id_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_id_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_dest_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_dest_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_data_V_dest_V, __xlx_sprintf_buffer.data());
}CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
