set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN Y9 [get_ports clk]

set_property IOSTANDARD LVCMOS18 [get_ports rst]
set_property PACKAGE_PIN P16 [get_ports rst]

set_property IOSTANDARD LVCMOS18 [get_ports in]
set_property PACKAGE_PIN M15 [get_ports in]

set_property IOSTANDARD LVCMOS33 [get_ports {moore_out[2]}]
set_property PACKAGE_PIN U22 [get_ports {moore_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {moore_out[1]}]
set_property PACKAGE_PIN T21 [get_ports {moore_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {moore_out[0]}]
set_property PACKAGE_PIN T22 [get_ports {moore_out[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {mealy_out[2]}]
set_property PACKAGE_PIN U14 [get_ports {mealy_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mealy_out[1]}]
set_property PACKAGE_PIN U19 [get_ports {mealy_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mealy_out[0]}]
set_property PACKAGE_PIN W22 [get_ports {mealy_out[0]}]