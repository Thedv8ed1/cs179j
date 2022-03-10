################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../blur.cpp \
../test_bench.cpp 

OBJS += \
./testbench/blur.o \
./testbench/test_bench.o 

CPP_DEPS += \
./testbench/blur.d \
./testbench/test_bench.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/blur.o: C:/PYNQ/PYNQ-master/PYNQ-master/boards/ip/Gaussian_Blur/blur.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -IC:/PYNQ/PYNQ-master/PYNQ-master/boards/ip -IC:/Xilinx/Vitis_HLS/2020.2/include/ap_sysc -IC:/Xilinx/Vitis_HLS/2020.2/win64/tools/systemc/include -IC:/Xilinx/Vitis_HLS/2020.2/include/etc -IC:/Xilinx/Vitis_HLS/2020.2/include -IC:/Xilinx/Vitis_HLS/2020.2/win64/tools/auto_cc/include -O0 -g3 -Wall -Wno-unknown-pragmas -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/blur.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

testbench/test_bench.o: C:/PYNQ/PYNQ-master/PYNQ-master/boards/ip/Gaussian_Blur/test_bench.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -IC:/PYNQ/PYNQ-master/PYNQ-master/boards/ip -IC:/Xilinx/Vitis_HLS/2020.2/include/ap_sysc -IC:/Xilinx/Vitis_HLS/2020.2/win64/tools/systemc/include -IC:/Xilinx/Vitis_HLS/2020.2/include/etc -IC:/Xilinx/Vitis_HLS/2020.2/include -IC:/Xilinx/Vitis_HLS/2020.2/win64/tools/auto_cc/include -O0 -g3 -Wall -Wno-unknown-pragmas -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/test_bench.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


