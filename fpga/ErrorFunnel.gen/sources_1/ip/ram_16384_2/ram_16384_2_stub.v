// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 17 09:53:11 2023
// Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/SourceCode/Xilinx/ErrorFunnel/ErrorFunnel.gen/sources_1/ip/ram_16384_2/ram_16384_2_stub.v
// Design      : ram_16384_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *)
module ram_16384_2(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[13:0],dina[1:0],clkb,enb,addrb[13:0],doutb[1:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [13:0]addra;
  input [1:0]dina;
  input clkb;
  input enb;
  input [13:0]addrb;
  output [1:0]doutb;
endmodule
