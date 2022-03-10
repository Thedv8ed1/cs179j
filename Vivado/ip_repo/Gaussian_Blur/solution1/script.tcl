############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Gaussian_Blur
set_top Blur
add_files Gaussian_Blur/Homer_grey2.txt
add_files Gaussian_Blur/blur.cpp
add_files -tb Gaussian_Blur/test_bench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb Gaussian_Blur/blur.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb Gaussian_Blur/Homer_blurred.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb Gaussian_Blur/Homer_Grey2.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb Gaussian_Blur/Homer_Grey1.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb Gaussian_Blur/Homer_Grey.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output C:/PYNQ/PYNQ-master/PYNQ-master/boards/ip/Gaussian_Blur/Blur.zip -rtl verilog
source "./Gaussian_Blur/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output C:/PYNQ/PYNQ-master/PYNQ-master/boards/ip/Gaussian_Blur/Blur.zip
