
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "../../DFT/$top_module.svf"

######################### Reference Container ############################

## Read Reference technology libraries
set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"
read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

## Read Reference Design Files
read_verilog -container Ref "/home/IC/Projects/System/RTL/ALU/ALU.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/Clock_Divider/ClkDiv.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/Clock_Gating/CLK_GATE.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/data_sync/data_sync.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/RegFile/RegFile.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/RST_SYNC/RST_SYNC.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/SYS_CTRL/CTRL_RX.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/SYS_CTRL/CTRL_TX.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/SYS_CTRL/SYS_CTRL.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_RX/RTL/data_sampling.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_RX/RTL/deserializer.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_RX/RTL/edge_bit_counter.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_RX/RTL/par_chk.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_RX/RTL/stp_chk.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_RX/RTL/strt_chk.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_RX/RTL/UART_RX.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_RX/RTL/uart_rx_fsm.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_TX/RTL/mux.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_TX/RTL/parity_calc.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_TX/RTL/Serializer.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_TX/RTL/UART_TX.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART_TX/RTL/uart_tx_fsm.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/UART/UART.v"
read_verilog -container Ref "/home/IC/Projects/System/RTL/SYS_TOP/SYS_TOP_dft.v"

## set the top Reference Design 
set_reference_design $top_module
set_top $top_module

######################## Implementation Container #########################

## Read Implementation technology libraries
read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files
read_verilog -container Imp -netlist "../../DFT/netlists/$top_module.v"
 
## set the top Implementation Design
set_implementation_design $top_module
set_top $top_module

############################### Don't verify #################################

# do not verify scan in & scan out ports as a compare point as it is existed only after synthesis and not existed in the RTL

#scan in
set_dont_verify_points -type port Ref:/WORK/*/*SCAN_IN*[*]
set_dont_verify_points -type port Imp:/WORK/*/*SCAN_IN*[*]

#scan_out
set_dont_verify_points -type port Ref:/WORK/*/*SCAN_OUT*[*]
set_dont_verify_points -type port Imp:/WORK/*/*SCAN_OUT*[*]

############################### constants #####################################

# all atpg enable(test_mode, scan_enable) are zero during formal compare

#test_mode
set_constant Ref:/WORK/SYS_TOP/TEST_MODE 0
set_constant Imp:/WORK/SYS_TOP/TEST_MODE 0

#scan_enable
set_constant Ref:/WORK/*/SCAN_EN 0
set_constant Imp:/WORK/*/SCAN_EN 0


########################### matching Compare points ##########################

match

################################# verify #####################################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
