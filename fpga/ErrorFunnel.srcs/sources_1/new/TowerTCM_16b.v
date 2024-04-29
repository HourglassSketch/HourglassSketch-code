/*
 * @Filename: 
 * @Author: ws
 * @Description: 
 * @Date: 2023-11-15 08:58:36
 * @LastEditTime: 2023-11-17 09:45:53
 * @Company: 662
 */

module TowerTCM_16b#(
     parameter M_DIM=64
    ,parameter M_DIM_CLOG2=6
    ,parameter RAM_DEPTH=M_DIM_CLOG2*2
    ,parameter RAM_WIDTH=27             //[offset,tower_cnt]
    ,parameter BUCKET_MAX=16'd65535
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

//* TowerTCM_16b Memory
reg     [RAM_DEPTH-1:0]     ram_wr_addr;
reg     [RAM_WIDTH-1:0]     ram_wr_data;
reg                         ram_wr_en;
reg     [RAM_DEPTH-1:0]     ram_rd_addr;
wire    [RAM_WIDTH-1:0]     ram_rd_data;
reg                         ram_rd_en;

//* MAIN_FIFO [replace_u1v1,replace_uv,1'b0,hash_u1,1'b0,hash_v1,PureCnt/1] 
reg     [49:0]              fifo_main_wr_data;
reg                         fifo_main_wr_en;
wire    [49:0]              fifo_main_rd_data; 
reg                         fifo_main_rd_en;
wire                        fifo_main_empty;
//* BUFFER_FOFO [replace_u1v1,replace_uv,1'b0,hash_u1,1'b0,hash_v1,PureCnt]
wire    [49:0]              fifo_buffer_rd_data; 
reg                         fifo_buffer_rd_en;
wire                        fifo_buffer_empty;


