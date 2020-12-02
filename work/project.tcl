set projDir "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/vivado"
set projName "ButtonSmash"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/au_top_0.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/reset_conditioner_1.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/button_manager_2.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/control_unit_3.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/alu_whole_4.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/segment_manager_5.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/button_conditioner_6.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/pn_gen_7.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/alu_adder_8.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/alu_boolean_9.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/alu_shifter_10.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/alu_compare_11.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/pipeline_12.v" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/verilog/alu_multiply_13.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/constraint/constraints.xdc" "C:/Users/Harshit\ Garg/Downloads/ButtonSmash/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
