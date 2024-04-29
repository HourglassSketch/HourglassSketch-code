/*
 * @Filename: 
 * @Author: ws
 * @Description: from: CRC_tool
 * @Date: 2023-11-07 21:10:45
 * @LastEditTime: 2023-11-07 21:35:31
 * @Company: 662
 */

module CRC32_32in(
     input              i_clk
    ,input              i_rst_n
    ,input      [31:0]  i_data
    ,input              i_data_en
    ,output reg [31:0]  o_crc32
    ,output reg         o_crc32_en       
);

reg [31:0] lfsr_q,lfsr_c;
    
always@(*)begin
    lfsr_c[0] = lfsr_q[0] ^ lfsr_q[6] ^ lfsr_q[9] ^ lfsr_q[10] ^ lfsr_q[12] ^ lfsr_q[16] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[30] ^ lfsr_q[31] ^ i_data[0] ^ i_data[6] ^ i_data[9] ^ i_data[10] ^ i_data[12] ^ i_data[16] ^ i_data[24] ^ i_data[25] ^ i_data[26] ^ i_data[28] ^ i_data[29] ^ i_data[30] ^ i_data[31];
    lfsr_c[1] = lfsr_q[0] ^ lfsr_q[1] ^ lfsr_q[6] ^ lfsr_q[7] ^ lfsr_q[9] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[24] ^ lfsr_q[27] ^ lfsr_q[28] ^ i_data[0] ^ i_data[1] ^ i_data[6] ^ i_data[7] ^ i_data[9] ^ i_data[11] ^ i_data[12] ^ i_data[13] ^ i_data[16] ^ i_data[17] ^ i_data[24] ^ i_data[27] ^ i_data[28];
    lfsr_c[2] = lfsr_q[0] ^ lfsr_q[1] ^ lfsr_q[2] ^ lfsr_q[6] ^ lfsr_q[7] ^ lfsr_q[8] ^ lfsr_q[9] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[24] ^ lfsr_q[26] ^ lfsr_q[30] ^ lfsr_q[31] ^ i_data[0] ^ i_data[1] ^ i_data[2] ^ i_data[6] ^ i_data[7] ^ i_data[8] ^ i_data[9] ^ i_data[13] ^ i_data[14] ^ i_data[16] ^ i_data[17] ^ i_data[18] ^ i_data[24] ^ i_data[26] ^ i_data[30] ^ i_data[31];
    lfsr_c[3] = lfsr_q[1] ^ lfsr_q[2] ^ lfsr_q[3] ^ lfsr_q[7] ^ lfsr_q[8] ^ lfsr_q[9] ^ lfsr_q[10] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[25] ^ lfsr_q[27] ^ lfsr_q[31] ^ i_data[1] ^ i_data[2] ^ i_data[3] ^ i_data[7] ^ i_data[8] ^ i_data[9] ^ i_data[10] ^ i_data[14] ^ i_data[15] ^ i_data[17] ^ i_data[18] ^ i_data[19] ^ i_data[25] ^ i_data[27] ^ i_data[31];
    lfsr_c[4] = lfsr_q[0] ^ lfsr_q[2] ^ lfsr_q[3] ^ lfsr_q[4] ^ lfsr_q[6] ^ lfsr_q[8] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[15] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[29] ^ lfsr_q[30] ^ lfsr_q[31] ^ i_data[0] ^ i_data[2] ^ i_data[3] ^ i_data[4] ^ i_data[6] ^ i_data[8] ^ i_data[11] ^ i_data[12] ^ i_data[15] ^ i_data[18] ^ i_data[19] ^ i_data[20] ^ i_data[24] ^ i_data[25] ^ i_data[29] ^ i_data[30] ^ i_data[31];
    lfsr_c[5] = lfsr_q[0] ^ lfsr_q[1] ^ lfsr_q[3] ^ lfsr_q[4] ^ lfsr_q[5] ^ lfsr_q[6] ^ lfsr_q[7] ^ lfsr_q[10] ^ lfsr_q[13] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[24] ^ lfsr_q[28] ^ lfsr_q[29] ^ i_data[0] ^ i_data[1] ^ i_data[3] ^ i_data[4] ^ i_data[5] ^ i_data[6] ^ i_data[7] ^ i_data[10] ^ i_data[13] ^ i_data[19] ^ i_data[20] ^ i_data[21] ^ i_data[24] ^ i_data[28] ^ i_data[29];
    lfsr_c[6] = lfsr_q[1] ^ lfsr_q[2] ^ lfsr_q[4] ^ lfsr_q[5] ^ lfsr_q[6] ^ lfsr_q[7] ^ lfsr_q[8] ^ lfsr_q[11] ^ lfsr_q[14] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[22] ^ lfsr_q[25] ^ lfsr_q[29] ^ lfsr_q[30] ^ i_data[1] ^ i_data[2] ^ i_data[4] ^ i_data[5] ^ i_data[6] ^ i_data[7] ^ i_data[8] ^ i_data[11] ^ i_data[14] ^ i_data[20] ^ i_data[21] ^ i_data[22] ^ i_data[25] ^ i_data[29] ^ i_data[30];
    lfsr_c[7] = lfsr_q[0] ^ lfsr_q[2] ^ lfsr_q[3] ^ lfsr_q[5] ^ lfsr_q[7] ^ lfsr_q[8] ^ lfsr_q[10] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[21] ^ lfsr_q[22] ^ lfsr_q[23] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[28] ^ lfsr_q[29] ^ i_data[0] ^ i_data[2] ^ i_data[3] ^ i_data[5] ^ i_data[7] ^ i_data[8] ^ i_data[10] ^ i_data[15] ^ i_data[16] ^ i_data[21] ^ i_data[22] ^ i_data[23] ^ i_data[24] ^ i_data[25] ^ i_data[28] ^ i_data[29];
    lfsr_c[8] = lfsr_q[0] ^ lfsr_q[1] ^ lfsr_q[3] ^ lfsr_q[4] ^ lfsr_q[8] ^ lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[17] ^ lfsr_q[22] ^ lfsr_q[23] ^ lfsr_q[28] ^ lfsr_q[31] ^ i_data[0] ^ i_data[1] ^ i_data[3] ^ i_data[4] ^ i_data[8] ^ i_data[10] ^ i_data[11] ^ i_data[12] ^ i_data[17] ^ i_data[22] ^ i_data[23] ^ i_data[28] ^ i_data[31];
    lfsr_c[9] = lfsr_q[1] ^ lfsr_q[2] ^ lfsr_q[4] ^ lfsr_q[5] ^ lfsr_q[9] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[18] ^ lfsr_q[23] ^ lfsr_q[24] ^ lfsr_q[29] ^ i_data[1] ^ i_data[2] ^ i_data[4] ^ i_data[5] ^ i_data[9] ^ i_data[11] ^ i_data[12] ^ i_data[13] ^ i_data[18] ^ i_data[23] ^ i_data[24] ^ i_data[29];
    lfsr_c[10] = lfsr_q[0] ^ lfsr_q[2] ^ lfsr_q[3] ^ lfsr_q[5] ^ lfsr_q[9] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[16] ^ lfsr_q[19] ^ lfsr_q[26] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[31] ^ i_data[0] ^ i_data[2] ^ i_data[3] ^ i_data[5] ^ i_data[9] ^ i_data[13] ^ i_data[14] ^ i_data[16] ^ i_data[19] ^ i_data[26] ^ i_data[28] ^ i_data[29] ^ i_data[31];
    lfsr_c[11] = lfsr_q[0] ^ lfsr_q[1] ^ lfsr_q[3] ^ lfsr_q[4] ^ lfsr_q[9] ^ lfsr_q[12] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[20] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[31] ^ i_data[0] ^ i_data[1] ^ i_data[3] ^ i_data[4] ^ i_data[9] ^ i_data[12] ^ i_data[14] ^ i_data[15] ^ i_data[16] ^ i_data[17] ^ i_data[20] ^ i_data[24] ^ i_data[25] ^ i_data[26] ^ i_data[27] ^ i_data[28] ^ i_data[31];
    lfsr_c[12] = lfsr_q[0] ^ lfsr_q[1] ^ lfsr_q[2] ^ lfsr_q[4] ^ lfsr_q[5] ^ lfsr_q[6] ^ lfsr_q[9] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[21] ^ lfsr_q[24] ^ lfsr_q[27] ^ lfsr_q[30] ^ lfsr_q[31] ^ i_data[0] ^ i_data[1] ^ i_data[2] ^ i_data[4] ^ i_data[5] ^ i_data[6] ^ i_data[9] ^ i_data[12] ^ i_data[13] ^ i_data[15] ^ i_data[17] ^ i_data[18] ^ i_data[21] ^ i_data[24] ^ i_data[27] ^ i_data[30] ^ i_data[31];
    lfsr_c[13] = lfsr_q[1] ^ lfsr_q[2] ^ lfsr_q[3] ^ lfsr_q[5] ^ lfsr_q[6] ^ lfsr_q[7] ^ lfsr_q[10] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[16] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[22] ^ lfsr_q[25] ^ lfsr_q[28] ^ lfsr_q[31] ^ i_data[1] ^ i_data[2] ^ i_data[3] ^ i_data[5] ^ i_data[6] ^ i_data[7] ^ i_data[10] ^ i_data[13] ^ i_data[14] ^ i_data[16] ^ i_data[18] ^ i_data[19] ^ i_data[22] ^ i_data[25] ^ i_data[28] ^ i_data[31];
    lfsr_c[14] = lfsr_q[2] ^ lfsr_q[3] ^ lfsr_q[4] ^ lfsr_q[6] ^ lfsr_q[7] ^ lfsr_q[8] ^ lfsr_q[11] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[23] ^ lfsr_q[26] ^ lfsr_q[29] ^ i_data[2] ^ i_data[3] ^ i_data[4] ^ i_data[6] ^ i_data[7] ^ i_data[8] ^ i_data[11] ^ i_data[14] ^ i_data[15] ^ i_data[17] ^ i_data[19] ^ i_data[20] ^ i_data[23] ^ i_data[26] ^ i_data[29];
    lfsr_c[15] = lfsr_q[3] ^ lfsr_q[4] ^ lfsr_q[5] ^ lfsr_q[7] ^ lfsr_q[8] ^ lfsr_q[9] ^ lfsr_q[12] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[24] ^ lfsr_q[27] ^ lfsr_q[30] ^ i_data[3] ^ i_data[4] ^ i_data[5] ^ i_data[7] ^ i_data[8] ^ i_data[9] ^ i_data[12] ^ i_data[15] ^ i_data[16] ^ i_data[18] ^ i_data[20] ^ i_data[21] ^ i_data[24] ^ i_data[27] ^ i_data[30];
    lfsr_c[16] = lfsr_q[0] ^ lfsr_q[4] ^ lfsr_q[5] ^ lfsr_q[8] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[22] ^ lfsr_q[24] ^ lfsr_q[26] ^ lfsr_q[29] ^ lfsr_q[30] ^ i_data[0] ^ i_data[4] ^ i_data[5] ^ i_data[8] ^ i_data[12] ^ i_data[13] ^ i_data[17] ^ i_data[19] ^ i_data[21] ^ i_data[22] ^ i_data[24] ^ i_data[26] ^ i_data[29] ^ i_data[30];
    lfsr_c[17] = lfsr_q[1] ^ lfsr_q[5] ^ lfsr_q[6] ^ lfsr_q[9] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[22] ^ lfsr_q[23] ^ lfsr_q[25] ^ lfsr_q[27] ^ lfsr_q[30] ^ lfsr_q[31] ^ i_data[1] ^ i_data[5] ^ i_data[6] ^ i_data[9] ^ i_data[13] ^ i_data[14] ^ i_data[18] ^ i_data[20] ^ i_data[22] ^ i_data[23] ^ i_data[25] ^ i_data[27] ^ i_data[30] ^ i_data[31];
    lfsr_c[18] = lfsr_q[2] ^ lfsr_q[6] ^ lfsr_q[7] ^ lfsr_q[10] ^ lfsr_q[14] ^ lfsr_q[15] ^ lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[23] ^ lfsr_q[24] ^ lfsr_q[26] ^ lfsr_q[28] ^ lfsr_q[31] ^ i_data[2] ^ i_data[6] ^ i_data[7] ^ i_data[10] ^ i_data[14] ^ i_data[15] ^ i_data[19] ^ i_data[21] ^ i_data[23] ^ i_data[24] ^ i_data[26] ^ i_data[28] ^ i_data[31];
    lfsr_c[19] = lfsr_q[3] ^ lfsr_q[7] ^ lfsr_q[8] ^ lfsr_q[11] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[20] ^ lfsr_q[22] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[27] ^ lfsr_q[29] ^ i_data[3] ^ i_data[7] ^ i_data[8] ^ i_data[11] ^ i_data[15] ^ i_data[16] ^ i_data[20] ^ i_data[22] ^ i_data[24] ^ i_data[25] ^ i_data[27] ^ i_data[29];
    lfsr_c[20] = lfsr_q[4] ^ lfsr_q[8] ^ lfsr_q[9] ^ lfsr_q[12] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[21] ^ lfsr_q[23] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[28] ^ lfsr_q[30] ^ i_data[4] ^ i_data[8] ^ i_data[9] ^ i_data[12] ^ i_data[16] ^ i_data[17] ^ i_data[21] ^ i_data[23] ^ i_data[25] ^ i_data[26] ^ i_data[28] ^ i_data[30];
    lfsr_c[21] = lfsr_q[5] ^ lfsr_q[9] ^ lfsr_q[10] ^ lfsr_q[13] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[22] ^ lfsr_q[24] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[29] ^ lfsr_q[31] ^ i_data[5] ^ i_data[9] ^ i_data[10] ^ i_data[13] ^ i_data[17] ^ i_data[18] ^ i_data[22] ^ i_data[24] ^ i_data[26] ^ i_data[27] ^ i_data[29] ^ i_data[31];
    lfsr_c[22] = lfsr_q[0] ^ lfsr_q[9] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[14] ^ lfsr_q[16] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[23] ^ lfsr_q[24] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[29] ^ lfsr_q[31] ^ i_data[0] ^ i_data[9] ^ i_data[11] ^ i_data[12] ^ i_data[14] ^ i_data[16] ^ i_data[18] ^ i_data[19] ^ i_data[23] ^ i_data[24] ^ i_data[26] ^ i_data[27] ^ i_data[29] ^ i_data[31];
    lfsr_c[23] = lfsr_q[0] ^ lfsr_q[1] ^ lfsr_q[6] ^ lfsr_q[9] ^ lfsr_q[13] ^ lfsr_q[15] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[29] ^ lfsr_q[31] ^ i_data[0] ^ i_data[1] ^ i_data[6] ^ i_data[9] ^ i_data[13] ^ i_data[15] ^ i_data[16] ^ i_data[17] ^ i_data[19] ^ i_data[20] ^ i_data[26] ^ i_data[27] ^ i_data[29] ^ i_data[31];
    lfsr_c[24] = lfsr_q[1] ^ lfsr_q[2] ^ lfsr_q[7] ^ lfsr_q[10] ^ lfsr_q[14] ^ lfsr_q[16] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[30] ^ i_data[1] ^ i_data[2] ^ i_data[7] ^ i_data[10] ^ i_data[14] ^ i_data[16] ^ i_data[17] ^ i_data[18] ^ i_data[20] ^ i_data[21] ^ i_data[27] ^ i_data[28] ^ i_data[30];
    lfsr_c[25] = lfsr_q[2] ^ lfsr_q[3] ^ lfsr_q[8] ^ lfsr_q[11] ^ lfsr_q[15] ^ lfsr_q[17] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[21] ^ lfsr_q[22] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[31] ^ i_data[2] ^ i_data[3] ^ i_data[8] ^ i_data[11] ^ i_data[15] ^ i_data[17] ^ i_data[18] ^ i_data[19] ^ i_data[21] ^ i_data[22] ^ i_data[28] ^ i_data[29] ^ i_data[31];
    lfsr_c[26] = lfsr_q[0] ^ lfsr_q[3] ^ lfsr_q[4] ^ lfsr_q[6] ^ lfsr_q[10] ^ lfsr_q[18] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[22] ^ lfsr_q[23] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[28] ^ lfsr_q[31] ^ i_data[0] ^ i_data[3] ^ i_data[4] ^ i_data[6] ^ i_data[10] ^ i_data[18] ^ i_data[19] ^ i_data[20] ^ i_data[22] ^ i_data[23] ^ i_data[24] ^ i_data[25] ^ i_data[26] ^ i_data[28] ^ i_data[31];
    lfsr_c[27] = lfsr_q[1] ^ lfsr_q[4] ^ lfsr_q[5] ^ lfsr_q[7] ^ lfsr_q[11] ^ lfsr_q[19] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[23] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[29] ^ i_data[1] ^ i_data[4] ^ i_data[5] ^ i_data[7] ^ i_data[11] ^ i_data[19] ^ i_data[20] ^ i_data[21] ^ i_data[23] ^ i_data[24] ^ i_data[25] ^ i_data[26] ^ i_data[27] ^ i_data[29];
    lfsr_c[28] = lfsr_q[2] ^ lfsr_q[5] ^ lfsr_q[6] ^ lfsr_q[8] ^ lfsr_q[12] ^ lfsr_q[20] ^ lfsr_q[21] ^ lfsr_q[22] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[30] ^ i_data[2] ^ i_data[5] ^ i_data[6] ^ i_data[8] ^ i_data[12] ^ i_data[20] ^ i_data[21] ^ i_data[22] ^ i_data[24] ^ i_data[25] ^ i_data[26] ^ i_data[27] ^ i_data[28] ^ i_data[30];
    lfsr_c[29] = lfsr_q[3] ^ lfsr_q[6] ^ lfsr_q[7] ^ lfsr_q[9] ^ lfsr_q[13] ^ lfsr_q[21] ^ lfsr_q[22] ^ lfsr_q[23] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[31] ^ i_data[3] ^ i_data[6] ^ i_data[7] ^ i_data[9] ^ i_data[13] ^ i_data[21] ^ i_data[22] ^ i_data[23] ^ i_data[25] ^ i_data[26] ^ i_data[27] ^ i_data[28] ^ i_data[29] ^ i_data[31];
    lfsr_c[30] = lfsr_q[4] ^ lfsr_q[7] ^ lfsr_q[8] ^ lfsr_q[10] ^ lfsr_q[14] ^ lfsr_q[22] ^ lfsr_q[23] ^ lfsr_q[24] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[30] ^ i_data[4] ^ i_data[7] ^ i_data[8] ^ i_data[10] ^ i_data[14] ^ i_data[22] ^ i_data[23] ^ i_data[24] ^ i_data[26] ^ i_data[27] ^ i_data[28] ^ i_data[29] ^ i_data[30];
    lfsr_c[31] = lfsr_q[5] ^ lfsr_q[8] ^ lfsr_q[9] ^ lfsr_q[11] ^ lfsr_q[15] ^ lfsr_q[23] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[30] ^ lfsr_q[31] ^ i_data[5] ^ i_data[8] ^ i_data[9] ^ i_data[11] ^ i_data[15] ^ i_data[23] ^ i_data[24] ^ i_data[25] ^ i_data[27] ^ i_data[28] ^ i_data[29] ^ i_data[30] ^ i_data[31];
end

//*delay
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n) begin
        lfsr_q  <= {32{1'b1}};
        o_crc32 <= 32'b0;
        o_crc32_en <= 1'b0;
    end
    else begin
        lfsr_q  <= i_data_en ? lfsr_c : lfsr_q;
        o_crc32 <= i_data_en ? lfsr_c : lfsr_q;
        o_crc32_en <= i_data_en ? 1'b1 : 1'b0;
    end
end

endmodule