
set TopModule "Blur"
set ClockPeriod 10
set ClockList ap_clk
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 1
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 1
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set ResetRegisterNum 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix Blur_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xc7z020:-clg400:-1
set SourceFiles {sc {} c ../blur.cpp}
set SourceFlags {sc {} c {{}}}
set DirectiveFile C:/PYNQ/PYNQ-master/PYNQ-master/boards/ip/Gaussian_Blur/solution1/solution1.directive
set TBFiles {verilog {../test_bench.cpp ../blur.cpp ../Homer_blurred.txt ../Homer_Grey2.txt ../Homer_Grey1.txt ../Homer_Grey.txt} bc {../test_bench.cpp ../blur.cpp ../Homer_blurred.txt ../Homer_Grey2.txt ../Homer_Grey1.txt ../Homer_Grey.txt} sc {../test_bench.cpp ../blur.cpp ../Homer_blurred.txt ../Homer_Grey2.txt ../Homer_Grey1.txt ../Homer_Grey.txt} vhdl {../test_bench.cpp ../blur.cpp ../Homer_blurred.txt ../Homer_Grey2.txt ../Homer_Grey1.txt ../Homer_Grey.txt} c {} cas {../test_bench.cpp ../blur.cpp ../Homer_blurred.txt ../Homer_Grey2.txt ../Homer_Grey1.txt ../Homer_Grey.txt}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set TBInstNames {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../hls.app
set ApsFile solution1.aps
set AvePath ../..
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 0
set PlatformFiles {{DefaultPlatform {xilinx/zynq/zynq xilinx/zynq/zynq_fpv6}}}
set HPFPO 0
