/*
 * @Filename: 
 * @Author: ws
 * @Description: 
 * @Date: 2023-11-16 14:57:05
 * @LastEditTime: 2023-11-16 20:37:38
 * @Company: 662
 */

module CocoSketch
    #(parameter RAM_PTR=11,
                HASH_BASE=0)
    (
    /****************clock****************/
     input wire         i_clk
    ,input wire         i_rst_n

    /************input element************/
    ,input wire [95:0]  hash_e_f  
    ,input wire         valid

    /***********output element************/
    ,output reg [63:0]  o_uv
    ,output reg         o_uv_en
    ,output reg [95:0]  o_u1v1PureCnt
    ,output reg         o_u1v1PureCnt_en
);


/*******************ram*******************/
//a port:only read; b port:only write
//X_value: operate key_part's RAM
reg     [RAM_PTR-1:0]   ram_addr_key_a;
reg     [127:0]         ram_data_key_a;
reg                     ram_wren_key_a;
reg                     ram_rden_key_a;
wire    [127:0]         ram_out_key_a;
reg     [RAM_PTR-1:0]   ram_addr_key_b;
reg     [127:0]         ram_data_key_b;
reg                     ram_wren_key_b;
reg                     ram_rden_key_b;
wire    [127:0]         ram_out_key_b;

/*************control signal*************/
reg     [95:0]  hash_e_f2;
reg             valid2;
reg     [95:0]  hash_e_f3;
reg             valid3;
reg     [95:0]  hash_e_f4;
reg             valid4;
reg     [95:0]  hash_e_f5;
reg             valid5;

reg     [127:0]  ram_data_value;
reg     [127:0]  ram_data_value_2;
reg     [127:0]  ram_data_value_2_copy;

//* generate random number, lfsr
reg [31:0]  P_ramdom;
always@(posedge i_clk or negedge i_rst_n) begin
    if(!i_rst_n)begin
        P_ramdom <= 32'b1;
    end
    else begin
        P_ramdom[0] <= P_ramdom[31];
        P_ramdom[1] <= P_ramdom[0] ^ P_ramdom[31];
        P_ramdom[2] <= P_ramdom[1] ^ P_ramdom[31];
        P_ramdom[3] <= P_ramdom[2] ^ P_ramdom[31];
        P_ramdom[4] <= P_ramdom[3];
        P_ramdom[5] <= P_ramdom[4] ^ P_ramdom[31];
        P_ramdom[6] <= P_ramdom[5];
        P_ramdom[7] <= P_ramdom[6] ^ P_ramdom[31];
        P_ramdom[8] <= P_ramdom[7];
        P_ramdom[9] <= P_ramdom[8];
        P_ramdom[10] <= P_ramdom[9];
        P_ramdom[11] <= P_ramdom[10];
        P_ramdom[12] <= P_ramdom[11];
        P_ramdom[13] <= P_ramdom[12];
        P_ramdom[14] <= P_ramdom[13];
        P_ramdom[15] <= P_ramdom[14];
        P_ramdom[16] <= P_ramdom[15];
        P_ramdom[17] <= P_ramdom[16];
        P_ramdom[18] <= P_ramdom[17];
        P_ramdom[19] <= P_ramdom[18];
        P_ramdom[20] <= P_ramdom[19];
        P_ramdom[21] <= P_ramdom[20];
        P_ramdom[22] <= P_ramdom[21];
        P_ramdom[23] <= P_ramdom[22];
        P_ramdom[24] <= P_ramdom[23];
        P_ramdom[25] <= P_ramdom[24];
        P_ramdom[26] <= P_ramdom[25];
        P_ramdom[27] <= P_ramdom[26];
        P_ramdom[28] <= P_ramdom[27];
        P_ramdom[29] <= P_ramdom[28];
        P_ramdom[30] <= P_ramdom[29];
        P_ramdom[31] <= P_ramdom[30];
    end
end

