/*
 * @Filename: 
 * @Author: ws
 * @Description: modify-->parameter & ram
 * @Date: 2023-11-07 21:43:29
 * @LastEditTime: 2023-11-17 09:41:24
 * @Company: 662
 */

module TowerTCM_2b#(
     parameter M_DIM=128
    ,parameter M_DIM_CLOG2=7
    ,parameter RAM_DEPTH=M_DIM_CLOG2*2
    ,parameter RAM_WIDTH=2
    ,parameter BUCKET_MAX=2'd3
)
(
     input                      i_clk
    ,input                      i_rst_n      

    ,input  [M_DIM_CLOG2-1:0]   i_hash_u
    ,input  [M_DIM_CLOG2-1:0]   i_hash_v
    ,input                      i_hash_uv_en
    
    ,input  [31:0]              i_PureCnt
    ,input                      i_PureCnt_en 
    ,input  [M_DIM_CLOG2-1:0]   i_hash_u1
    ,input  [M_DIM_CLOG2-1:0]   i_hash_v1
    ,input                      i_hash_u1v1_en
);


//* TowerTCM_2b Memory
reg     [RAM_DEPTH-1:0]     ram_wr_addr;
reg     [RAM_WIDTH-1:0]     ram_wr_data;
reg                         ram_wr_en;
reg     [RAM_DEPTH-1:0]     ram_rd_addr;
wire    [RAM_WIDTH-1:0]     ram_rd_data;
reg                         ram_rd_en;

//* MAIN_FIFO [1'b0,hash_u1,1'b0,hash_v1,PureCnt/1] 
reg     [47:0]              fifo_main_wr_data;
reg                         fifo_main_wr_en;
wire    [47:0]              fifo_main_rd_data; 
reg                         fifo_main_rd_en;
wire                        fifo_main_empty;
//* BUFFER_FOFO [1'b0,hash_u1,1'b0,hash_v1,PureCnt]
wire    [47:0]              fifo_buffer_rd_data; 
reg                         fifo_buffer_rd_en;
wire                        fifo_buffer_empty;

//*delay
wire     [47:0]              ori_rd_data_4;
wire                         ori_rd_data_4_en;


