/*
 * @Filename: 
 * @Author: ws
 * @Description: 
 * @Date: 2023-11-17 09:28:18
 * @LastEditTime: 2023-11-17 09:53:16
 * @Company: 662
 */
`timescale 1ns/1ps
module ErrorFunnel_tb();

//define parameter
parameter CLK_HALF_PERIOD = 4;
parameter RST_END = 100;
parameter SIMULATE_END = 2000;
parameter SEND_START = 200;
parameter SEND_CONTINUE = 1600;

//define inputs
reg             clk_tb;
reg             rst_n_tb;
reg             start_tb;
//define outputs
wire    [31:0]  sended_num;
//define median
wire    [31:0]  e;
wire    [31:0]  f;
wire            valid; 

//generate clock
initial begin
    clk_tb = 1'b0;
    forever begin
        #CLK_HALF_PERIOD clk_tb = ~clk_tb;
    end
end

//generate reset_n
initial begin
    rst_n_tb = 1'b0;
    #RST_END rst_n_tb = 1'b1;
end

//generate start_signal
initial begin
    start_tb = 1'b0;
    #SEND_START start_tb = 1'b1;
    #SEND_CONTINUE  start_tb = 1'b0;
                    $display("%d elements have been sended.\n", sended_num);
end

//generate wave
initial begin
    $dumpfile("cocosketch_tb_wave.vcd");
    $dumpvars(0, CocoSketch_tb);
    #SIMULATE_END $finish;
end

el_send el_send_inst(
     .clk       (clk_tb)
    ,.rst_n     (rst_n_tb)
    ,.start     (start_tb)
    ,.e         (e)
    ,.f         (f)
    ,.valid     (valid)
    ,.num       (sended_num)
);

ErrorFunnel_Top u_errorfunnel_top(
     .clk       (clk_tb)
    ,.rst_n     (rst_n_tb)
    ,.i_uv      ({e,f})
    ,.i_uv_en   (valid)
);

endmodule
