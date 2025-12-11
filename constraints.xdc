set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {in_clk_IBUF}]

# Clock input mapped to PUSH switch (arrow key)
set_property PACKAGE_PIN E21 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# Active-low reset button
set_property PACKAGE_PIN U7 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]

# Sequence detector input from DIP switch 0
set_property PACKAGE_PIN J4 [get_ports {i}]
set_property IOSTANDARD LVCMOS33 [get_ports {i}]

# Output LED0
set_property PACKAGE_PIN F15 [get_ports {out}]
set_property IOSTANDARD LVCMOS33 [get_ports {out}]