//* write MAIN_FIFO
reg [1:0] wr_fifo_state;
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        fifo_main_wr_data <= 50'b0;
        fifo_main_wr_en <= 1'b0;
        fifo_buffer_rd_en <= 1'b0;
        wr_fifo_state <= 2'b0;
    end
    else begin
        case(wr_fifo_state)
            2'b0:begin
                if(i_hash_uv_en)begin
                    fifo_main_wr_data[47:0] <= {{(8-M_DIM_CLOG2){1'b0}},i_hash_u,{(8-M_DIM_CLOG2){1'b0}},i_hash_v,32'b1};
                    fifo_main_wr_data[48] <= i_hash_uv_en & i_hash_u1v1_en;
                    fifo_main_wr_data[49] <= 1'b0;
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
                    fifo_main_wr_data <= 50'b0;
                    fifo_main_wr_en <= 1'b0;
                    fifo_buffer_rd_en <= 1'b0;
                end
            end
            2'b01:begin
                if(i_hash_uv_en)begin
                    fifo_main_wr_data[47:0] <= {{(8-M_DIM_CLOG2){1'b0}},i_hash_u,{(8-M_DIM_CLOG2){1'b0}},i_hash_v,32'b1};
                    fifo_main_wr_data[48] <= i_hash_uv_en & i_hash_u1v1_en;
                    fifo_main_wr_data[49] <= 1'b0;
                    fifo_main_wr_en <= 1'b1;
                    fifo_buffer_rd_en <= 1'b0;
                end
                else begin
                    fifo_main_wr_data <= 50'b0;
                    fifo_main_wr_en <= 1'b0;
                    fifo_buffer_rd_en <= 1'b0;
                end
                wr_fifo_state <= 2'b10;
            end
            2'b10:begin
                if(i_hash_uv_en)begin
                    fifo_main_wr_data[47:0] <= {{(8-M_DIM_CLOG2){1'b0}},i_hash_u,{(8-M_DIM_CLOG2){1'b0}},i_hash_v,32'b1};
                    fifo_main_wr_data[48] <= i_hash_uv_en & i_hash_u1v1_en;
                    fifo_main_wr_data[49] <= 1'b0;
                    fifo_main_wr_en <= 1'b1;
                    fifo_buffer_rd_en <= 1'b0;
                end
                else begin
                    fifo_main_wr_data <= 50'b0;
                    fifo_main_wr_en <= 1'b0;
                    fifo_buffer_rd_en <= 1'b0;
                end
                wr_fifo_state <= 2'b11;
            end
            2'b11:begin
                if(i_hash_uv_en)begin
                    fifo_main_wr_data[47:0] <= {{(8-M_DIM_CLOG2){1'b0}},i_hash_u,{(8-M_DIM_CLOG2){1'b0}},i_hash_v,32'b1};
                    fifo_main_wr_data[48] <= i_hash_uv_en & i_hash_u1v1_en;
                    fifo_main_wr_data[49] <= 1'b0;
                    fifo_main_wr_en <= 1'b1;
                    fifo_buffer_rd_en <= 1'b0;
                end
                else begin
                    fifo_main_wr_data <= 50'b0;
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


//* Intermediate parameter
reg     [1:0]   indicator;
reg             indicator_en;
reg     [10:0]  freeze_addr;
reg     [15:0]  freeze_hash;
wire    [15:0]  freeze_cnt;
wire            freeze_find_state;
wire    [10:0]  freeze_offset;
wire            freeze_end;


//* read towertcm
wire    [49:0]  fifo_main_rd_data_delay3;
wire            fifo_main_rd_data_en_delay3;
reg             read_towertcm_state;
reg             towertcm_update_end;
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        ram_rd_addr <= {(RAM_DEPTH){1'b0}};
        ram_rd_en <= 1'b0;
        fifo_main_rd_en <= 1'b0;
        read_towertcm_state <= 1'b0;
    end
    else begin
        case(read_towertcm_state)
            1'b0:begin
                if(!fifo_main_empty)begin
                    ram_rd_addr <= (fifo_main_rd_data[47:40]<<M_DIM_CLOG2)+fifo_main_rd_data[39:32];
                    ram_rd_en <= 1'b1;
                    fifo_main_rd_en <= 1'b1;
                    read_towertcm_state <= 1'b1;
                end
                else begin
                    ram_rd_addr <= {(RAM_DEPTH){1'b0}};
                    ram_rd_en <= 1'b0;
                    fifo_main_rd_en <= 1'b0;
                end
            end
            1'b1:begin
                ram_rd_addr <= {(RAM_DEPTH){1'b0}};
                ram_rd_en <= 1'b0;
                fifo_main_rd_en <= 1'b0;
                if(freeze_end || towertcm_update_end)begin
                    read_towertcm_state <= 1'b0;
                end
            end
            default:begin
                read_towertcm_state <= 1'b0;
            end
        endcase
    end
end
Delay_3clock#(
     .WIDTH             (50)
)u_delay_3clock_rd_tcm
(
     .i_clk             (i_clk)
    ,.i_rst_n           (i_rst_n)
    ,.i_data            (fifo_main_rd_data)
    ,.i_data_en         ((!fifo_main_empty) && (1'b0==read_towertcm_state))
    ,.o_data_delay_3    (fifo_main_rd_data_delay3)
    ,.o_data_en_delay_3 (fifo_main_rd_data_en_delay3)
);


//* update bucket
reg     [1:0]   towertcm_16b_state;//waiting, 2'd1->update, 2'd2->find, 2'd3->zero
reg     [11:0]  temp_towertcm_addr;
reg     [26:0]  temp_towertcm_data;
reg     [31:0]  temp_purecnt;
reg     [RAM_WIDTH-1:0]   ram_rd_data_delay1;
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        ram_wr_addr <= {(RAM_DEPTH){1'b0}};
        ram_wr_data <= {(RAM_WIDTH){1'b0}};
        ram_wr_en <= 1'b0;
        towertcm_16b_state <= 2'd0;
        indicator <= 2'b0;
        indicator_en <= 1'b0;
        freeze_addr <= 11'b0;
        freeze_hash <= 16'b0;
        temp_towertcm_addr <= 12'b0;
        temp_towertcm_data <= 27'b0;
        temp_purecnt <= 32'b0;
        ram_rd_data_delay1 <= {(RAM_WIDTH){1'b0}};
        towertcm_update_end <= 1'b0;
    end
    else begin
        ram_rd_data_delay1 <= ram_rd_data;
        case(towertcm_16b_state)
            2'd0:begin
                if(fifo_main_rd_data_en_delay3)begin
                    if(fifo_main_rd_data_delay3[48])begin       //replace success, update uv
                        ram_wr_addr <= {(RAM_DEPTH){1'b0}};
                        ram_wr_data <= {(RAM_WIDTH){1'b0}};
                        ram_wr_en <= 1'b0;
                        if(!(|ram_rd_data_delay1[26:16]))begin            //unfreeze, find a freeze_bucket
                            towertcm_16b_state <= 2'd2;
                            indicator <= 2'b01;
                            indicator_en <= 1'b1;
                            freeze_addr <= 11'b0;
                            freeze_hash <= fifo_main_rd_data_delay3[47:32];
                            temp_towertcm_addr <= (fifo_main_rd_data_delay3[47:40]<<M_DIM_CLOG2)+fifo_main_rd_data_delay3[39:32];
                            temp_towertcm_data <= ram_rd_data_delay1;
                        end
                        else begin                              //freeze, update the corresponding freeze_bucket
                            towertcm_16b_state <= 2'd1;
                            indicator <= 2'b0;
                            indicator_en <= 1'b1;
                            freeze_addr <= ram_rd_data_delay1[26:16]-1'b1;
                            freeze_hash <= 16'b0;
                        end
                        towertcm_update_end <= 1'b0;
                    end
                    else if(fifo_main_rd_data_delay3[49])begin  //replace success, update u1v1
                        if(!(|ram_rd_data_delay1[26:16]))begin            //unfreeze, update towertcm, +purecnt
                            ram_wr_addr <= (fifo_main_rd_data_delay3[47:40]<<M_DIM_CLOG2)+fifo_main_rd_data_delay3[39:32];
                            ram_wr_data[26:16] <= 11'b0;
                            ram_wr_data[15:0] <= ((ram_rd_data_delay1[15:0]+fifo_main_rd_data_delay3[31:0]) > BUCKET_MAX)? BUCKET_MAX : (ram_rd_data_delay1[15:0] + fifo_main_rd_data_delay3[31:0]);
                            ram_wr_en <= 1'b1;
                            towertcm_update_end <= 1'b1;
                        end
                        else begin                              //freeze, zero the corresponding freeze_bucket
                            ram_wr_addr <= {(RAM_DEPTH){1'b0}};
                            ram_wr_data <= {(RAM_WIDTH){1'b0}};
                            ram_wr_en <= 1'b0;
                            towertcm_16b_state <= 2'd3;
                            indicator <= 2'b10;
                            indicator_en <= 1'b1;
                            freeze_addr <= ram_rd_data_delay1[26:16]-1'b1;
                            freeze_hash <= 16'b0;
                            temp_towertcm_addr <= (fifo_main_rd_data_delay3[47:40]<<M_DIM_CLOG2)+fifo_main_rd_data_delay3[39:32];
                            temp_towertcm_data <= ram_rd_data_delay1;
                            temp_purecnt <= fifo_main_rd_data_delay3[31:0];
                            towertcm_update_end <= 1'b0;
                        end
                    end
                    else begin                                  //replace fail, update uv
                        if(!(|ram_rd_data_delay1[26:16]))begin            //unfreeze, update towertcm, +1
                            ram_wr_addr <= (fifo_main_rd_data_delay3[47:40]<<M_DIM_CLOG2)+fifo_main_rd_data_delay3[39:32];
                            ram_wr_data[26:16] <= 11'b0;
                            ram_wr_data[15:0] <= ((ram_rd_data_delay1[15:0]+1'b1) > BUCKET_MAX)? BUCKET_MAX : (ram_rd_data_delay1[15:0] + 1'b1);
                            ram_wr_en <= 1'b1;
                            towertcm_update_end <= 1'b1;
                        end
                        else begin                              //freeze, update the corresponding freeze_bucket, +1
                            ram_wr_addr <= {(RAM_DEPTH){1'b0}};
                            ram_wr_data <= {(RAM_WIDTH){1'b0}};
                            ram_wr_en <= 1'b0;
                            towertcm_16b_state <= 2'd1;
                            indicator <= 2'b0;
                            indicator_en <= 1'b1;
                            freeze_addr <= ram_rd_data_delay1[26:16]-1'b1;
                            freeze_hash <= 16'b0;
                            towertcm_update_end <= 1'b0;
                        end
                    end
                end
                else begin
                    ram_wr_addr <= {(RAM_DEPTH){1'b0}};
                    ram_wr_data <= {(RAM_WIDTH){1'b0}};
                    ram_wr_en <= 1'b0;
                    indicator <= 2'b0;
                    indicator_en <= 1'b0;
                    freeze_addr <= 11'b0;
                    freeze_hash <= 16'b0;
                    temp_towertcm_addr <= 12'b0;
                    temp_towertcm_data <= 27'b0;
                    temp_purecnt <= 32'b0;
                    towertcm_update_end <= 1'b0;
                end
            end
            2'd1:begin  //waiting -- update
                if(freeze_end)begin
                    towertcm_16b_state <= 2'd0;
                end
                indicator <= 2'b0;
                indicator_en <= 1'b0;
                freeze_addr <= 11'b0;
                freeze_hash <= 16'b0;
            end
            2'd2:begin  //waiting -- find
                if(freeze_end)begin
                    if(freeze_find_state)begin    //find freeze_bucket fail
                        ram_wr_addr <= temp_towertcm_addr;
                        ram_wr_data[26:16] <= temp_towertcm_data[26:16];
                        ram_wr_data[15:0] <= temp_towertcm_data[15:0] + 1'b1;
                        ram_wr_en <= 1'b1;
                    end
                    else begin
                        ram_wr_addr <= temp_towertcm_addr;
                        ram_wr_data[26:16] <= freeze_offset+1'b1;
                        ram_wr_data[15:0] <= temp_towertcm_data[15:0];
                        ram_wr_en <= 1'b1;
                    end
                    towertcm_16b_state <= 2'd0;
                end
                indicator <= 2'b0;
                indicator_en <= 1'b0;
                freeze_addr <= 11'b0;
                freeze_hash <= 16'b0;
            end
            2'd3:begin  //waiting -- zero
                if(freeze_end)begin
                    ram_wr_addr <= temp_towertcm_addr;
                    ram_wr_data[26:16] <= 11'b0;
                    ram_wr_data[15:0] <= temp_towertcm_data[15:0]+((freeze_cnt>=temp_purecnt)?freeze_cnt:temp_purecnt);
                    ram_wr_en <= 1'b1;
                    towertcm_16b_state <= 2'd0;
                end
                indicator <= 2'b0;
                indicator_en <= 1'b0;
                freeze_addr <= 11'b0;
                freeze_hash <= 16'b0;
            end
            default:begin
                towertcm_16b_state <= 2'd0;
            end
        endcase
    end
end
FreezeBucket u_freezebucket(
     .i_clk                 (i_clk)
    ,.i_rst_n               (i_rst_n)
    ,.i_indicator           (indicator)
    ,.i_indicator_en        (indicator_en)
    ,.i_freeze_addr         (freeze_addr)
    ,.i_freeze_hash         (freeze_hash)
    ,.o_freeze_cnt          (freeze_cnt)
    ,.o_freeze_find_state   (freeze_find_state)
    ,.o_freeeze_offset      (freeze_offset)
    ,.o_freeze_end          (freeze_end)
);


//* towertcm memory
ram_4096_27 u_towertcm16b_ram(
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

fifo_128_50 u_main_fifo(
     .clk           (i_clk)
    ,.rst           (!i_rst_n)

    ,.din           (fifo_main_wr_data)
    ,.wr_en         (fifo_main_wr_en)
    ,.full          ()

    ,.dout          (fifo_main_rd_data)
    ,.rd_en         (fifo_main_rd_en)
    ,.empty         (fifo_main_empty)
);

fifo_128_50 u_buffer_fifo(
     .clk           (i_clk)
    ,.rst           (!i_rst_n)

    ,.din           ({1'b1,1'b0,{(8-M_DIM_CLOG2){1'b0}},i_hash_u1,{(8-M_DIM_CLOG2){1'b0}},i_hash_v1,i_PureCnt})
    ,.wr_en         (i_PureCnt_en && i_hash_u1v1_en)
    ,.full          ()

    ,.dout          (fifo_buffer_rd_data)
    ,.rd_en         (fifo_buffer_rd_en)
    ,.empty         (fifo_buffer_empty)
);

endmodule
