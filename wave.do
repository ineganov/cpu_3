onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/CLK
add wave -noupdate /testbench/CLK_MEM
add wave -noupdate /testbench/RESET
add wave -noupdate -divider Imem
add wave -noupdate -radix hexadecimal /testbench/INST_ADDR
add wave -noupdate -radix hexadecimal /testbench/INST_RD
add wave -noupdate -radix hexadecimal /testbench/uut_mcpu/the_datapath/pc
add wave -noupdate -radix hexadecimal /testbench/uut_mcpu/the_datapath/next_pc_reg
add wave -noupdate -divider Dmem
add wave -noupdate /testbench/dmem/WE
add wave -noupdate -radix hexadecimal /testbench/dmem/ADDR
add wave -noupdate -radix hexadecimal /testbench/dmem/WD
add wave -noupdate /testbench/dmem/BE
add wave -noupdate /testbench/dmem/RAM
add wave -noupdate -divider Fetch
add wave -noupdate /testbench/uut_mcpu/the_datapath/NOT_IMPLTD
add wave -noupdate -divider Coprocessor0
add wave -noupdate -radix hexadecimal /testbench/uut_mcpu/cop0/DEC_STAGE_ADDR
add wave -noupdate /testbench/uut_mcpu/cop0/exception_occured
add wave -noupdate -radix hexadecimal /testbench/uut_mcpu/cop0/cause_q
add wave -noupdate -radix hexadecimal /testbench/uut_mcpu/cop0/epc_q
add wave -noupdate -radix unsigned /testbench/uut_mcpu/cop0/CP0_REG_SELECT
add wave -noupdate -radix hexadecimal /testbench/uut_mcpu/cop0/CP0_REG_OUT
add wave -noupdate -divider Regfile
add wave -noupdate /testbench/uut_mcpu/the_datapath/rf_unit/WE
add wave -noupdate -radix hexadecimal /testbench/uut_mcpu/the_datapath/rf_unit/W_DATA
add wave -noupdate -radix unsigned /testbench/uut_mcpu/the_datapath/rf_unit/WR_ADDR_3
add wave -noupdate -radix hexadecimal -childformat {{{/testbench/uut_mcpu/the_datapath/rf_unit/rf[31]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[30]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[29]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[28]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[27]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[26]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[25]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[24]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[23]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[22]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[21]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[20]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[19]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[18]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[17]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[16]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[15]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[14]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[13]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[12]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[11]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[10]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[9]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[8]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[7]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[6]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[5]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[4]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[3]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[2]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[1]} -radix hexadecimal} {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[0]} -radix hexadecimal}} -expand -subitemconfig {{/testbench/uut_mcpu/the_datapath/rf_unit/rf[31]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[30]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[29]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[28]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[27]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[26]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[25]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[24]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[23]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[22]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[21]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[20]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[19]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[18]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[17]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[16]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[15]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[14]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[13]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[12]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[11]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[10]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[9]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[8]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[7]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[6]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[5]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[4]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[3]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[2]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[1]} {-height 18 -radix hexadecimal} {/testbench/uut_mcpu/the_datapath/rf_unit/rf[0]} {-height 18 -radix hexadecimal}} /testbench/uut_mcpu/the_datapath/rf_unit/rf
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {200000 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {96169 ps} {335059 ps}
