/*
 * @Filename: 
 * @Author: ws
 * @Description: 
 * @Date: 2023-11-14 22:18:23
 * @LastEditTime: 2023-11-15 22:28:44
 * @Company: 662
 */

module ErrorFunnel_Top(
     input              i_clk
    ,input              i_rst_n

    ,input      [63:0]  i_uv
    ,input              i_uv_en
);


//wire    [31:0]      randomnum_lfsr;
//RamdomNum_LFSR u_randomnum_lfsr(
//     .i_clk         (i_clk)
//    ,.i_rst_n       (i_rst_n)
//    ,.o_data        (randomnum_lfsr)
//);


wire    [31:0]      uv_crc32;
reg     [63:0]      i_uv_delay_1;
reg                 i_uv_en_delay_1;
CRC32_64in u_crc32_64in(
     .i_clk         (i_clk)
    ,.i_rst_n       (i_rst_n)
    ,.i_data        (i_uv)
    ,.i_data_en     (i_uv_en)
    ,.o_crc32       (uv_crc32)
    ,.o_crc32_en    ()
);
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        i_uv_delay_1 <= 64'b0;
        i_uv_en_delay_1 <= 1'b0;
    end
    else begin
        i_uv_delay_1 <= i_uv;
        i_uv_en_delay_1 <= i_uv_en;
    end
end


wire    [63:0]      uv_coco_tower;
wire                uv_coco_tower_en;
wire    [95:0]      u1v1PureCnt_coco_tower;
wire                u1v1PureCnt_coco_tower_en;

CocoSketch #(
    .RAM_PTR    (11)
    ,.HASH_BASE (0)
)
u_cocosketch(
     .i_clk             (i_clk)
    ,.i_rst_n           (i_rst_n)
    //,.i_P_ramdom        (randomnum_lfsr)
    ,.hash_e_f          ({uv_crc32,i_uv_delay_1})
    ,.valid             (i_uv_en_delay_1)
    //,.i_uv              (i_uv_delay_1)
    //,.i_uv_en           (i_uv_en_delay_1)
    //,.i_hash_uv         (uv_crc32[10:0])
    ,.o_uv              (uv_coco_tower)
    ,.o_uv_en           (uv_coco_tower_en)
    ,.o_u1v1PureCnt     (u1v1PureCnt_coco_tower)
    ,.o_u1v1PureCnt_en  (u1v1PureCnt_coco_tower_en)
);

wire    [31:0]      u_crc32;
wire                u_crc32_en;
wire    [31:0]      v_crc32;
wire                v_crc32_en;
wire    [31:0]      u1_crc32;
wire                u1_crc32_en;
wire    [31:0]      v1_crc32;
wire                v1_crc32_en;
reg     [63:0]      uv_coco_tower_delay_1;
reg                 uv_coco_tower_en_delay_1;
reg     [95:0]      u1v1PureCnt_coco_tower_delay_1;
reg                 u1v1PureCnt_coco_tower_en_delay_1;
CRC32_32in u_u_crc32_32in(
     .i_clk         (i_clk)
    ,.i_rst_n       (i_rst_n)
    ,.i_data        (uv_coco_tower[63:32])
    ,.i_data_en     (uv_coco_tower_en)
    ,.o_crc32       (u_crc32)
    ,.o_crc32_en    (u_crc32_en)
);
CRC32_32in u_v_crc32_32in(
     .i_clk         (i_clk)
    ,.i_rst_n       (i_rst_n)
    ,.i_data        (uv_coco_tower[31:0])
    ,.i_data_en     (uv_coco_tower_en)
    ,.o_crc32       (v_crc32)
    ,.o_crc32_en    (v_crc32_en)
);
CRC32_32in u_u1_crc32_32in(
     .i_clk         (i_clk)
    ,.i_rst_n       (i_rst_n)
    ,.i_data        (u1v1PureCnt_coco_tower[95:64])
    ,.i_data_en     (u1v1PureCnt_coco_tower_en)
    ,.o_crc32       (u1_crc32)
    ,.o_crc32_en    (u1_crc32_en)
);
CRC32_32in u_v1_crc32_32in(
     .i_clk         (i_clk)
    ,.i_rst_n       (i_rst_n)
    ,.i_data        (u1v1PureCnt_coco_tower[63:32])
    ,.i_data_en     (u1v1PureCnt_coco_tower_en)
    ,.o_crc32       (v1_crc32)
    ,.o_crc32_en    (v1_crc32_en)
);
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        uv_coco_tower_delay_1 <= 64'b0;
        uv_coco_tower_en_delay_1 <= 1'b0;
        u1v1PureCnt_coco_tower_delay_1 <= 96'b0;
        u1v1PureCnt_coco_tower_en_delay_1 <= 1'b0;
    end
    else begin
        uv_coco_tower_delay_1 <= uv_coco_tower;
        uv_coco_tower_en_delay_1 <= uv_coco_tower_en;
        u1v1PureCnt_coco_tower_delay_1 <= u1v1PureCnt_coco_tower;
        u1v1PureCnt_coco_tower_en_delay_1 <= u1v1PureCnt_coco_tower_en;
    end
