/*
 * @Filename: 
 * @Author: ws
 * @Description: send simulated element<e,f> 
 * @Date: 2023-02-15 21:48:18
 * @LastEditTime: 2023-02-25 09:22:30
 * @Company: 662
 */

module el_send(
    /****************clock****************/
     input wire         clk
    ,input wire         rst_n

    /************input element************/
    ,input wire         start

    /***********output element************/
    ,output reg [31:0]  e
    ,output reg [31:0]  f
    ,output reg         valid
    ,output reg [31:0]  num

    /**************Localbus***************/
);

localparam  E_RANGE = 256,
            F_RANGE = 256;

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        e <= 32'b0;
        f <= 32'b0;
        valid <= 1'b0;
        num <= 32'b0;
    end

    else begin
        if(start)begin
            e <= 1'b1 + {$random} % E_RANGE;
            f <= 1'b1 + {$random} % F_RANGE;
            valid <= 1'b1;
            num <= num + 1'b1;
        end

        else begin
            e <= 32'b0;
            f <= 32'b0;
            valid <= 1'b0;
            num <= num;            
        end
    end
end

endmodule
