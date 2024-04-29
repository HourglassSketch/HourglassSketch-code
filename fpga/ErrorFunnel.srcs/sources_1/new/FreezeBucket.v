/*
 * @Filename: 
 * @Author: ws
 * @Description: 
 * @Date: 2023-11-15 11:13:10
 * @LastEditTime: 2023-11-15 16:58:48
 * @Company: 662
 */

module FreezeBucket(
     input                      i_clk
    ,input                      i_rst_n  

    ,input      [1:0]           i_indicator //00->updateï¼?01->find, 10->zero
    ,input                      i_indicator_en
    ,input      [10:0]          i_freeze_addr
    ,input      [15:0]          i_freeze_hash

    ,output reg [15:0]          o_freeze_cnt
    ,output reg                 o_freeze_find_state //0->No find or successï¼?1->fail
    ,output reg [10:0]          o_freeeze_offset
    ,output reg                 o_freeze_end                     
);

//* freezing bucket Memory
reg     [10:0]              ram_wr_addr_freeze;
reg     [16:0]              ram_wr_data_freeze;
reg                         ram_wr_en_freeze;
reg     [10:0]              ram_rd_addr_freeze;
wire    [16:0]              ram_rd_data_freeze;
reg                         ram_rd_en_freeze;

reg     [3:0]       read_memory_state;
reg     [11:0]      temp_freeze_hash;
//* read memory
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        ram_rd_addr_freeze <= 11'b0;
        ram_rd_en_freeze <= 1'b0;
        read_memory_state <= 4'b0;
        temp_freeze_hash <= 12'b0;
    end
    else begin
        case(read_memory_state)
            4'd0:begin
                if((2'b00==i_indicator) && i_indicator_en)begin         //update
                    ram_rd_addr_freeze <= i_freeze_addr;
                    ram_rd_en_freeze <= 1'b1;
                end
                else if((2'b10==i_indicator) && i_indicator_en)begin    //zero
                    ram_rd_addr_freeze <= i_freeze_addr;
                    ram_rd_en_freeze <= 1'b1;
                end
                else if((2'b01==i_indicator) && i_indicator_en)begin    //find
                    ram_rd_addr_freeze <= (((i_freeze_hash[15:8]<<6)+i_freeze_hash[7:0])>>2);
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd1;
                    temp_freeze_hash <= (i_freeze_hash[15:8]<<6)+i_freeze_hash[7:0];
                end
                else begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                end
            end
            4'd1:begin
                if(o_freeze_end)begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                    read_memory_state <= 4'd0;
                end
                else begin
                    ram_rd_addr_freeze <= (temp_freeze_hash>>3)+11'd1024;
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd2;
                end
            end
            4'd2:begin
                if(o_freeze_end)begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                    read_memory_state <= 4'd0;
                end
                else begin
                    ram_rd_addr_freeze <= (temp_freeze_hash>>4)+11'd1536;
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd3;
                end
            end
            4'd3:begin
                if(o_freeze_end)begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                    read_memory_state <= 4'd0;
                end
                else begin
                    ram_rd_addr_freeze <= (temp_freeze_hash>>5)+11'd1792;
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd4;
                end
            end
            4'd4:begin
                if(o_freeze_end)begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                    read_memory_state <= 4'd0;
                end
                else begin
                    ram_rd_addr_freeze <= (temp_freeze_hash>>6)+11'd1920;
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd5;
                end
            end
            4'd5:begin
                if(o_freeze_end)begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                    read_memory_state <= 4'd0;
                end
                else begin
                    ram_rd_addr_freeze <= (temp_freeze_hash>>7)+11'd1984;
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd6;
                end
            end
            4'd6:begin
                if(o_freeze_end)begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                    read_memory_state <= 4'd0;
                end
                else begin
                    ram_rd_addr_freeze <= (temp_freeze_hash>>8)+11'd2016;
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd7;
                end
            end
            4'd7:begin
                if(o_freeze_end)begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                    read_memory_state <= 4'd0;
                end
                else begin
                    ram_rd_addr_freeze <= (temp_freeze_hash>>9)+11'd2032;
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd8;
                end
            end
            4'd8:begin
                if(o_freeze_end)begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                    read_memory_state <= 4'd0;
                end
                else begin
                    ram_rd_addr_freeze <= (temp_freeze_hash>>10)+11'd2040;
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd9;
                end
            end
            4'd9:begin
                if(o_freeze_end)begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                    read_memory_state <= 4'd0;
                end
                else begin
                    ram_rd_addr_freeze <= (temp_freeze_hash>>11)+11'd2044;
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd10;
                end
            end
            4'd10:begin
                if(o_freeze_end)begin
                    ram_rd_addr_freeze <= 11'b0;
                    ram_rd_en_freeze <= 1'b0;
                    read_memory_state <= 4'd0;
                end
                else begin
                    ram_rd_addr_freeze <= (temp_freeze_hash>>12)+11'd2046;
                    ram_rd_en_freeze <= 1'b1;
                    read_memory_state <= 4'd0;
                end
            end
            default:begin
                read_memory_state <= 4'b0;
            end
        endcase
    end
end
wire [1:0]   i_indicator_delay2;
wire         i_indicator_en_delay2;
wire [10:0]  i_freeze_addr_delay2;
wire [11:0]  i_freeze_hash_delay2;
Delay_2clock#(
     .WIDTH             (2)
)u_delay_2clock_indicator
(
     .i_clk             (i_clk)
    ,.i_rst_n           (i_rst_n)
    ,.i_data            (i_indicator)
    ,.i_data_en         (i_indicator_en)
    ,.o_data_delay_2    (i_indicator_delay2)
    ,.o_data_en_delay_2 (i_indicator_en_delay2)
);
Delay_2clock#(
     .WIDTH             (11)
)u_delay_2clock_freeze_addr
(
     .i_clk             (i_clk)
    ,.i_rst_n           (i_rst_n)
    ,.i_data            (i_freeze_addr)
    ,.i_data_en         (i_indicator_en)
    ,.o_data_delay_2    (i_freeze_addr_delay2)
    ,.o_data_en_delay_2 ()
);
Delay_2clock#(
     .WIDTH             (12)
)u_delay_2clock_freeze_hash
(
     .i_clk             (i_clk)
    ,.i_rst_n           (i_rst_n)
    ,.i_data            ({i_freeze_hash[13:8],i_freeze_hash[5:0]})
    ,.i_data_en         (i_indicator_en)
    ,.o_data_delay_2    (i_freeze_hash_delay2)
    ,.o_data_en_delay_2 ()
);


//*update & zero & find
reg [3:0]   opr_state;
reg [11:0]  temp_freeze_hash_opr;
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        o_freeze_cnt <= 16'b0;
        o_freeze_find_state <= 1'b0;
        o_freeeze_offset <= 11'b0; 
        o_freeze_end <= 1'b0;
        ram_wr_addr_freeze <= 11'b0;
        ram_wr_data_freeze <= 17'b0;
        ram_wr_en_freeze <= 1'b0;
        opr_state <= 4'd0;
        temp_freeze_hash_opr <= 12'b0;
    end
    else begin
        case(opr_state)
            4'd0:begin
                if((2'b00==i_indicator_delay2) && i_indicator_en_delay2)begin
                    o_freeze_cnt <= ram_rd_data_freeze[15:0];
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= 11'b0; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= i_freeze_addr_delay2;
                    ram_wr_data_freeze[16] <= ram_rd_data_freeze[16];
                    ram_wr_data_freeze[15:0] <= ram_rd_data_freeze[15:0] + 1'b1;
                    ram_wr_en_freeze <= 1'b1;
                end
                else if((2'b10==i_indicator_delay2) && i_indicator_en_delay2)begin
                    o_freeze_cnt <= ram_rd_data_freeze[15:0];
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= 11'b0;
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= i_freeze_addr_delay2;
                    ram_wr_data_freeze[16:0] <= 17'b0;
                    ram_wr_en_freeze <= 1'b1;
                end
                else if((2'b01==i_indicator_delay2) && i_indicator_en_delay2)begin
                    if(!ram_rd_data_freeze[16])begin
                        o_freeze_cnt <= 16'd1;
                        o_freeze_find_state <= 1'b0;
                        o_freeeze_offset <= (i_freeze_hash_delay2>>2); 
                        o_freeze_end <= 1'b1;
                        ram_wr_addr_freeze <= (i_freeze_hash_delay2>>2);
                        ram_wr_data_freeze[16] <= 1'b1;
                        ram_wr_data_freeze[15:0] <= 16'd1;
                        ram_wr_en_freeze <= 1'b1;
                    end
                    else begin
                        o_freeze_cnt <= 16'd0;
                        o_freeze_find_state <= 1'b0;
                        o_freeeze_offset <= 11'b0;
                        o_freeze_end <= 1'b0;
                        ram_wr_addr_freeze <= 11'b0;
                        ram_wr_data_freeze[16:0] <= 17'b0;
                        ram_wr_en_freeze <= 1'b0;
                        opr_state <= 4'd1;
                        temp_freeze_hash_opr <= i_freeze_hash_delay2;
                    end
                end
                else begin
                    o_freeze_cnt <= 16'b0;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= 11'b0;
                    o_freeze_end <= 1'b0;
                    ram_wr_addr_freeze <= 11'b0;
                    ram_wr_data_freeze <= 17'b0;
                    ram_wr_en_freeze <= 1'b0;
                end
            end
            4'd1:begin
                if(!ram_rd_data_freeze[16])begin
                    o_freeze_cnt <= 16'd1;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= (temp_freeze_hash_opr>>3) + 11'd1024; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= (temp_freeze_hash_opr>>3) + 11'd1024;
                    ram_wr_data_freeze[16] <= 1'b1;
                    ram_wr_data_freeze[15:0] <= 16'd1;
                    ram_wr_en_freeze <= 1'b1;
                    opr_state <= 4'd0;
                    temp_freeze_hash_opr <= 12'b0;
                end
                else begin
                    opr_state <= 4'd2;
                end
            end
            4'd2:begin
                if(!ram_rd_data_freeze[16])begin
                    o_freeze_cnt <= 16'd1;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= (temp_freeze_hash_opr>>4) + 11'd1536; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= (temp_freeze_hash_opr>>4) + 11'd1536;
                    ram_wr_data_freeze[16] <= 1'b1;
                    ram_wr_data_freeze[15:0] <= 16'd1;
                    ram_wr_en_freeze <= 1'b1;
                    opr_state <= 4'd0;
                    temp_freeze_hash_opr <= 12'b0;
                end
                else begin
                    opr_state <= 4'd3;
                end
            end
            4'd3:begin
                if(!ram_rd_data_freeze[16])begin
                    o_freeze_cnt <= 16'd1;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= (temp_freeze_hash_opr>>5) + 11'd1792; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= (temp_freeze_hash_opr>>5) + 11'd1792;
                    ram_wr_data_freeze[16] <= 1'b1;
                    ram_wr_data_freeze[15:0] <= 16'd1;
                    ram_wr_en_freeze <= 1'b1;
                    opr_state <= 4'd0;
                    temp_freeze_hash_opr <= 12'b0;
                end
                else begin
                    opr_state <= 4'd4;
                end
            end
            4'd4:begin
                if(!ram_rd_data_freeze[16])begin
                    o_freeze_cnt <= 16'd1;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= (temp_freeze_hash_opr>>6) + 11'd1920; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= (temp_freeze_hash_opr>>6) + 11'd1920;
                    ram_wr_data_freeze[16] <= 1'b1;
                    ram_wr_data_freeze[15:0] <= 16'd1;
                    ram_wr_en_freeze <= 1'b1;
                    opr_state <= 4'd0;
                    temp_freeze_hash_opr <= 12'b0;
                end
                else begin
                    opr_state <= 4'd5;
                end
            end
            4'd5:begin
                if(!ram_rd_data_freeze[16])begin
                    o_freeze_cnt <= 16'd1;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= (temp_freeze_hash_opr>>7) + 11'd1984; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= (temp_freeze_hash_opr>>7) + 11'd1984;
                    ram_wr_data_freeze[16] <= 1'b1;
                    ram_wr_data_freeze[15:0] <= 16'd1;
                    ram_wr_en_freeze <= 1'b1;
                    opr_state <= 4'd0;
                    temp_freeze_hash_opr <= 12'b0;
                end
                else begin
                    opr_state <= 4'd6;
                end
            end
            4'd6:begin
                if(!ram_rd_data_freeze[16])begin
                    o_freeze_cnt <= 16'd1;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= (temp_freeze_hash_opr>>8) + 11'd2016; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= (temp_freeze_hash_opr>>8) + 11'd2016;
                    ram_wr_data_freeze[16] <= 1'b1;
                    ram_wr_data_freeze[15:0] <= 16'd1;
                    ram_wr_en_freeze <= 1'b1;
                    opr_state <= 4'd0;
                    temp_freeze_hash_opr <= 12'b0;
                end
                else begin
                    opr_state <= 4'd7;
                end
            end
            4'd7:begin
                if(!ram_rd_data_freeze[16])begin
                    o_freeze_cnt <= 16'd1;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= (temp_freeze_hash_opr>>9) + 11'd2032; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= (temp_freeze_hash_opr>>9) + 11'd2032;
                    ram_wr_data_freeze[16] <= 1'b1;
                    ram_wr_data_freeze[15:0] <= 16'd1;
                    ram_wr_en_freeze <= 1'b1;
                    opr_state <= 4'd0;
                    temp_freeze_hash_opr <= 12'b0;
                end
                else begin
                    opr_state <= 4'd8;
                end
            end
            4'd8:begin
                if(!ram_rd_data_freeze[16])begin
                    o_freeze_cnt <= 16'd1;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= (temp_freeze_hash_opr>>10) + 11'd2040; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= (temp_freeze_hash_opr>>10) + 11'd2040;
                    ram_wr_data_freeze[16] <= 1'b1;
                    ram_wr_data_freeze[15:0] <= 16'd1;
                    ram_wr_en_freeze <= 1'b1;
                    opr_state <= 4'd0;
                    temp_freeze_hash_opr <= 12'b0;
                end
                else begin
                    opr_state <= 4'd9;
                end
            end
            4'd9:begin
                if(!ram_rd_data_freeze[16])begin
                    o_freeze_cnt <= 16'd1;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= (temp_freeze_hash_opr>>11) + 11'd2044; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= (temp_freeze_hash_opr>>11) + 11'd2044;
                    ram_wr_data_freeze[16] <= 1'b1;
                    ram_wr_data_freeze[15:0] <= 16'd1;
                    ram_wr_en_freeze <= 1'b1;
                    opr_state <= 4'd0;
                    temp_freeze_hash_opr <= 12'b0;
                end
                else begin
                    opr_state <= 4'd10;
                end
            end
            4'd10:begin
                if(!ram_rd_data_freeze[16])begin
                    o_freeze_cnt <= 16'd1;
                    o_freeze_find_state <= 1'b0;
                    o_freeeze_offset <= (temp_freeze_hash_opr>>12) + 11'd2046; 
                    o_freeze_end <= 1'b1;
                    ram_wr_addr_freeze <= (temp_freeze_hash_opr>>12) + 11'd2046;
                    ram_wr_data_freeze[16] <= 1'b1;
                    ram_wr_data_freeze[15:0] <= 16'd1;
                    ram_wr_en_freeze <= 1'b1;
                    opr_state <= 4'd0;
                    temp_freeze_hash_opr <= 12'b0;
                end
                else begin
                    o_freeze_find_state <= 1'b1;
                    o_freeze_end <= 1'b1; 
                    opr_state <= 4'd0;
                end
            end
            default:begin
                opr_state <= 4'd0;
            end
        endcase
        
    end
end


ram_2047_17 u_freeze_bucket_ram(
     .clka          (i_clk)
    ,.addra         (ram_wr_addr_freeze)
    ,.dina          (ram_wr_data_freeze)
    ,.ena           (ram_wr_en_freeze)
    ,.wea           (ram_wr_en_freeze)

    ,.clkb          (i_clk)
    ,.addrb         (ram_rd_addr_freeze)
    ,.doutb         (ram_rd_data_freeze)
    ,.enb           (ram_rd_en_freeze)
);

endmodule