/*
 * @Filename: 
 * @Author: ws
 * @Description: 
 * @Date: 2023-11-15 10:08:37
 * @LastEditTime: 2023-11-15 10:50:14
 * @Company: 662
 */

module Delay_2clock#(
    parameter   WIDTH = 50
)(
     input                  i_clk
    ,input                  i_rst_n
    ,input      [WIDTH-1:0] i_data
    ,input                  i_data_en
    ,output reg [WIDTH-1:0] o_data_delay_2
    ,output reg             o_data_en_delay_2   
);

reg [WIDTH-1:0] data_delay_1;
reg             data_en_delay_1;

always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        data_delay_1 <= {(WIDTH){1'b0}};
        data_en_delay_1 <= 1'b0;
        o_data_delay_2 <= {(WIDTH){1'b0}};
        o_data_en_delay_2 <= 1'b0;
    end
    else begin
        data_delay_1 <= i_data;
        data_en_delay_1 <= i_data_en;
        o_data_delay_2 <= data_delay_1;
        o_data_en_delay_2 <= data_en_delay_1;
    end
end

endmodule
