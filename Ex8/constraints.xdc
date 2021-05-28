##############################################
# Part         - xcvu9p
# Package      - fsgd2104
# Speed grade  - -2L
# Xilinx Reference Board is VCU1525
###############################################################################

# clock
set_property PACKAGE_PIN BD21 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]
set_property PULLUP true [get_ports rst_n]

set_property PACKAGE_PIN AY38 [get_ports clk_n]
set_property IOSTANDARD DIFF_SSTL12 [get_ports clk_n]

set_property PACKAGE_PIN AY37 [get_ports clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports clk_p]

create_clock -period 10 -name clk [get_ports clk_p]
set_clock_groups -asynchronous -group [get_clocks clk -include_generated_clocks]

# temperature sensors
set_property -dict {LOC BC21 IOSTANDARD LVCMOS18} [get_ports temperature_0]
set_property -dict {LOC BB21 IOSTANDARD LVCMOS18} [get_ports temperature_1]
set_property -dict {LOC BA20 IOSTANDARD LVCMOS18} [get_ports temperature_2]
set_property -dict {LOC AL20 IOSTANDARD LVCMOS18} [get_ports temperature_3]
set_property -dict {LOC AT20 IOSTANDARD LVCMOS18} [get_ports temperature_4]

# output 
set_property -dict {LOC AU22 IOSTANDARD LVCMOS18} [get_ports heating]
set_property -dict {LOC AT22 IOSTANDARD LVCMOS18} [get_ports cooling]


# General configuration - Do not modify
set_property CFGBVS GND                                [current_design]
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {DIV-1} [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]

#############################################################################################################




