#create_clock -name clk -period 10.000 -waveform { 0.000 5.000 } [get_ports {i_clk}]
create_clock -name clk -period 4 [get_ports i_clk]