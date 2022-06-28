################################################################################
# IO constraints
################################################################################
# serial:0.tx
set_property LOC D4 [get_ports {serial_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_tx}]

# serial:0.rx
set_property LOC C4 [get_ports {serial_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_rx}]

# clk:0
set_property LOC E3 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# cpu_reset:0
set_property LOC C12 [get_ports {cpu_reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {cpu_reset}]

# led:0
set_property LOC H17 [get_ports {led0}]
set_property IOSTANDARD LVCMOS33 [get_ports {led0}]

# led:1
set_property LOC K15 [get_ports {led1}]
set_property IOSTANDARD LVCMOS33 [get_ports {led1}]

# led:2
set_property LOC J13 [get_ports {led2}]
set_property IOSTANDARD LVCMOS33 [get_ports {led2}]

# led:3
set_property LOC N14 [get_ports {led3}]
set_property IOSTANDARD LVCMOS33 [get_ports {led3}]

# led:4
set_property LOC R18 [get_ports {led4}]
set_property IOSTANDARD LVCMOS33 [get_ports {led4}]

# led:5
set_property LOC V17 [get_ports {led5}]
set_property IOSTANDARD LVCMOS33 [get_ports {led5}]

# led:6
set_property LOC U17 [get_ports {led6}]
set_property IOSTANDARD LVCMOS33 [get_ports {led6}]

# led:7
set_property LOC U16 [get_ports {led7}]
set_property IOSTANDARD LVCMOS33 [get_ports {led7}]

# led:8
set_property LOC V16 [get_ports {led8}]
set_property IOSTANDARD LVCMOS33 [get_ports {led8}]

# led:9
set_property LOC T15 [get_ports {led9}]
set_property IOSTANDARD LVCMOS33 [get_ports {led9}]

# led:10
set_property LOC U14 [get_ports {led10}]
set_property IOSTANDARD LVCMOS33 [get_ports {led10}]

# led:11
set_property LOC T16 [get_ports {led11}]
set_property IOSTANDARD LVCMOS33 [get_ports {led11}]

# led:12
set_property LOC V15 [get_ports {led12}]
set_property IOSTANDARD LVCMOS33 [get_ports {led12}]

# led:13
set_property LOC V14 [get_ports {led13}]
set_property IOSTANDARD LVCMOS33 [get_ports {led13}]

# led:14
set_property LOC V12 [get_ports {led14}]
set_property IOSTANDARD LVCMOS33 [get_ports {led14}]

# led:15
set_property LOC V11 [get_ports {led15}]
set_property IOSTANDARD LVCMOS33 [get_ports {led15}]

# sw:0
set_property LOC J15 [get_ports {sw0}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw0}]

# sw:1
set_property LOC L16 [get_ports {sw1}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw1}]

# sw:2
set_property LOC M13 [get_ports {sw2}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw2}]

# sw:3
set_property LOC R15 [get_ports {sw3}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw3}]

# sw:4
set_property LOC R17 [get_ports {sw4}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw4}]

# sw:5
set_property LOC T18 [get_ports {sw5}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw5}]

# sw:6
set_property LOC U18 [get_ports {sw6}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw6}]

# sw:7
set_property LOC R13 [get_ports {sw7}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw7}]

# sw:8
set_property LOC T8 [get_ports {sw8}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw8}]

# sw:9
set_property LOC U8 [get_ports {sw9}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw9}]

# sw:10
set_property LOC R16 [get_ports {sw10}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw10}]

# sw:11
set_property LOC T13 [get_ports {sw11}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw11}]

# sw:12
set_property LOC H6 [get_ports {sw12}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw12}]

# sw:13
set_property LOC U12 [get_ports {sw13}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw13}]

# sw:14
set_property LOC U11 [get_ports {sw14}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw14}]

# sw:15
set_property LOC V10 [get_ports {sw15}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw15}]

# btnc:0
set_property LOC N17 [get_ports {btnc}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnc}]

# btnr:0
set_property LOC M17 [get_ports {btnr}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnr}]

# btnl:0
set_property LOC P17 [get_ports {btnl}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnl}]

# display_segment:0
set_property LOC T10 [get_ports {display_segment0}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_segment0}]

# display_segment:1
set_property LOC R10 [get_ports {display_segment1}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_segment1}]

# display_segment:2
set_property LOC K16 [get_ports {display_segment2}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_segment2}]

# display_segment:3
set_property LOC K13 [get_ports {display_segment3}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_segment3}]

# display_segment:4
set_property LOC P15 [get_ports {display_segment4}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_segment4}]

# display_segment:5
set_property LOC T11 [get_ports {display_segment5}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_segment5}]

# display_segment:6
set_property LOC L18 [get_ports {display_segment6}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_segment6}]

# display_segment:7
set_property LOC H15 [get_ports {display_segment7}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_segment7}]

# display_digit:0
set_property LOC J17 [get_ports {display_digit0}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_digit0}]

# display_digit:1
set_property LOC J18 [get_ports {display_digit1}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_digit1}]

# display_digit:2
set_property LOC T9 [get_ports {display_digit2}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_digit2}]

# display_digit:3
set_property LOC J14 [get_ports {display_digit3}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_digit3}]

# display_digit:4
set_property LOC P14 [get_ports {display_digit4}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_digit4}]

# display_digit:5
set_property LOC T14 [get_ports {display_digit5}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_digit5}]

# display_digit:6
set_property LOC K2 [get_ports {display_digit6}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_digit6}]

# display_digit:7
set_property LOC U13 [get_ports {display_digit7}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_digit7}]

# ledRGB:1.r
set_property LOC N15 [get_ports {ledRGB1_r}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledRGB1_r}]

# ledRGB:1.g
set_property LOC M16 [get_ports {ledRGB1_g}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledRGB1_g}]

# ledRGB:1.b
set_property LOC R12 [get_ports {ledRGB1_b}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledRGB1_b}]

# ledRGB:2.r
set_property LOC N16 [get_ports {ledRGB2_r}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledRGB2_r}]

# ledRGB:2.g
set_property LOC R11 [get_ports {ledRGB2_g}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledRGB2_g}]

# ledRGB:2.b
set_property LOC G14 [get_ports {ledRGB2_b}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledRGB2_b}]

################################################################################
# Design constraints
################################################################################

set_property INTERNAL_VREF 0.750 [get_iobanks 34]

################################################################################
# Clock constraints
################################################################################


################################################################################
# False path constraints
################################################################################


set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]