//* write MAIN_FIFO
reg [1:0] wr_fifo_state;
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        fifo_main_wr_data <= 48'b0;
        fifo_main_wr_en <= 1'b0;
        fifo_buffer_rd_en <= 1'b0;
        wr_fifo_state <= 2'b0;
    end
    else begin
        case(wr_fifo_state)
            2'b0:begin
                if(i_hash_uv_en)begin
                    fifo_main_wr_data <= {{(8-M_DIM_CLOG2){1'b0}},i_hash_u,{(8-M_DIM_CLOG2){1'b0}},i_hash_v,32'b1};
                    fifo_main_wr_en <= 1'b1;
                    fifo_buffer_rd_en <= 1'b0;
                end
                else if(!fifo_buffer_empty)begin
                    fifo_main_wr_data <= fifo_buffer_rd_data;
                    fifo_main_wr_en <= 1'b1;
                    fifo_buffer_rd_en <= 1'b1;
                    wr_fifo_state <= 2'b01;
                end
                else begin
                    fifo_main_wr_data <= 48'b0;
                    fifo_main_wr_en <= 1'b0;
                    fifo_buffer_rd_en <= 1'b0;
                end
            end
            2'b01:begin
                if(i_hash_uv_en)begin
                    fifo_main_wr_data <= {{(8-M_DIM_CLOG2){1'b0}},i_hash_u,{(8-M_DIM_CLOG2){1'b0}},i_hash_v,32'b1};
                    fifo_main_wr_en <= 1'b1;
                    fifo_buffer_rd_en <= 1'b0;
                end
                else begin
                    fifo_main_wr_data <= 48'b0;
                    fifo_main_wr_en <= 1'b0;
                    fifo_buffer_rd_en <= 1'b0;
                end
                wr_fifo_state <= 2'b10;
            end
            2'b10:begin
                if(i_hash_uv_en)begin
                    fifo_main_wr_data <= {{(8-M_DIM_CLOG2){1'b0}},i_hash_u,{(8-M_DIM_CLOG2){1'b0}},i_hash_v,32'b1};
                    fifo_main_wr_en <= 1'b1;
                    fifo_buffer_rd_en <= 1'b0;
                end
                else begin
                    fifo_main_wr_data <= 48'b0;
                    fifo_main_wr_en <= 1'b0;
                    fifo_buffer_rd_en <= 1'b0;
                end
                wr_fifo_state <= 2'b11;
            end
            2'b11:begin
                if(i_hash_uv_en)begin
                    fifo_main_wr_data <= {{(8-M_DIM_CLOG2){1'b0}},i_hash_u,{(8-M_DIM_CLOG2){1'b0}},i_hash_v,32'b1};
                    fifo_main_wr_en <= 1'b1;
                    fifo_buffer_rd_en <= 1'b0;
                end
                else begin
                    fifo_main_wr_data <= 48'b0;
                    fifo_main_wr_en <= 1'b0;
                    fifo_buffer_rd_en <= 1'b0;
                end
                wr_fifo_state <= 2'b0;
            end
            default:begin
                wr_fifo_state <= 2'b0;
            end
        endcase
    end
end


//*read RAM & delay
reg [1:0] rd_ram_state;
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        ram_rd_addr <= {(RAM_DEPTH){1'b0}};
        ram_rd_en <= 1'b0;
        fifo_main_rd_en <= 1'b0;
        rd_ram_state <= 2'b0;
    end
    else begin
        case(rd_ram_state)
            2'b0:begin
                if(!fifo_main_empty)begin
                    ram_rd_addr <= (fifo_main_rd_data[47:40]<<M_DIM_CLOG2)+fifo_main_rd_data[39:32];
                    ram_rd_en <= 1'b1;
                    fifo_main_rd_en <= 1'b1;
                    rd_ram_state <= 2'b01;
                end
            end
            2'b01:begin
                ram_rd_addr <= {(RAM_DEPTH){1'b0}};
                ram_rd_en <= 1'b0;
                fifo_main_rd_en <= 1'b0;
                rd_ram_state <= 2'b10;
            end
            2'b10:begin
                ram_rd_addr <= {(RAM_DEPTH){1'b0}};
                ram_rd_en <= 1'b0;
                fifo_main_rd_en <= 1'b0;
                rd_ram_state <= 2'b11;
            end
            2'b11:begin
                ram_rd_addr <= {(RAM_DEPTH){1'b0}};
                ram_rd_en <= 1'b0;
                fifo_main_rd_en <= 1'b0;
                rd_ram_state <= 2'b0;
            end
            default:begin
                rd_ram_state <= 1'b0;
            end
        endcase
    end
end
Delay_3clock#(
     .WIDTH             (48)
)u_delay_3clock_rd_tcm
(
     .i_clk             (i_clk)
    ,.i_rst_n           (i_rst_n)
    ,.i_data            (fifo_main_rd_data)
    ,.i_data_en         ((!fifo_main_empty)&&(2'b0==rd_ram_state))
    ,.o_data_delay_3    (ori_rd_data_4)
    ,.o_data_en_delay_3 (ori_rd_data_4_en)
);

//* update bucket
reg [RAM_WIDTH-1:0] ram_rd_data_delay1;
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        ram_wr_addr <= {(RAM_DEPTH){1'b0}};
        ram_wr_data <= {(RAM_WIDTH){1'b0}};
        ram_wr_en <= 1'b0;
        ram_rd_data_delay1 <= {(RAM_WIDTH){1'b0}};
    end
    else begin
        ram_rd_data_delay1 <= ram_rd_data;
        if(ori_rd_data_4_en)begin
            ram_wr_addr <= (ori_rd_data_4[47:40]<<M_DIM_CLOG2)+ori_rd_data_4[39:32];
            ram_wr_data <= ((ram_rd_data_delay1+ori_rd_data_4[31:0]) > BUCKET_MAX)? BUCKET_MAX : (ram_rd_data_delay1 + ori_rd_data_4[31:0]);
            ram_wr_en <= 1'b1;
        end
        else begin
            ram_wr_addr <= {(RAM_DEPTH){1'b0}};
            ram_wr_data <= {(RAM_WIDTH){1'b0}};
            ram_wr_en <= 1'b0;
        end
    end
end


ram_16384_2 u_towertcm2b_ram(
     .clka          (i_clk)
    ,.addra         (ram_wr_addr)
    ,.dina          (ram_wr_data)
    ,.ena           (ram_wr_en)
    ,.wea           (ram_wr_en)

    ,.clkb          (i_clk)
    ,.addrb         (ram_rd_addr)
    ,.doutb         (ram_rd_data)
    ,.enb           (ram_rd_en)
);

fifo_128_48 u_main_fifo(
     .clk           (i_clk)
    ,.rst           (!i_rst_n)

    ,.din           (fifo_main_wr_data)
    ,.wr_en         (fifo_main_wr_en)
    ,.full          ()

    ,.dout          (fifo_main_rd_data)
    ,.rd_en         (fifo_main_rd_en)
    ,.empty         (fifo_main_empty)
);

fifo_128_48 u_buffer_fifo(
     .clk           (i_clk)
    ,.rst           (!i_rst_n)

    ,.din           ({{(8-M_DIM_CLOG2){1'b0}},i_hash_u1,{(8-M_DIM_CLOG2){1'b0}},i_hash_v1,i_PureCnt})
    ,.wr_en         (i_PureCnt_en && i_hash_u1v1_en)
    ,.full          ()

    ,.dout          (fifo_buffer_rd_data)
    ,.rd_en         (fifo_buffer_rd_en)
    ,.empty         (fifo_buffer_empty)
);

endmodule
