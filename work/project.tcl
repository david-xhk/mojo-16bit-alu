set projDir "C:/Users/PC_01/Desktop/ALU/work/planAhead"
set projName "ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/PC_01/Desktop/ALU/work/verilog/mojo_top_0.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/shifter_1.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/boolean_2.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/adder_3.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/compare_4.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/alu_5.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/reset_conditioner_6.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/multi_seven_seg_7.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/basic_tester_8.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/basic_tester_9.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/tester_10.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/basic_tester_11.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/basic_tester_12.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/tester_13.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/basic_tester_14.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/basic_tester_15.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/tester_16.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/basic_tester_17.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/basic_tester_18.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/tester_19.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/basic_tester_20.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/basic_tester_21.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/tester_22.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/seven_seg_lut_23.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/decoder_24.v" "C:/Users/PC_01/Desktop/ALU/work/verilog/counter_25.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/PC_01/Desktop/ALU/constraint/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