/**************main logic***************/
always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        o_uv <= 64'b0;
        o_uv_en <= 1'b0;
        o_u1v1PureCnt <= 96'b0;
        o_u1v1PureCnt_en <= 1'b0;

        ram_addr_key_a <= {(RAM_PTR){1'b0}};
        ram_data_key_a <= 128'b0;
        ram_wren_key_a <= 1'b0;
        ram_rden_key_a <= 1'b0;
        ram_addr_key_b <= {(RAM_PTR){1'b0}};
        ram_data_key_b <= 128'b0;
        ram_wren_key_b <= 1'b0;
        ram_rden_key_b <= 1'b0;

        hash_e_f2 <= 96'b0;
        valid2 <= 1'b0;
        hash_e_f3 <= 96'b0;
        valid3 <= 1'b0;
        hash_e_f4 <= 96'b0;
        valid4 <= 1'b0;
        hash_e_f5 <= 96'b0;
        valid5 <= 1'b0;

        ram_data_value <= 128'b0;
        ram_data_value_2 <= 128'b0;
        ram_data_value_2_copy <= 128'b0;
    end

    else begin
        hash_e_f2 <= hash_e_f;
        valid2 <= valid;
        hash_e_f3 <= hash_e_f2;
        valid3 <= valid2;
        hash_e_f4 <= hash_e_f3;
        valid4 <= valid3;
        hash_e_f5 <= hash_e_f4;
        valid5 <= valid4;

        ram_data_value <= ram_out_key_a;
        ram_data_value_2 <= ram_data_value;
        ram_data_value_2_copy <= ram_data_value;

        if(valid)begin
            ram_addr_key_a <= hash_e_f[HASH_BASE+RAM_PTR-1+64:HASH_BASE+64];
            ram_wren_key_a <= 1'b0;
            ram_rden_key_a <= 1'b1;
        end
        else begin
            ram_addr_key_a <= {(RAM_PTR){1'b0}};
            ram_wren_key_a <= 1'b0;
            ram_rden_key_a <= 1'b0;              
        end

        if(valid5)begin
            if((64'b0 == ram_data_value_2[127:64])||(hash_e_f5[63:0] == ram_data_value_2[127:64]))begin
                o_uv <= 64'b0;
                o_uv_en <= 1'b0;
                o_u1v1PureCnt <= 96'b0;
                o_u1v1PureCnt_en <= 1'b0;
                ram_addr_key_b <= hash_e_f5[HASH_BASE+RAM_PTR-1+64:HASH_BASE+64];
                ram_data_key_b[127:64] <= hash_e_f5[63:0];
                ram_data_key_b[63:32] <= ram_data_value_2[63:32] + 1'b1;
                ram_data_key_b[31:0] <= ram_data_value_2[31:0] + 1'b1;
                ram_wren_key_b <= 1'b1;
                ram_rden_key_b <= 1'b0;
            end
            else begin
                ram_addr_key_b <= hash_e_f5[HASH_BASE+RAM_PTR-1+64:HASH_BASE+64];
                ram_data_key_b[63:32] <= ram_data_value_2_copy[63:32] + 32'b1;
                ram_wren_key_b <= 1'b1;
                ram_rden_key_b <= 1'b0;
                if(32'b1 == P_ramdom[1:0])begin
                    o_uv <= hash_e_f5[63:0];
                    o_uv_en <= 1'b1;    
                    o_u1v1PureCnt <= {ram_data_value_2_copy[127:64],ram_data_value_2_copy[31:0]};
                    o_u1v1PureCnt_en <= 1'b1;
                    ram_data_key_b[127:64] <= hash_e_f5[63:0];
                    ram_data_key_b[31:0] <= 32'b1;
                end
                else begin
                    o_uv <= hash_e_f5[63:0];
                    o_uv_en <= 1'b1;    
                    o_u1v1PureCnt <= 96'b0;
                    o_u1v1PureCnt_en <= 1'b0;
                    ram_data_key_b[127:64] <= ram_data_value_2[127:64];
                    ram_data_key_b[31:0] <= ram_data_value_2[31:0];
                end
            end           
        end
        else begin
            o_uv <= 64'b0;
            o_uv_en <= 1'b0;
            o_u1v1PureCnt <= 96'b0;
            o_u1v1PureCnt_en <= 1'b0;
            ram_addr_key_b <= {(RAM_PTR){1'b0}};
            ram_data_key_b <= 32'b0;
            ram_wren_key_b <= 1'b0;
            ram_rden_key_b <= 1'b0;       
        end 
      
    end
end

/**************generate ram**************/
    ram_2048_128 ram_2048_128_key(
		 .clka              (i_clk				    )	//a clock, a port is used for read
        ,.ena				(ram_rden_key_a	        )	//enable
        ,.wea				(!ram_rden_key_a		)	//ena==1, wea=1:write; wea=0:read
        ,.addra				(ram_addr_key_a		    )	//read address
        ,.dina				(128'b0				    )
        ,.douta				(ram_out_key_a          )   //read data from ram
        ,.clkb			    (i_clk				    )	//a clock, a port is used for write
        ,.enb				(ram_wren_key_b         )   //enable
        ,.web				(ram_wren_key_b         )   //ena==1, wea=1:write; wea=0:read
        ,.addrb				(ram_addr_key_b		    )   //write address
        ,.dinb				(ram_data_key_b         )   //write data to ram
        ,.doutb				(                       )
	);

endmodule