end


TowerTCM_2b#(
     .M_DIM         (128)
    ,.M_DIM_CLOG2   (7)
    ,.RAM_DEPTH     (14)
    ,.RAM_WIDTH     (2)
    ,.BUCKET_MAX    (2'd3)
)u_towertcm_2b(
     .i_clk         (i_clk)
    ,.i_rst_n       (i_rst_n)
    ,.i_hash_u      (u_crc32[6:0])
    ,.i_hash_v      (v_crc32[6:0])
    ,.i_hash_uv_en  (u_crc32_en & v_crc32_en)
    ,.i_PureCnt     (u1v1PureCnt_coco_tower_delay_1[31:0])
    ,.i_PureCnt_en  (u1v1PureCnt_coco_tower_en_delay_1)
    ,.i_hash_u1     (u1_crc32[6:0])
    ,.i_hash_v1     (v1_crc32[6:0])
    ,.i_hash_u1v1_en(u1_crc32_en & v1_crc32_en)
);


TowerTCM_4b#(
     .M_DIM         (128)
    ,.M_DIM_CLOG2   (7)
    ,.RAM_DEPTH     (14)
    ,.RAM_WIDTH     (4)
    ,.BUCKET_MAX    (4'd15)
)u_towertcm_4b(
     .i_clk         (i_clk)
    ,.i_rst_n       (i_rst_n)
    ,.i_hash_u      (u_crc32[14:8])
    ,.i_hash_v      (v_crc32[14:8])
    ,.i_hash_uv_en  (u_crc32_en & v_crc32_en)
    ,.i_PureCnt     (u1v1PureCnt_coco_tower_delay_1[31:0])
    ,.i_PureCnt_en  (u1v1PureCnt_coco_tower_en_delay_1)
    ,.i_hash_u1     (u1_crc32[14:8])
    ,.i_hash_v1     (v1_crc32[14:8])
    ,.i_hash_u1v1_en(u1_crc32_en & v1_crc32_en)
);


TowerTCM_8b#(
     .M_DIM         (64)
    ,.M_DIM_CLOG2   (6)
    ,.RAM_DEPTH     (12)
    ,.RAM_WIDTH     (8)
    ,.BUCKET_MAX    (8'd255)
)u_towertcm_8b(
     .i_clk         (i_clk)
    ,.i_rst_n       (i_rst_n)
    ,.i_hash_u      (u_crc32[21:16])
    ,.i_hash_v      (v_crc32[21:16])
    ,.i_hash_uv_en  (u_crc32_en & v_crc32_en)
    ,.i_PureCnt     (u1v1PureCnt_coco_tower_delay_1[31:0])
    ,.i_PureCnt_en  (u1v1PureCnt_coco_tower_en_delay_1)
    ,.i_hash_u1     (u1_crc32[21:16])
    ,.i_hash_v1     (v1_crc32[21:16])
    ,.i_hash_u1v1_en(u1_crc32_en & v1_crc32_en)
);


TowerTCM_16b#(
     .M_DIM         (64)
    ,.M_DIM_CLOG2   (6)
    ,.RAM_DEPTH     (12)
    ,.RAM_WIDTH     (27)
    ,.BUCKET_MAX    (16'd65535)
)u_towertcm_16b(
     .i_clk         (i_clk)
    ,.i_rst_n       (i_rst_n)
    ,.i_hash_u      (u_crc32[29:24])
    ,.i_hash_v      (v_crc32[29:24])
    ,.i_hash_uv_en  (u_crc32_en & v_crc32_en)
    ,.i_PureCnt     (u1v1PureCnt_coco_tower_delay_1[31:0])
    ,.i_PureCnt_en  (u1v1PureCnt_coco_tower_en_delay_1)
    ,.i_hash_u1     (u1_crc32[29:24])
    ,.i_hash_v1     (v1_crc32[29:24])
    ,.i_hash_u1v1_en(u1_crc32_en & v1_crc32_en)
);


endmodule
