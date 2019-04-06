# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache ./.Xil/Vivado-52078-ubuntu/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a12ticsg325-1L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.cache/wt [current_project]
set_property parent.project_path /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/ID_IE.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/IE_IM.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/IF_ID.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/IM_IW.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/alu.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/conflict_control.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/controller.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/dm.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/dmux_32.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/ext.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/gpr.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/im.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/left_2.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/mux.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/mux_5.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/pc.v
  /home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.srcs/sources_1/new/mips.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top mips -part xc7a12ticsg325-1L


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef mips.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file mips_utilization_synth.rpt -pb mips_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
