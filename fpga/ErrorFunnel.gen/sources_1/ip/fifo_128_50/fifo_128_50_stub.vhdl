-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Fri Nov 17 09:56:08 2023
-- Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/SourceCode/Xilinx/ErrorFunnel/ErrorFunnel.gen/sources_1/ip/fifo_128_50/fifo_128_50_stub.vhdl
-- Design      : fifo_128_50
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fifo_128_50 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 49 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 49 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );

end fifo_128_50;

architecture stub of fifo_128_50 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,din[49:0],wr_en,rd_en,dout[49:0],full,empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_2_5,Vivado 2020.2";
begin
end;
