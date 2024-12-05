// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 17 09:56:03 2023
// Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/SourceCode/Xilinx/ErrorFunnel/ErrorFunnel.gen/sources_1/ip/ram_2047_17/ram_2047_17_sim_netlist.v
// Design      : ram_2047_17
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_2047_17,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module ram_2047_17
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [16:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [16:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [16:0]dina;
  wire [16:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [16:0]NLW_U0_douta_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [16:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     4.8161 mW" *) 
  (* C_FAMILY = "virtex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ram_2047_17.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2047" *) 
  (* C_READ_DEPTH_B = "2047" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "17" *) 
  (* C_READ_WIDTH_B = "17" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2047" *) 
  (* C_WRITE_DEPTH_B = "2047" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "17" *) 
  (* C_WRITE_WIDTH_B = "17" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  ram_2047_17_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[16:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[16:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27984)
`pragma protect data_block
kt4MtnwuY6Q3LU34tU0T2lWgVHEAiuuRV2xNftMoR4M0F/aBhej9j5J5ZCX6YuzYUqUrYIeYDNnQ
ceacvxoodGPK8+AfZRIBYWUZWdv6UmMcF9es2bogmeX4VLM6KFF30g6zYj1gaUu/Qombr6cf88Hd
youpcUvCdg23HY5eEXhJbYOIIfATthxF5Fparkk6ZH2dEia3MkMNudnRqSaqPyJ89LfDremVVWAJ
qi2wDq1mqT1eeBqeVMyIHx960rKxom3rYVrOMYyYwXPJQIohCFV/pCUkD0AV1D+73BIgkqU+E4So
6wY0k+F0YecsYrgUL7HyemxrtHp26zhpi5Vy4Rpi7GSMvQqVYhEwrtNyc2JEM2O/sS9vNhGhcm/0
yRVP9jw1Yn7YXYHxsZyYx431E3xJFm7J4lwga/o8usY2SoQpV8zaj+UUEo2FBGWrKUbxkDcfb7Id
p9GnXXZ71saitG4SLM3HUshyY+rEN06izlePNJUSR3IGqIixAwFQmy26UZGT7FmkME2YND+CGooY
6JstRVE7n6BrC8TJSi8JMBOKlXWcyAkyOIBYTtT6GQqAQvZUeImsqd3EdqkyMpMiorabYvzW+LHw
Y5Yle2KZsKT1qOJ6/oc4X4lxysMnr8uJRkd7sfecIjjEaDs/5sgzrq+Td4eNx/hqTDAQG8nhuEIS
DhZxbho3/ONSWQregyEQzqwZTxgRtaVRYANyTLIfpcIckkWmcSS9BiNVNPgC2WbQWxSxhNLWM5b+
Kw2IR7CaHm1NmScfEnA4bEZ7ureyeySjQzpQ5qEE6xjL9r+K6e6kW+glTQV/wMmaSvA8JR3hy97C
pu8N/RyAZV/BDyikQaHZTQ2GCPZ5iRc9gxdfVQh9jxP8wo4YyjF9VtnrAr7qCBJhQzqwFdulYrWi
xNUix095SV6mHsQj7fC+MqG4BufMZBg2QsL695f7tEYnXuGDTJhVl3QiPpTrN/bKB7EQtHqSfxSV
9zrWxjQt86eHhSaP71SCfkIeCGMAQREfD/dONBJZp7T/uHvnKIhZjZD+NoYrs4ajrZEhrnTSp0FP
4PeIr23r28B2SsEUu7KqStxzDrgOVr5IFeykiNj92wE1nhcm/X9DYI79Ikganct8CKrtNr3OiS+X
9W2t3IDdbtGPjdW4KrJs+6W7+97zAH/5PAyhJ/umvkPZlBMn+/FHhspdwQWjP5anhYh4QjKa6mzP
/WewX66RUvHumOKCA1Xr6plo31Yk5QAr5IOaEys46Db//mje5DSYDo/j3vpc7qKj7iRQjGknbpz9
NMc3wH5Rz8QOsY1L+xkz6iTu9+JiFKJHo+ZefCLXGdZrWI34e9eJIy5xp/ptbhpE301vYvnAVTt5
f3ff0gFQlhFeTj/DfbwmBYPG94jZBzn0ad4flP1QYY+qfnGYC/Jqp813+Xdf01738YXKacIM4d1U
EQQsQomYYVWYAxByXZoM+b97+s10zygR0WdefzBMj6fLun2PLhXt17ReFoV2FbbQK9/dPydABW0E
7rLMmok5iHD1WLc3VAf8nUsUcezRVfOl1a8HdFA05Ki9Mnwyh+5aSp+dTUJvIB3shfdMgdKq9NNl
qM6Uf3Zgod7SIDcP3bCdgq+3TcRcfL8ccS3jFFdj+EEnUVW0YmPLDWFLcJT72Qwdjnx5KdN4O+tD
AuwIV9Ih4KQaWw07Gu7gHrPPX5cPiHxH12JkILGjplfASvq1cH9St2zfFG171qsuk+dop/tWpVCP
oZFrrj45+hVW0p0kn0A8FPEu1KtFWPrWNVEvgS+yal69vDY+OMEisNni01iE0P2MhJhg2TQFyhhW
+oitanenCiXScrSduvaRYX8I4RLjRmcPHFw0m/zSzgGJQmKy8cq/AEAjde2pJKd5mnssoS/i95nQ
ZyijkKBgTyCSB2E6mAEVcmWS2zx3Q+FtOtcb+F40zwyH9HTmfvYULo6hU4ehBQ5mRqeITJOq/5Kz
Akr1Ah0Aryo6Nwr6ZovIncQ7GnDWM9BOYZJJF2rIHJk6iK1xB3vDcykO90e1P3a3wSswsr00kaE9
gGyoVM2YTvkDwBqXHUbnTFKSJ35pGrDUUIQeQ7z5KxD54URH+G/N10UwzkU9j2xEeS27aQMyRIrm
BPeVT6hIsLHFI6JVYqGQLze94UaWJPT/7dQtYrujErBngEVZKjKFfNMbMoHZ/AkLqnmWmGLiL5pk
vLu8aOZ1UIeUzNkztpWf7m786b/jOlhS6HUd2G1ilp0VfQ7/H7kt80Sl0Oizugxnk0dW6hmvfTuT
tfaGKjZcO6VmURNgbvh4858PQLvgFtAB0xRPW8YDfOf/MaWGOzT0Pw59mMq2SIsAcnVEWyLJzhz5
1gMzK/y/wVDy0JWacBnTc/6WYWkLbuSu4nxI8cbPEyj879CBNf8wcqI8mj1+ma93HC5DY5yHTk48
RAo2DAlxLljQWGK6D2zD4sgKcAnlaoquyQFHPxEqab75kVK24/TMDhVcv3VSqS4zA030Tt5sK/Z9
yux3CtRFKD3pOgMT94U4f+uXgv9I62o2GJBp1LzEZ0iFajt+AwI0/EMr2lRA+gif4cahQdpAs7se
7vF3AtBhm86TS2zj1M4IlHcxVFawqqvBti+FOYNvtMFV4pzEetRDaB8/g25i6KfZes187y6pw3ox
i56haxZnDEldnhffLojZqwDVj1OB5GFBHmFIDNqvKpWRuWDIV7Ju2Gvsn+ZGKFqluPTsAjTSvB/K
jfJCqUQ7QFXomy/aV7d25guPNKcm5owqJtMFrDdiX2NDdoUnnR+YiGJ7abcvDRSYc+mrPDgK0rEv
qSxnqy4nHUyL9nT53jli+k1uh8bMEkgEejry1z2DpBiEzpGOSSPR38fynlPGzZqO/8Gp+4uABd2v
a/zSa3AruxTDyuSAtwOyCi8wzvYo41P/rAvPcbQ9qaP2iqj44KYkMq6ihRXdiJsTI6/V0paBtlcN
0ETYONTBXVu57Cof/lB02HNb6KPYCaEbFfFK0n4CAEcQreo10u+HyRIRbgeN+bB0/4Db8a965MCA
qM401nna9Vu7fD8zXYxtq7sZAESvB32coZ6NLcY3uQu3KSPVltjG5GiV6Mw11OuCR50QZvNah5Yq
3Z1408kkQVDnxOm1kqTXUfVmz2DlBcUxm+8BtMjFXfb5rcxi2m4+oVdES1020U5y7JNDUGmvnXss
QsRLP23wH2CDr7xgxBtPV/B5s6aBKJDA7HpF6mlh7RRAxn23uig0sQ9gx2x8VdOStqnQ0yYnwnsz
cFw0TYT/DlYTpbAY8AoB/U9xGfwZUAB5f7BrpqT359N0ooij4ZklNRDy9oque2ZHr7BYYTLf9LxF
wmCloBN2mbgCHBcZnd5et7viaTlD3G0tzJPjon6xJTwMQjGWYUUk786H4gx1/z6KShLcTu24Fp40
S2BxIC4cpAqHMBm64qilDxNnfXm/84OGFBmgaB+qxRRmVFnOukyxgq0YKN2ovNCj7kARi1Us+f4+
MacoVJlDOuCbnseTH4G4RW0d0cxpk+eh16BfjXrZcZEW8EJs7iQVQA73dcVNd3r/7tc1JK9Mf9Md
ukpHpcadpG/71cTUE/ggbFXkRyQXhO3Ox4vvLjp+OiRUWDu0f8kKfY9oF3/ROMvjm9djuG0/9szO
5WXxHFMHqzG/VnVQhy2tfXLY45C9W/aSqh1FqFE+sPJtiD8lRS7G/Pc+AcClCxm+4QxQY9eFKRzy
cIgmRXtIZsdEb12hcHFBZFzsmqGAT0B9g4ej6yJR9Z+9lba4H/rU/UuAUTQJyyOYbYib4hR/bcOs
zfx6UoAXeHR4+R3JXWMoXbbSuJDwMrOcXfXPBLn98f07dQqqMMmIKgGSczwW1uY6x5i/v/cixFLV
Ya6O3TqnvpOO/lBTByg9gGh91xlMAfcZtntxzsni23RT4oGOdnBwNRxpwVdAaFXBA3gOQWET9Vuu
UPhVvZtyDwG4jTYLaIiEqLEZ8lWDSCTIosnZcxXZNDbFRQj7mzAEuKL2uscMvknG135nhG0j4kBl
kBtgc9shO8iDwROncFOOgTEdocSfNs38RC0ZNtCTRlPkmcAJTQKcGSMYjdPKhvJ2YnpDEd1neM3d
NzGXzKc4CPqQTkoLF5hlbjZyj+9aD5JK1PNTYbebk2FgIINjPMcyIT/C/VLpsIuY9GnMQuccXr4g
N+5eOnOu3ZAiiamDhbw6DLFVEL7Rh7taKcxxhZbwwC3SZUiTtDanZ/j31aO0u1BDAUdZI2spnKHv
tOEIkg+fLUCtzoNH0IBFGJHP7n+dmO/czSyhsHKcaSu+9UHu8mn3if65GsT9b7QlcQkUhxbusOd4
aljVFuLVJk2bcS5hn9bwZYTtsdJ7YAF0HBCSqf8uoAfz59iGKGarcogEYzKwymr93657UXhfzV6q
ijuxITSNNgxeW4UkYF+hKY6Eye1kj8FYsDcR2TV0lmGXTmusaQQVzwjxRWDf8rt5k57gNSiKWu5r
SS+vf0KsJdZR021sATr/mGpdE83f6TMZdGk7hHz5m1SxTbDz+smzsnBjMpGO4ztD2BNFO/z+ZfEQ
Yv5w/yyNDBmEXTlOD7olcmkYOfnrM6+FCR1t5xLR0nfgbiEN35MBaz5wdSlUdKr1Zhpg7mfQImkr
7607FijKF1U6BbGAQFnSO635kNL/+hOJQiiP/AJZEZl5qwPbYG97GTOtkGm6JKy55b4J4YpjeSdp
fz9pIDsAO10pnA2VjlAOGwOk3i1p2tRuXEn+lgvfkM8Wm4RZauAOzxDSr6wETfv1n+lUwwfQi+ab
HULmeIVtB7qJvOTsnuqBDuc8ETOFadM9KHSUnv/9cbi/TgFp8f/MH4I9k6UNaH3Nu2pNWKPgtFqo
CNc+bVZ41WSI+/X0QPRVovFKbBXtRURiy1lE5yB0RbTYwrz4EYCO+Ulb3UGKBb/b7yH6sUlaEs9H
M6rzyDLgjRZTkeWKBINyQwVO9UfvnyjnMkfvdQnnJuemC+yEKF7zgmdZN5om6K8yWQ2D8/0NySuZ
RULHvHit0yE/czf8dxnK0IgFmzpAgnVXgx2gC0KhK6FPV2qvEWsxznD3n++sKs+HVnhYae7oUZSB
UYp0rxwrcN7BveaM2ZSTpYwdkNFwobTSKCzwgP7BOkMEfURglrrC/qmoTDsT/yAs2v+c1USGwfzt
npDGszEP5XAUvapLX96r1+bYHRvke+2U04xflomjOhclreShde+KjNl7x71oI91xXg5PvQQLRY7y
crkvxHy6y5G3KXV0/QREsig5Hen6CdyuqnzHvRCNTyG/J9iq7yKBNJ3TqK1TkxG2MKF9I505/sdQ
e4mKvXgnXlmxrqFpZEFG3JzKi072W4dco3zsZngQRTu7jnEaisyXPfCiCgf6A/tCmvUc66G8x2dT
EstlcNtAmw1kcKUiQwhyPHGnLDRsEIJ9cHscGloQ2n/O7zYWVWsywoW5PcmdSRxxm8vR2lvyRo5J
E9XDM3IC0VNpKCST/vjzloQI3Ty6L7YT35xcv7bHgNNi7w29d+Nd/tc/A0oubWu+fids30OQyZKm
zK45Y8HU8C2Tl7MfDgtGT7afIur8p29AXNuBg1j4Dh40KbiSKOXEmMPMaskd/JroLX4ZnmbfzI5A
TgDGuR03J6du+6BDEnPRiKaWuxFsCPYuGhV8a4mZFD+9ASGUPx6qjNFj6/C5RWOckILiWrhzQ+6F
SSEDb1dMnhPm6R7juRZpdQaq58nFuGkW9jpKqJZgGVLT+7XpqfChPaXJZ6Qv+BZEHMRw0ZPZziMH
PusFXE808kj+VIhNjvCFdLHB2pJ61+I8HhFIe4re0iUhWv2xZFWDe31ljIQ2Z2eXoH8Wj5ImFTG8
hNqdgw+c7+LE8zp+HG3TsHR0LVII23m6ZoY7QSDpXmGZvgKHp8oEh8iFzfUpkbKaKgA4QpOciz5L
kU1WTJMezgbQsn1/JryWvyuADe4UVQPPGDfkioY0IFAXRV9r9wdVUYXuBYxDonOoEEsSaYvLcUDX
a4km31xnWTyJL81U/RbP7JgaeC6R9epw4LDJNY+ZkxW/I4Mcm9idHlTiWUZZ6XiZDJHbWcmxuaOk
o7y3NIngJ5z50PZWzkDX57nZ4ygGvQDRg7vOcrNfEH02pJgJArGZh7ILcba+TGGTxPFjdXhg2X4O
MpRklfKiCIa2PsjPgq8rx5034CsP86oj4P/ihJ5hfzYYqCLJnYBVVtPIcePp1XfOxdedFIkAua2w
UsY//I245Oxhd/+HIrq0FBbP+Becp/cIZOsO0HrwNfgaLbQ7/IFSU1rY0YDskHHmCUwd/Xut9I+x
O9VvdvW63vJSdirbUnROm2sBOLDgZwEqcPClxosrkTU5RIWoEhE0QWDX7o1wg6HZGCe/IKGEYFr/
BWR2sv+VwJ6ug/XffzbqswOEhNrSsx9pJcym+6iIuam8trQNXoI8bnSSz17XSFoUNS4ZlTEGXuT5
m8ODhL7kGtHVkTZN1Ohj44a87NLirLC2C0+4fpJDZroVEKKnDI89MBZz/7OHSiD4HPahrx0tbuvC
GCfdLz5JeQkPZTvsz9AiXe6+YEqHDvnK5GVFE3Jv/QR4K4K/IW2NiUhF7ef0ycVJ2M2zgz9uf9IA
pMRO17bBTAUKI1WlRrWbgt2WD2qi/xjw9vBoYWgdLoyOyf7ibyKfiKEERVmAe0CPun0a5Gsuf0QE
cLxlJcMwF8IwDt+ugz/JmfXzmOTqrHgIpDI28Bj3Cw8oskY7Y/geBfslE+27u2BJRbed1cdjAKUv
4A/3ba6fvpDMIWoJL8KQFu/+EU049xRiUdHkzpfkQxkI8PDUsJlL7A72aIgRbaN/D5snlCLc+4g2
jB6rwxR6JNcZg+gRa3OQTuWJmcmG1/+XCkYKc5ALYzkF33GTEzhsoLp462JIGewlTAA0WPvzGJCr
3rS6KqMj5CmebQ361XfaoY7nKGc8sWkXCKpS/1nhjmN3mz5B1JMOw3nknmUtPyV4jwbXvsAND8+U
lnnJdFPFT7zVHM8U9XAvUMmDgcoP60ypGj//n6ZQAbOyhhHFAQ+2nbdPkUSHXJ/rDks0yja6ETR9
hsnjYbioovISziSfC/o5dil2GDFLemNpXEF+ivFayFhSGiVsJH/tpFRNLZadvsx2HJ0Olthe/aD6
bAfpINIY1Qu6TKBCo3/Zenjf6QhXNLB+jBJfLElRjyv/gDpHmxn5YHe8lC2gMmtJan51GMB5n+Gf
+RgTy9jiQ6wM6JZUR27OxPcuE2NtwwAFmCd0dwNu8Q0aQudglORP2/+m9v1tMwHqUbCcGgy3o8MS
WYqw3cwb2oeiPB7IVfx6wvSnu07sj7ecH/zWp9tlvKWQEaKeEWyD7K9yCJt9AUaHB/mgBXKDHsj2
EayS4Dmm69mcTDDEfoaunGF8C6TAtsLtzmAdEeHTMs1xHml/6209WwXJdDys1UF+UQ4Ml4SnnOaE
UH2BCULrJAkB7odsDzTnRVvgxqn+UyU1qoeRjaeBDOIkU00tsgyQ8z4Atw+QnXLFse48IDf6KZRu
Xr21qpQXVZ6fJDS9J3NeYNT7ZGO8k1o6sFvtBermyFMcfcFwJ0NbqcUqr7VWE1nJyr0m4lSCixH3
GhAhFALI5HYBqgrN1sWOhCLMLZK3Z/289F2epO/0tUKJXDLLvpKXvB0DO+EJj3qaMkIM3QiBw1Ba
W9xQGtKzS36Lgec7GpOXyHbZmNdCL9XY9CnJ9++YI3ONH4ZlNanepkh98nSavTZXGuxK4aVua/a2
2sKz84i76Brp3sHs73c7tX2ld+XKNoQ+8bI896gwINCx2oUimwNb71tqtWozrqTUzO0rJpgPOyM0
j7ycFw3NbNU3/tAUxUAFQk52qBeFjOWGw7H9Jcw8pH1xgSQOsPeLYvt0GFOkCH2eHxowpxSW/IkN
pNQ8jflQtAq3ZfDaM/RTxQADsIiRAoxSubpM/aTZFEgK/L9eajkngtXfkudUAu1o4Gj6VEa/P9eq
3WNDHcF5RrZZA99Lser9tbWU8YV4Pu170FaMsb3vbofK8+/nA+8LRVB5CFgkNhRDLkn7qU82AyZK
2M8onx46cPTvhiLoUMrju8eWnTj2oZsJ/YeYM9AtdxJiHSJVdrDNY+vATGjTj88GhzvTSGPL9pG7
e2HsWV8zSTnqCX5W7tRLyZtEXjZBGlETaZkmjA3d3n4aN244UrVjKHCud2o6I4gUZczS7nE56Wv0
lNbD5BUEOuq4pz6lzVMV70mNCvjY8Mx6gVhqzEhaEvlQgD5cw6/LdkcJTYra9oh06JPdRv/pqz6E
b/KXejAcE90nBYZZruL4ZRK/bKHCTCT5Qs+feOiLTJbBaiGzHXL7yOfb7JOuyKAk6rF5w6R0UvB0
f3NElrENHiW8PgRS1Rdk+6ITDps/42FOK2PdtjnZn+3nqqr1O6o+5x696iBLd3rkScGBZ2OH5tQf
i10/Y/FTkPk3sjLgllHm1vuE0g2DdUB9EaoDJnDYJr0H51J13+wHNIRDrxeLgLWSHzzEeubTS/yl
0zwSfblJEbCJXLLIMcRUaWOYyX1BRLpGJIfjtW08HpAxHvrwraRIrWG6srN2OM8Rzs0hu2RfgqZ9
qHa/1XcRttO6DdoB8yjlcFRnK+K/EcbXeReqKMouPh9UommbcR0At5RDR+TPig0+84ry8cUoIGcU
MDAvEYx5x3+IMLyr4Y9RhSU/TtDYxkFNH7IB6AsbMwjuLsuX9s99e085yvHOVYrxIK2POTF3Q7op
UNej8r+LdhuKtgG3z55QtYiIGLzJkyvFUTwfRXR9T15xzuTxItcILkulPeua5KBu/ScEChBrMVnQ
0p3UIlMhA9bckGfwcwpZbZWVsxh0ZgBMqaoG1W/iRwCSTWp5QEvtLGOPnH4Rhd95cuP9skXZgxWT
4YWAPOCTU3uOU6SFm292MPu9Fem64DNOBhMSptxayQDtsEMsl/ePav5Nru15WcU5x6F7QQNKPB5H
wTcOtjcLqVwoq8IP9kB3vN/zNCGrG7qCVgp+nrtcFc5RkDI/ILKi9XqqN9qK/e55m+JawDWoVWRD
Rj4ry6iI1t3hwGbaPm4Lh33Bk30+UyaQEhXF92urf9Iko8Zeq1xgALGWlKXp7oHbea6XMzZE1x4i
nhKM2KHX16VHDJQeZDXecK8LqjJQgd05BhjFrqFdEfDXentUwwO1tyNmyevounTAkvu+j6TM7txE
zHwsYPJmp0tJutbRh6H8emP8BQS6WI8FJfqZqXsPWukvZKghDQ06lsJymc84YIL/ZK3p7xdTblV0
LnlbSldsaIX6Q9seUq8TdK1Imv/PSwOmxhQpUcwiOQ1tJ4ogQ//yjfrfaW7lYqRH/MY3M/j00OwQ
3rN6o2tZIOTvJcapsQ9Koh5OCcgUCc8PX72IzUwBeicm1fjI03WYVJygvQDp3fzHbkXmDY6mCFqb
8VzR67X3+SPnkhP1VCNmLcTnWIqvT56dsKnkYgz0fGzGt8u9ZLslMxWvNSUidK/t5IsACrNObc2H
qwh9V8jiFlgBC3j4ZOwHaX1VElUqKCqC+eQ9v7E1QRvnQToMQ5x8y9qvp66U4oUwVEkZULaR0sai
9nyoVaKpBDLRk2GOGNEGCiaUmjzjAyC5dq593iN8J4jB5w/0IHIimr1hAtCgVW4xU0jg9jk8lRKd
eJ1NswsTebH/NTahcRuJCcsvUAeCLW6MJQHLAcGwygKvIf6Xp+SSqRsRyO+x74KDuhwylqlpf05v
w4W3TVBwwAH4WPH44/wzanlbonJc8ALFa4yy6pzTKt6SnUjQj/BH+7fgcXMN08HRy71Qd+cOEWuL
l2Iv7T8/XYq7CSP9hc8uax8GZa14YE7ngwJ+YPKpDIT6Vc7sQSdFMcD+4Yh86ryEmtCcBMWjjNYw
tx4LTpxziTwwL9QoIhiKYjIRkvsnfNubR9rXsya1B+Jqg+iIG+Pc/Shk29lNpf7M4uIyPBV9IRwe
YdPMid5Z/Pe8nlp059EzUzLFm3TBIoBZ3R5ZdVQEzbdzPSQxKOLKDH1oeDF0UvIgEtFAN98o7Iau
tZQyM+k+PLz2dQ5V3D4LPVC4ELad+LqskasUF2EdAJgF8KF9r3WwUMDEiD9tznjgVi37MGo3jf7w
bFV/eyhNcuOxHvY1GVtdEIVbTgprg3X+kX6DueZjFKTbHzE/v8U8k7b6wcmgJVZAvpoz0r/9BE4L
zRewnn0aq10fxSLXS5++r8Jun9SrA64DTPdonV1wFOIAQZOgIXuIy3MX6WZhomIjCl8zIbp2toq1
+20Z4sRB7JR8oB17CpdxkqzsBjNXMHDUDe6iR83RKOCl6bzeeeWogBK5+tKOcCWadq2R9+PsPFlH
ZcBeIi4YsciHDDbuTByDTpPXKhTw9Wi4Lyolw7Jqwy0w+6LmwcmXe75tW/zwgToOtlZ/AcXw444r
mmQm4WfbWyURD9v2Hyy7bVXWydm5xRGyGBKJuEV5UNJEcQeCMDnV8q3Wvw/DLBYnqHAvn+XB+NPm
Hq9G5qPfOsF3OebGeWhLbHyfiUwWRX6FwsBxnkrH4dZfzkFY8zKjAmyToPPHM9DlUqW/cEFUB8R5
xcw3iRSw5KL5fpa7y5hwlmTUOH7n7Bko8azZvJEgeLhXsB3K8K1/PU0T7mndg2dx+SQlU2aNbZ+O
XEBsJWRdO1YVP7IdPzGuf+v/mBwXAHNBJVgoSLLgz/rrUCV7SsdKlKY6wJPbkxOqvnhX+g/lLA9T
GTLC6SMG/3Xd3AhtzsIO9pN2vF3flehkX39a0rwxgKMKm63MDjB+YjpDkpLSj/bHefoy9Ghmu5Pt
Aud2tjYvi2sKDJw28EZAuMbSKMl4HjaaQFsN/+YxPNgMjHjpQCAFufQp4aclrWhebzQhN6cOCPim
3mLRocOtgRu5NF/9yanA5Lj1xzUhqNi8Qg3Ml4x5l/zU5s1ugQQTeAbpcAgMPCXdLHHDOru70GkL
xrtpampdizWRBYEPipmaTJ9/zHdtd7oEIVDWGvXFElC/d346QqdrAA6rQxANJuJUHapR95828RkD
hMeilW6MTCp/C/CTO8Wi2nIY+G6FHGpQpTBMeq7sYTLwIsWKGUm8UUrwCbVLjFtCIYhlIaieBsyC
1CIWcXQGyDMUC6FfE5yZ//Ml+qHL5P05fsJj6KVjrOyxFp6Hn/yX56XwiXZp8wQMDJXVmcVAeR7m
uPHTHl56JflSsrAwQtbVahJ0WHjAwQLfHYb02ndMT2c0+rO04dKffnr61ALkG6o8QJyv6JRF7VSl
rnCahMue1m7aUeHOLflO4HHYgAVx3cGk/G4Qge/eGO81YCRwL+Rhm8SudcWf+mB2NyCOHNZHjWZt
aYRb2Xj3Xm+GwvbfD3oz/ziCRq0Q4Nu1gqoUAclPS5pyLtXvtPaPztquiDJFoduLH5n86uOPlahf
1Dh8oUNeczswutqVwu6fudsJ/5OdHxceZIzNKnO7WljzTbGf+BqwWHwVwuoe+3QcpnMkjcNFLKC6
4P5ypqzUIyZ4SaoWOU6eLYSNWi8PNJJBwNeUUeQCyTcs6ypSeoK+egun1pwtvDpnge6OR68SzJoU
/ch/shGfTmtJ2LtXXbr6GtCQZPXtgrP9SAbSU/MqUfQ9nbzYLU5N3zwfTKVGknnQyo7W9ytdO0Nf
FxbTfBTSmYpCPklZrsIV47fb3zJQVLHFfOsnan8vCfsIJ9EVzO/AiJdP95ZvEti08Vj8WSnJUf0R
hon95QMIpaVh4qhjxENakZ7sWzUjfNiwTLe4BMixmeFCC6b69QOIkp2wHqC7yLWSnyZvCByXb8PZ
eBh02xXvcyoydT2XoDtq9nZ/L97D9yOHzz4TxTScdvR5S+I9WuglUeSg95Xvooe92hHzuS1ZauLG
NA4IrzVwljYuNZ2DvRDYvZECneqMw9hEVP4PY3KTwvYL5GII7KsOdHpdDqrjT9UUjKokRhvUYUP8
KEiE4fx/jIPjgyip1BIzRRzfS48EA/naXYnizavwppbxB9c2Ndbi2W7dnxXu5aJJLBcfjDvBKmdz
hi7QkxorRtuXxZsIkdgR2CKjjpmVGlwAoTryECTvQiPFqbvo2fteChcus8i7X2xYAVvZ8KdtQRE4
rByEtHvH3mXx80DZXrFMYbc2Ql0wyzHWGsYe7YNdOL0g1R+ZeNRaeLEGpiRkpMbjQBoq5IOhJU78
2ruPJ4ec45okDzoeDyBA48ANu+HXvg7dzSY7uGCcbr75pzWCo2f+O+AQlDV5kRnWJDAz/huNm5eh
UxS+knko9ALkZ+Oq4/DxIjGOGONqtKIl4CNJwzzMjZdjTu5TwngSrTqIaZ3T4vCeFnLNU48XjK8H
IXE17WgX15H+QQ6tKj3KtXc3XhFJKwX7jNlDD8BX3/jSBkfDErc0Np1+PNbbT2shWs2Y0MvAV5zD
Qb/9mfko1/p0T9GK/GDTKOlL6qIpPp5lUaivzNdsj9SpYhwMDDCEoYpb1D0wQSt1hpiMZULnJAjg
NQBeayAsgVlrqH8BPRUSfs3buFr2g6rkliMRDD23qjHnk0BQENy0nljXaKte1zNRavf0uFzO2VvL
2pGiYtU0p8wFNkng1SSnWjkMcEpWW8wFk/cAJcxY9j/A6TAd9pjvnoeNv5PIb0f0f+TXNrV4Zbuk
yX4cMV3yntKJZgP2rMOQODroxv0S8Hej4aKqEXDXx7zvu9Z3K7WpWvHlX1kXWzU3u203Ml1+co04
3X9d/mZQhtHuj/rfEvz0NpFrju0YM2vquahbBEU1pcQPOKy26KIGcRlAJjTE8wx3cEh9aAgprn9d
3S93Ub9sm3BqW3wiQs+niIpwINk4VhHKaYMv8z0nC6TJWWM2kQ3Ecu3LC7ifIenkoBsSilSp92RF
Tky56Ia5+79HPDngkMkFo04gnTGm7OnUDvVqfyBin7LoBmzlcM3lX746ouqEvta9GGfzBHZKdB2h
FZYH2DE4yEt9WkgzHijnJPPQykrZzA3c8cVNa13bZZlOYJPhOSis4z2+ySLa01Nf8jUDUlF+kPcF
691zC9cqhs8tkhLr34WYn6oBqkX9G+UsP/+8Y1r42v10Q3lRQl03a2yKsrAYqLQxppcT8xUq7Mgt
yedrGEli9hQVVe4gcNXZ9c0XdDkNabO/G05Ca48AyVueMxhmQ+YiGZEMQJqvxsI/H8J03ij1/SoL
N13PaxJZNNXKEtRNlGoXombbtI8dKvHDUsnFF0hSoZOrHyb+Fr0MLPL6l8AKAVyqhR+IAlbpyvts
hWt3kwBg53mI53biHBn+FhkGRTrlUU7XuuelLy5RXMMmz9FN3KEKanL1G+MDXbqVVO6bBuDzDi43
L67hgNcF3Ye+NvedjITE8XN0YJUHzPSvEUbMc+0KWUrgji+jqqXiPAR2TJgVZx7NZpyNmRPQ7fbE
iXq5SfU2gTpXbKO9mZrFz8ctAHmaUWosop5cHJaCUzmUP3k95msMkTs7sfeUFJAzzkkeks4hjaf8
tEUOF/lR9EL/pe2UpWLXDm0qetkpyBnExSpg2RU38cydxawEtTuwzxhpWWSBPFj/1BnMAyloYLKv
ofcSd9me38rayGycqw4VhTIcpCALA999B0zB7V1HqZFVmjxz0utZ8sM5L+4SQc9gcCi44F/0/QiG
ynoMfF3VzVNua7U+xNksXlIKZFB0tuyyNSDeGYv5u/nWfd236xkTEITODcHNRI5YTRbhLdSpEkgb
b9Fr+A3ZKLMMUWwg9ytlBK4oS/2eIu8iqhojgIwIFOcGiF6B0/8XwfSVdvmyQ7EzudsCjI0rR3yH
Q5Y35DmIKWb9m5dtBK4PZx85kX+OanwYh9vMwcirdKeMsucR/JsdoJzLTWXbqQm5upzvu63s7w6+
kfplF/mz8DGBurR2ZWn84Gwmf+A5NWjojeU/LsZUeXsGf1BqNayyKdaauh5JKC26ubjvzwPikmzI
leYdLglrcaeS+XpTSrhqeHIduUInqN+iQHTs8h2wFQUHkMvwjIAPlFO9e0Usrx1+BKtTUcUBA4YJ
3NXy0c8VjthEAQjCgAF2lrMw27bdhAWvPpoaNQNWFI1l8+hSqYuBzfsHu5kXbBJBI9Sk0PSVh9/8
bYtoaBxVlTe+/bF7fmKNjh4nLXKY2cVfUDhoWIa0CjhTc4tSdje27p1JW2pcqVokKMc4Ink0J5K6
4sfsrVOd8/AhVZF84MHS4oMX7DCDOeZV0dfFr32XSQDqleD7794ebWSKQ3K7FOiZo5hwEo+UmXcl
1BcKhHTvKBOONitLWcZ08MF/qGdPzJmEJJ7XLBiC0cZ/lJwlVO/Ke+V12ZDESkZScs3yY01OngnB
vQ2j05dVlWt5ppdAePmxqRgOHkph4ebu6wV9PrwH6l3IeuiOvtrQYLSBDz+dBecLcv7fIAMnjTC4
az5D1ob88R2U2i4unn/8AqbD5M5nOL8ldcD5773cTu8xGdNPRpES9rYIsDRgDoMAjwgiBx+gJA47
ZPEq9dHqWlPT0esePGqJrfWcUrWarhCLvU20l/kKJ0ZJK0FAOZcQhgplPPDc8oy5tiOl9gOHHN4Q
3Irl5ZI2AzdAA4sOCrYGnoLos7RfJzHCCIt8gMgAjvCrnf4kaIsvHNZRTYrccIz500ru2pNv2wL0
92gfzGfbxrkCY/S02E6Sv5GY8RFT16BFRGMTNjNnWc7x5Pb9dUjubs5is2GpFfaCMCsGYAvdbu3w
0Y+RcikEnM6ANbDRYT9MNZJIFghcY79/xbDNgvFUsl7mMGOOGbjEDMVphQeiaonYAgh8uTR+HvB2
V7UIsrOEtm4O2WsNZE6qxeenkZrO6wGiSgYwybLRPAm7sOsbTkWzRCikyYeXxiL8MrCtatkSkqqZ
gZVbsWcyZXL1ctMZ85nEl2WsqZZD8MhIZbUCkBZpugKIVWdIOOUdSKPXLvd+10ORoGiYYi2oyQjf
gS0Pntbtq+KQ2hyAFKZ8vU1IuEwGKduT7SVCBTbB4U5oUADffKTeAGTVNDPtdLlCnpXlXGH9wDwL
MdKChRNqXcaQdDS3GKxdtkyiLMSzjogrqq1STVonFOxeEgnmvy/8VJKNICcbXeE1PlhAlgPT7Mnc
s15gxOnhhX0SUMAQNy3rJa5+Vxau0wELoc7xQcsccRr0L/WNZEecM1kMXsqOlVJHPZhEyaOhvxRm
I7W05mtxxZOwERMf1MIkWSt6o6hCs76NzewzjLTH+t/9g24LfYJ9kPvXOCqtLq1XT1Q8jG/jqGcH
drYRe7+1tqPiER4u+9EJm335IVLGKpImlEWAcqFHS0Oc66fCxqcasoJBxsPL1BDg7JkAcx628xvc
OrApJxiAzAI4Y5hlDymvit6TJt5x18ZbdjK2BVzQokAQJbdd95VEsobHEabWlki0o6Cj5M3HJjx8
D6vNGrircKXkBYcX8p1j2tcJV8DIxSwgq/nsWs304Hi0NQUcr5qB1bdmL9iP0vEr6fLU2qQfN8i+
hXJ5Zlv8SOGb7foqdmjWXvNAnnablKoZzzOm/v47QwSj0HN1kJi4S6wamA5jj/WLtTsjjjNSJOzf
4CTkcgJDPdvk/raa0fx5LsMR27FzhD7g7mEN8Y3VbRHwthKKe3SDa5RmetpGR6FLmHfo9Qmg0p+I
sFgEGdRauha2p4n940lV+/rb7YTz5s6hRI8nrGFuWFEfGXhAaqWBizVShrNH6DG3jwBwLUQsSdF3
WJEtjUaQGLpDl/amMXnFhAwden5ygjIfRR4FNSzHC52OcqUWBc6yMmDbNgRsWps8mkxnLVuEMZvA
oQ/TOI3ZwpxENqxP7079rDhiqKmwHNnl6R+S34xDyXlUDithWeTEkNXWpsVLS543iqbh7GP831k0
3m52slSgWDxjNYxIEDBH4POIMXgi7Q1x6/Z5fGTrrEX0w8mRN6Zt/1HbYgmDowjeoP1X/dc5eB0f
UpoiX5D6zSiADeUofRGVmU3Dujad026oIF1RiZTIqy6HtULj7YRhijsTsuyJRjgcp2okNbg504Cz
intREPBBVDRv66SvebHRm6YNVYuG6/7KkvqWl+DqPAcsJ4H8h3E337wjhWPOhx3PNTfDiWFBJUkt
cmdOC0RBvVOPNIMGru4lIBQgRNDXmhafV3HdL7mj9If25bVNEUTpbovN9E2nbdbWOYrZnKe5ecHg
tDJAW4VedIG8hv6FTDU/QpZdu6XemMa1QiOFV9nIApuWmjtkVU53lXUnhAxLVxeS3uPVTwT3RA8a
OZjLQv+ls0sMnDXxBJo4fAGiCeRz8QJWMIQgfPSBpYLSVRMWattwM506wFGvLLgxPTzhuYck5KMF
LmrxJQoFgBodx28VgYpuQgex89UHp4C05eXsWau5g9+hNb0cIA7zTyZWYX4O+u4UoxMx2ueLay46
X78JP4V5DVhdEG9q/UzJumLV68yVNMlejqY9wYStjYA9qhKqeS7vxxZojiPNYSlPBUVCEl72s3YW
jzDzfx92vcrJ6yZTVpZN6qjhly7wLGfNtZWJVmp/Kb7Dvf9jikYgehIiwoZGXIX4JI5Rp2Y1XMLX
6Ij/07S73V7t+UMd/ydUokyQ5g4+an1NQF01KRBJSkEJGpJZWoMxs27adUHmjcJhsgl6TIzKFwlz
PDIC5KqYaU2bNY6vi0MfUt+xu4VYCHDGGgGgYtnQ5FA5OLvKDgc30jJXkUzS7khkmmhpMSOSfCzh
4JYoanO/hmVdyd/hfmHml23mcD3kedGi/AO2w+JK/sK3S2KpSkIaTTEpwRGZV2QEIqmRs1OKcxw4
OCWrGxZlSZXuEAGSaK6i4BI7UmotPpJ8pJFhcS711u7+juDRzTj335KpvixFNDtNvBX04Y/HQdhS
qJyxWmeICHkwxqcFcJxBxOa8WLP9fEJHW8yFU8sKUh/tCiG2di6W1VLeAsNXN2E0NzKDSuYtcK26
fYQPkCcygkWuBJlC3VJNVBAUZq31YKh9d22ipVeP0Y4E8EGQEQOZWVaWnalQr2x6l0cd1VCGwk5I
31Mvzy4CcQf4QrXJXy99I9vpS9SAh9GE/0xMUubG/LzycsdZhiHvkSqiuY9gs+I+CDgwxktvTX+p
wumuhdjZMa6aqeaRbQZzKas2SEwJ1Uw1IOesdRdDVfexkJGi+egXF4+KBAEqcH8QSD2B5InLRfu7
MbXNwbr7JpY5V6hjE6OiCerrkjVzeXcIRmNrosvaucoQ6WPPlbnLpN3gg/3xqbgTefpIo0JwgfCg
UOegoayH3xsHSkfBW8kHQMKtgxAh54rjRSIGv7k4knNk06KuWy/LoOZn0oN/+pCjXvW8FFzSCZlo
JrDgk59x0VYbPK+ujOzMLkQiXOw8uvrpKxwwwLPHcVBFANTSpR71pFVN0/jz76oXcL0XTQdDfDGM
/8gjMJGUdKxhRtBc156Tynd13FOdMgXFAHN178bk1XRzQBdlT5W1r4qAXvJH8nsS6erCeB+BvaNs
2wT/0BY2MuP0gceOb8QwpO/A/+VtsSUTs0xAHHNEDNzdRzozYfe0n8uKMCsQZSWW7qq0+jovlboK
QKe3aZ+ThxYT7XVr6Xi/Ixy3+WmjRign09cMj8/v0sJ33BZJBSUxJ0rzkH3bbK5gxriN5kwLHUZ8
oNjhHt/lGyQcZEwK+nDw0bWu/yEo4wE8YF6LNSGRBGlf7JCumlZregkkF34wI5sz8wc3RkFmLxlo
rDFu0+fNxEkIoD2/QLTa8JWaQJWw0kLjq45w8PjVp02mxfrFmxwgSA36g2BH1zpo8jnz/TKIp9/W
uDVCtpdjCxBqxK4BlNpTiavvj7y7W7xs2/7JdtbbDrBL0EuaY06MXoDGu+/SFQHFMe591ni5iEnB
sL8SSZ0x4T/GBGADRXwralkhbzV3RgOODRfdjOUCkT+PuAVLBUrFXJOAFEv9ITlrC98uOgKu/btk
RBRGTOHSJt7ft3OfuTKABVPzbbLaYVnP4JIASreGDmsloiQpX7Q2uHyI1hpVXC6FEa7IUx38Tc+M
VjDB99hJ7XVYkJT9QgCyJm/nOg0ddrKdoh5Qtmtcakr8TC5GLwd7irW333FbupSUYF38F0cwL8vL
C4/nczRf80CMxj/4yU+qxBt0tjzvJc48Yn2IhfUtJhrwPcSgSfFElLsxyR/IsS+t1f/JciNgyzlw
qecLYjG5dGQ2y8antNIMNSgz8DGJcscygJT7sgVFLYuG6xaO4htb9d9EFhBziu8qIcEcOBcyOJtA
kXHD4MwDy22fGtbZ57eelYRuotEeWRdmCEXxNy1pz76MSgQsXtOW9ejb/SQVDwrFuWkhfLHJM0MS
9iz+0bQXTL/LdE1cq1cpggeTU6msrBoSz0awovPVcDPyByyRlW+MKCsvzD/VuvOOtue9ti4iEpfY
aACE3C2/eWseg1BoEpPvK/ZuSEILU4LaOxv51bJSO0Zd5uePCkv0u9eh6p6bClInDHrJj5aBC0h+
EVQXK6HrSW9l8HhaWfKTKFMjH/GViTnFIPFLZqnxlct52qe/DvvIds/ngInJ0DdWkZXqK8pfWcYH
lnoCa5NQYjeXoy+f/ltNPkZZQm9S93alTn+P3fm3VZcVvvoyzDpYg/bL/M9XUHNVWHmep4oIZ+Lq
eTCycvhYdkW/v6DF+rf6oMsBbyFMQ2owsMfOEcS+P1C2WxYhBUhlLxQ1WD7A95kTL+QALusGqvaf
9dbDO/kYMUO8sbengqfm/zvjO2tW739d9ZX6JyZFFivUT7OYzG5UrJVh1pxRTnBRhZQqQGLKeDRV
kyoA9HGgt3hN440cPh7JWdngdipkFrow2OWSngJV2rmamRys7bkZUxI8oShN2mTFdkN0Cjd/SuBB
3jr5a9utNQhMT5y5V17TyIjV+Y5T/ggHbH8YelEEOb2anTtWEtP0ceSXuy25jGBkzozAHDUfOxBB
JTqHX2E5MBX4GD27x/ahYDLoNxQmzTATDhyE1FoI/4qEBXyVogluCYwds2jz7i4nCM10n3YdaqhS
q2aG/mwdesuOioEe9VJ4TJLwuoHC3DEVJG86JdZVpz+fGccxPRyVfkv0eJSghYz1YIIo01fezrur
4tQYF5JKPWctvhdbPmahs7iG5FSFHvOAEv/q4Kq6jcgZyQRFrPsp67acajHn0wkNwARUiISBb5gg
HvYYvu+2KEsQpdtHbIquihLARU9RcXSDXmeWTMEgc1dHbTLZncn52yQhWM4wHdIXzEX7wkaz8JHq
YnrA/t89Lg0+IEuE09chYAZoTToCcT3Q6toEI9Sa0MRG06y95XK5B/t00xHrZGTDhc/K0u6EoD1E
WSy+FmZt7WvZ8j+56T660tEb3YkJHaJS4zHKVr8RuVI921uEIWm4lXg/RHGyaHqx6wBdiyvfpSJB
th+Gs0b+71afoIkhaJoEGtAWEkGujnVshNFnEp/EgOpdSy9t1M5EjfczrJA1KStZGLfrO1YfZt0d
180Z+QiLtE0FmO0dPgpZacB6QDnS1tlyNX3ElvQ2zC3mHqEaTPFfkwHkHQL2xzc2UEQu8mvNczgB
CoIkBKyFWk9sxbI05LuXFJ2I778HuwQD5BZxEY9Tzlvsiu+fnku4KsKTrMrUsNglSJef3nBT+XTE
svP7MCLkrhPriK2GMZ78KGs5Ven2ZO7XOPeG77ZkFAkVkSSCTA7ERwgrs8c8x46HdC8iyHd2b8b8
qOlLmi+4WgF/7X7t+iPFuznvnNnBJZ5tOzTwlKSf9QHPqYi1/XCCUYp1G491OkLGVdQkCE9BB89R
Vgku8BtUk5ZiI6IpA6IJ+kOojTV11owc/b7ctV+HF/lWoA2T38nO9609s5vdJFYqYO8bI4anlwle
R7VjH7GAm+jbYdJmLP1swjIdowcq3LjSRSeOo/BDhD+4g1w5zpQVQfzyuIa2hH2CS5DytVnTGZ3d
kfFbvdSxrnbYaectBXke5HWSQO6jxS1xLXreiOfScLbvx9jns040okBlTO7RSAItqblQcatvFWOy
Aw8Q73jcgTW4NdMcW+ZvCZ4+OReZfw3Ad8yA6OYm+Mp/OkZKPswL5DgpdZ3Dk7TAmcvGSwUxKqbx
BtSmYnbMLxQqpAlr93yUeoSOqzy7q3AL2bUfAoo8EtX74T9loDDP8daECv+MBAD8e4xZpW/rnmSB
2zk1kTwBkvpvnV9LRn4ftP4Xzzwxm1383TiLPsg7S2q0/TvjsvdYvlvI9IPwmujg1lxdmbq4DeX+
UlKzRxGsVAzaFyzJOrzFDwYDVaNQkVBXJAE0ltmFGdyZmyJKU0OoxxlnUI50WsQ2uTKNrAD3zlWi
AmP3kpPTH+8/Ujaq+Eh2Zft/neELliDnwQ8O1BSVm9EKrS2EXLtJcN93cS1vMz4FPLjpiOJNHO0z
xfU1N9F9xqVk5iDe/CpMiRSlAjZYZBnD66UJeNIU7aQdJZXQ8NmQyiWqLrsG47FVKCmms9KboiOH
K2eUBK71xtLxjki52SjiH1aJdKmBGC4uGS9eeHolmgebQTvJdOI/qzZrPcF3QpcMRKS6cGCtqNSB
5vbqC30wmD66c+MATb35jSbLDMQVHpp6zhm8uG326U4fbpm+/tCSHjnaHpeT9TDWq6nIfwei5UpK
Ax0K1Y0GzeONmyRyIZbJJJU65jdfdYdFxCnMmttDD7cTT5hg3TYAPeVp99mwWA5Mma8FhqBebCTu
kYa7C2aT9Hi3ZN7U9WJ3zV8YHxZhuJFzLxopancu2kJq91OO02hithKjh+6EV9GxANYL5RuzRhkN
sztHQzm3TkaWCvYmW8HB+Q5vN/wGB1LO5PfJOwyv7ZjxXmUQzeu9tTsOapYMZ+MGGX1EPC9VD/CV
66ThmAgDoYQHyac0e0ZH1bJ4eIV+P22RsMFM1uwTz+Tu0/jf2Hz6S4M5seJuBlq++TcizbpGBNHs
k8sj4JChEpw8LjpvWfhlOP3E+7ajD5b3qNMHVyKyYCKz/8pp+XUDK4lsKLQ6FClal2m4o4zhsVBI
TLcnL2GkoZVtBSLy6Of4jbAOwq8aKPdygDJqoJfPRHg160DGFE2lzmAMdowuEIWd3DYty04JuSUd
/RWI5yPG+SmTygVjgvLeQXsk8W8P9OI1IUGWunQbhtGGauaC7IAlw4dyXjlyn8VCgjzQgqpyMiaN
E1H+IWfC2g/OgeQJoewfsaX1Y535g0mgOUZh6/BZ1UQBazZI+T4M3+qGIWTaGTLr++rQTliHOh1V
wvAWT8MK3gmGuMT6BI/TuNrKOr4VUvN4DaY40DUIOmv6fThjdFwrk9gBcQbRHT8oQBOJyHPA8nP4
jzfi71hafMwaDROobzNtX0VyUnSSXdQfiUGgB96zhOxg1AunKOhFmDYouQwZG+0uQqQ3evHh0ki3
mRo/3k9cU1ZMqTJhvPHBhdWeHh5pLfRx7PP/9wNBk5yi5kCpq0emYvmql9Sc77pKYrAbHy7dqFp9
3b1p7ofaNYR/IkJTvNI7xDAuese90i7MYeVEMVtohvfz717oEvLwWglI+6b9UcSZfLhwoEW49n/U
06KMOnOVtkdQ6fss1hYXITpwHMRDryFqyoTYal50aH852DyjgzPoLi+PjQkavRfgrmS4Ka/nbzKD
qXHAcDpSsfvxZbB+MLoeAlvcW7kXxwTaIIFElRynRiquyW3jVf4Ku0MzhT4WhS9bCVQx5aPJY4Bl
9CgCXQCecMui1Ltpb0c1e3PkL7iOcMhUnSLmLwigJ3f5ljNn3Qahq8rEG0PGv10L9/6c+wMloV0b
gV/4u62OzrcykT+lvzUpf6w7VdCQo1FfUw5rJbQ35sOapeH9mXEHqT1EX3H4FI/4B44pCqyRbNON
uErJIaq72mGKFk4EwBzDfLPw9nKFyRcv6roP0I1IA7NieN3DkuHfX6D/j+Yh0zvJ/maW8nphgNJ8
vjP1zZ4Omc9VT5KopByXyykbuVLjtsm58/KdwLzd2tNsbSuqWQoZbvKmbwPj1m/bxN3c9FfCGGnd
aY3h9tFPvw74fk0LHWiFbH62qaAE9YSsd9zDKj8fuFxo1rXtM+GujH8Fp2UlRaHVHc09uWa1gTGp
W5RvtNak9EfO3oFMbaP0zdt11/OogVTA+LXJeevWYkSxqbP7SEfpofXHiTvG3VjM+W4OwkWducTl
xGji+vNFwClIJLi/W1KRePh8e6aXLH+TmflCDisNZHqlHhhkHDGfs6hoCgiv4USPAoQib8/oDmDL
U838y6jLivFrXvRyVWV9FmQaW/Fxs+kQRXcRZXTUvYsXpFIubumhuTsYgSyRs607aFPJ5T1iLc8g
aN1/lvxIKVIiSkfVV+Kd53epVQ8lZAz76KPVpSZZpDCkwTiZx5SuudwdNsDmb/x515Ksp6yuv7lo
dZbzc/DdZpHjVJ9/Texdyj6XMUWs/e1JpRmY5H6oiIEMuUJqlaXIWHsEzw6kyDlhiYTdzoXaIFnM
cJs2hN6It6C0RlMyAKvCptSx39KnsLGTDAmQLo/YZm/PK0BO5uYQcHLTIAJolbv++XQ6q1yvC+Ea
H5fCxanOp1y0YExG+hEMlGU7ixN5Sx5KmsGl7OiFju1tess4pT+6GGdOj09SfaOBjkVDEGyXdnYC
ceMGcpa7WkE3XTFAm/GIncz7MqtWIA96NeudeJbgVSAgEL5atDjrptrQr5blbgWEh4hPj73V686U
zedFbgK7/+mw/LtiOtlHKA7kFz+ud7YfcliQtQX7hrYSUpgSCmfpObwLAPe3Foo4hmNIfMew7s+z
bhpVUe4n+sLCg2uhdb1UDZe3E7OCG69M70r0UheGolTvmv9oDhfmg68G0k6msKy4Biei3mFlkxmP
9nvms0OzcJsVrbj43ngXnGmbuVVfJoGOfszbNVdiMZL1S4C1qrxlVqNbTPQrvq/3ON1ztojgB/lR
aEwMPZAljXzlMs5ZzXlaC+nXGg62KlWCNZY9Hl0oyXoPDL/RmkGhmZjbhprJt60T7ehYj4QIBe0k
mIqoW+n4YqC5WlvVnvhEu17TjRG9MyDCWuB0Gh1M3WNSYEYgcrzKuPukZSIu9nn+4LhkJvkQmH8K
4FtLEBPe0YgGUYkN9jWTWb7LJYH2QOYDtjnYNRYynnVpH8rKYKSr9bBO17a1RGIsEbRPuGIOnUTo
GKtEHvBkS0LRWIzSSmwVBGnAAkGEy8q8Yq8y9l05KuYS/+nwUNXF1SbX9ogDVnN0CcTdlKJi6qhm
8VZAHxOHQ5cTlivH2cm1VPFbezBSh8nS0ia57Nxs9//A1LFrLosPl3ymq9x9wgOifww5UPbsPkuR
sLL4DZLXXPNdi9YNmOqiPB2tRK+hei55XnioXmb/hvpbpcSe/Iho0o59vS0bTrcZSGoVb9uZPMbH
+2qiYWNo3ufODxanckNwTqGgawG7t4PldiMnE7J/hIMhK0YXI85CRd/GDM4TXBpS8AcCSYo54Fdt
2gHNSoLOfrc9XCAI5d+xJAYw4Dv95tgdV7OrqyaVjYvOGWoiITvAVQl5qY+ckGNJaRDLoWGmxInE
fFRyKurPkmlUU6/vOBa6ICNVmxJPdEcfkozknQD9WAd00DXnxuRDx7mufjQHGQ2/9MYifM5Mghxr
2pge71qY/85TJi+JGBO369yH/X8Y+scLd3KTs/VYbnWAATM6tpKAKFLzzAICGLHT74MPLWqbfSJY
NjgoZM8vslQr0164YjQg3qrDz8UsJAR8QI3ez0MzSVcc9URGQpg4MeskqchkKTQBEbOl/Pe3oSp+
a1xtcZ4I6Hfmnk2/GuUihQDcrkzQ6iS23COLvx7AFXmgJrh6NF0KXtP/IrUgJdVa+MNMl9S4oCqD
OnAk8UY9dwFy0v/ZcFB+ZM29hyNl/dOSnlWHBEBYeJRAGOToMrX3NkBTPv1bLGMuPw5nazxlx3NM
CTojIyTiOkjVz8xpfgYtJ6NFTJ/OTNPwhOnfua2gNWnNtLzXXd57I658iLWxG0H9L3won456EXfu
mvtVGXiDp70RZ4WemZby5VXlIimf+8oa3s+Pb2ag1vbS0yq6CmbFZTSAJC0TaGKUsTStkQjvhlD+
t0Z2qT6DaaQX2liZyKFk2kvNfbX4fozWlp4qx6LiCU7nJTXwXL0VmKLW+Pq2RzGe8gRQhaoGgWH+
t46mjTlvMX8N2WNoTm7AqIL/JB0xgM4FXf9b/2ntud9GhnQxWyMnyd6FaUgZbRx+lCI0S+SAKUyr
2GhDmxfw4lHxEQ6DRDuEvj6R/yF1SH3ZMEbO0x0nAk53moVEFikfvykpbXRL1rA9/fv+W7+GrHvb
M1nBjDNhDdeY9KQPcRj/3KYY3rM+R3z+R1JE1c46+zDbD1JpEIluJC0Qsb32NPzjTbUE6Wt685v9
ZAwT4Al0H9EmpyLhmybkDvsLasjGNNfbFkn6TGz4K+h6YGPY576PStKfQ+lfmb54fYFJRSRWcGaf
Ev0AL7E28GLQlFc/fwAljhpBPN1IEHw0tYsuM+IatpCtsLwoNcy3BEL0ZBJNXQpUCIvH7Q98Ogfj
yzC1K9g0WUzFaXJk41FWxp+4hrPJV4nLpVTTxmHcNsGHg698ZmQSGW/v7FoqqoHuPoggTwZb2xwU
PMZGoDeXZLV74MP7VeifbaXqhXIYqhSJw4ENhEDRp+434vavEgnc2A3/fTLgxK8FpB7n2xcIO6My
twF1tN71SGWU6WqgcQwPslZG0LCBG4y4HzVoQt9YDt6TryKC+Rf7XKOIR7/aGza/Ewn4z0FEfU4w
wkUQlG7D7jZWsqODzrBGKTogw6fxD9J7V+zgQc2THfHm1W4Wic2QUChR4Axn99ozMjIU5abKLmhG
kMkZsjI9EhPMXnCqliGgMCBHCwz8tlpWBPEZiwJHkGgthc3JErXqFCxz1tAJc0aPrIZDScUzuVoc
ppheTLPd5R8/URmatH/iQ5IjHifgryPIaouA1XRkbwPftPvebDxrT+Fe+hMcohmh4O2++GlyhojZ
jRdUGtBijZ1TgsLm6jVcf1CBnic0EWNz/yBp1f+EtMUXZA4JXNZ9QiUt8NCzJn2kg3jj+FaWKjJ3
6WXmEs9groZJwVTqy4fVPE1VHViSWNSvSu89Og491NpSSYWceCLjvTgpQkNgufpEuYhIt1+l79ym
l+aMuaV6+5YiNRJ9U2/UV6ZgKvY8N5q3ToScPSLw1meUoM63kzDz0OzJHR49arZHvsIa086nTEKP
ocuddnG2X9wO8pnmKFuyto97+ycyP1rhyS5HtTv3uOTiIKKLJQNTSRgl05mv54sMQRyDJ+pXhJpU
/RPKnJB5nwf7E6nnCLNDs1ABAwF/ELcdSXEuK9CEPoOySXvIjsHF3YVkXnLaFbCf9a+0J3oK8ZRa
ShvGBxFbIOprINsjRJzsM4t/IpvN9VlA09csLp7ZXDjRrtebks+Z7Qe572FicBv1ybwRUwvZsIlh
ckoW/Qyrg/pGn8vo6wZTAPsH7/mU2CHEu/ztLT48MOjoeChCQqOJaKbJGLlH5wVD7dasFVxMYHvd
seR403PBhjTTDH9UJBJRarxgFuM42N7kFEkEUBmDBpqPLswsgUPzb0y8KrUjRUec9o4swLTI7xNo
NXGFvm5olFZbF04gqmE7S9Aoo93nKffPukhqxC/MSSX4KV1yMB8EhOKvyoRZ6ZWLFm/UBpi7SDD/
hf4e5ibjfq0AHIW/3wFfH6Hf9FFMBhfdnSx/UjXRbPd1tGHUC3oi+VbfepNWS5oMiGT9PeHwKz3A
+ZWsGg1VX22d+VLEKUdlMrgw7PW4j5lLMCaMpEyskbGd4Iobjed4l5qfswG0T/XVe5JB+l9w4mxa
/Ia9cbFFp5wsaNZa+KwOPDZscGARZBVaMxsEIHCMSTrUb8gOydNXvNQYJquiGLFGbOV/amdYlj6d
GfMwmF61BPvVewzBb+S/pk35pbO0O2mOcYjzS8y5oJcztF4+g+sieI8Rn8lX4//WydBtF9FYjVxZ
hGH67k2C3BHM+JMO57rP9YhzkNXXE7991UXhydQ6zxjG1J5ZQXS39jb/SwnP/CSCro3qZOSJ8evF
8Y1pq+QpE+g9LdkbBk/byhCjKJsXMOsb2PtiG89AA0yOTOgErUK4P+KP25RGIzhxjwgwTJRc4HGC
O9Umg6Ag7rjRNev7aYkk6I/0BlMovzqQUuDZQoeeVLHsCGi5aO1PgTKRP4se0V12sILjUujP95IO
WlyARDUnXiFt4n1ckJociOI31iBGWhUkh0s3FpTYi3KaNey883MQZkJTq3whOfrbJw5DmFbaP6/G
xywNw/PF488hB8UKU0Xq0mTxw3LlmD90kxupidhgKClyO0SrT+UtKbboVFWzR9bLXsRMZIjd/Rpn
9cLon2x5nb6ymd1oLSTuE/+KdiQv+7+Pk71RQM705VRc2MdhOQGhKpXENRhxI1upuomBqthZqsuX
Z3eEJX0nTsdET5n6EjP/26sHgL3TkaByTWaTvXbYakTn7KNyD9iK4eG1QoL+YRSuSU+a+xLwl7qg
cQR2hiyFw6iNbngaLyFIF6bE4pERvkaCBaGkARViwRGvyCkZzhH2ExqR0hz9IfNeQrlCbEGvaVF5
EetWwqifvMwc7vvvMScQFE84O45rezkXj3R9qNFFlMWiOhzvET7aFUq8HQiMiaacRiuhohJWxh3a
nrZ+h+jiGGNO0WTfkXPBDgtW63gJ9z+YlbrmTFuNivzkTPyocdgrcWC8hS2CVT7H3TRulL/wFXuw
l8QnWTo7ysO8x87+ocyA+YzlFkIA0k92LraT+5e/Q8miMn5YdbZYcQTkEJm5fPzBu6Tby1RZPhsu
Gml7tWZYZJA289Tog9c1pd+4p5dznDRziZjjeJgwWKqa3PxyczbdiQ95IycZDVPum1S5O+6gcWOH
QJ7Hh0M9PtrZZBcWwi6mv8Qq47e1hC1fP/WD2P+SZhykudy3mr3TP1sHvba6+xEOKpjQHX6riJVr
fHP7W4y2cYarwaZQKLT6rR2nIikXk7t5PHoGpkzM6LQpXmw+tQ1XKVwlY2LfBDxcxPQMQQBE9wxp
lYWtTFFa+Iv0wmGP1FjWNYeCNgR30w0d1nNP7yqltwV2+QAA2br0Lfrj9JKL9vlEGbiHvHohsDp1
ZyJnYGh0yQDzu4qfGhTI7BY+GKWqIJRWWOf+14Ar2PkC2J52KIFhnBtJkzN+pW9duKFQJDeAPwzr
ta+9s1m0/UmJRSGisGSrW0zlLf4iuNO3N5O7WAXbNkRBSrPck64VLd/kZjbuHGLZslkd+BbIIA7A
eu5Jhadh4L/IMhw6ck8uRVfZyUsZfoHFl0LyPOYSnWxH9Cbuxg5NkkZPZ0MqssZXRnyKOD+JsQF7
X+Hsas1HMVcc/2LzIVs+9yhDXOxPSrjMcNDMr+l7gkgs6AyGfGfTpOXYLsxKgr1g9Y8WO2U/O21P
7h5ud9nSnjtVBi3oVddEfRa3LyzC39sGuKiTf34VCgX/imBhxwaebDQmKgpzDmu9wgtU0YT5EyiT
61lI4nIZUCmDO9eJ64D02N3QJ+6tzZgv0mAV0cFZVhw2BiwFDIsNRtOLL53tLThJqZquNckxYs7P
s6Le+t/KteUhhUk8UyDejHRZfCPeF2K8mid2BR2G2njUej/YB7lYOTZ6vfXy8NC8ead/M+htoUaJ
EqQ4IVxL2lakddIwoR1gnsak9Ujz+u9nMhiByY9UAMdghBV5s+p48NcYXXYbvpIX7kQAEDHAcXYv
lJgTG4rO35aiqoSQ25EMGoEjFpfIBhT+ViEYjbJmoTAz9RaaNZzyrkPAc8axB0y6BNTSYvzDEsbc
gBtnJEaXRuXFoC7eK+LWOEF3YUBxJ2xeYlYNIh+jCQegentKEYS1e/atxwpj/Z9g25LnQHGf0AEv
6Ayn9xt07vY3JGEG0xqwWB/utXKtEJgcG7jEpROL0RrQCWVtqb0G4iJ5WnpT0zvCnsaBCX6m2m5M
jDah0ON8KR/biYmqzg3pZo7Y0CbJSqX7wJgNjR0I0KBVXRw6Lcuk/c7HiMs/9hwAn8ufQPy6i8UM
szr4Xq3ogjFIiYv762m+8LEzJ3vDAt3KiK8J+s7Bu6A6eJWDol4RwY9Mf1wWMkSWbs4rOmUcMBkZ
cUPHTfkaDYTTndskzRmgZuhH+aCH+AMPYGFDvt1lFEGOy+9c2asJP+zVo4IbSUOJNiu9Xr79PiJc
W4QHIlSmyF/nKZWU66CdHX6Sph4m3j4rbJRpGeL+zt4oNYzywzFXLW45jkiPRRlPuEa+B+NK1WN7
ey9mJ9AN51yKxmYvQ2OA/9VPWuDsrxaYispQjABENcMArss5pGo/SpLZtzMRLk+912luPdj7Ei2R
+WP9ETJS27IJp7lKxl8sxQD1RI5J9pgEX7/XDPfYIrMCj1JER5bewelnk4K13WsjChzJhIHhAW6N
3K1r6rNMNclxN9PPYv3slgymOH3eWkjdfenRAjl8yMzeyLOVsYbbhAtwEnherl/jIhLU4IKBCGz7
A1FkqEQzN2i9qBSwXiPJWlvaDMYqFhdTiZb1dHdmyk68H4tPehzaK4c+VrvZJ8BfpX2Mctd0NSQV
+MhIu0C3CjWLt8rMcKFcKdt8AsHWfvE1nOzenG2h+cvy6/qsCvFQDoa/IuuyqjOPYQsQyXaT8Vxj
J1O20FFRixMoGgewRoxOs/MKP3e21nIGxm1ixVBHV+9ySFoIIacLkhquZCBWdd/RuTn6ToSOJJIV
9Xo8ZIKX6w75QlmDs03YJl2vqHuDabIx8EjYMQMiZVCCKswC9fHXAteh3uK+XScDwXNB61681bRT
rrbrIXfFJ7oFfvrIFJuu7xNym2AVW7uLEw3lnba86zQfe6D6p+2c8dvAhesKUlSGwf/hQFgi2AYZ
Rmu+T6fnShMIx4hgk/vkHxzIykjgbGyA+Jsv7gDQxLJGgHhEtqoiFOy159KTgtShchXBlFXjH+Su
/JEq8HxTnfA3O61wmAqW+loQisXRYAj9TQTTyLcVhG1wJ2Ym5KHs14PP9fpqSh+T5P2zIy1prReV
CVjZQQ+6gTlMDl0ZBB5tFUQuchw9GiOj0qrjdEsyESx6GTbnNQ4BfUQsO+H4L5C5mothao8iSQql
FJ/LPXMfaZj6IrXrPjQCGtTCMxOQeRa0tBN7W1Vz6zSKG9RSgkCmi05uAwp/QlqbIlMtPHyN9qhH
mZpuxBYMtvYOOyZVBAY1o/2Gzb0u2/D8Uqf1/fR6zUD+JX6vYErIRT3cEb1gJLmV9BZwLOb/VUtS
5TUAHUZMXMQTzFXrL8CKXdcdrxCNGWBk7ckPFs/3BzI5bik+JFDwpmECcE8Z6AG4uScbxxbpgr2n
rUUrjHDH9EvW73f9DbYRqViO6EyFc703oWn46+6BlEzeY7BiHT0TbvFtp9PutFaGDbfkM635FW4r
hDANq1ho6muxir0BcXipn7G7BVatUxAKQCdQX4TCNhaawhMMag27q43uTFIz6Zj14jd7iYQbcniR
1rDd5J7hl/52QJdioZDWKJQxrGeOVSBYWww77abeqOGRh3b2uWx80fmylyXrLnHduqde4RWvybcx
EIqtbfq3dnF5PeG18RKK9gTFKW1hsX5D7Vtma36vV+kt9OOo9wAdUz3uQhg2mnFrayUTE7VMIKCA
QojXVoyD5ulpl7/5OoftKu21NLUfXlWnWz3Za6UKUpB7jhWL51P8ZT9IqQVtkzkNGuvcXz0US1K2
7nLQsbtkyVtrsSqfqZAGcFV0nk1TanxqX4/gcipWfvhdKZoQTBpi5gep01QImbwvVDH/afblOrOZ
7iYyZYsZjBfLZM2cg+SAze3iMwZi6cnZSNmVt6q4o+WfRdmTcYkwGmEokJHrN5tVvmHa3m8Xwf4V
6iY9ifXGg4MAsaqxFLHvBOiPoj07dOvO9euLVGsU2kuwv4Xb5Gcy8rK/BOFSl9tJxzM1U/IY2tGy
LuF0CkGCCUQ2dQN+VFqhiYRQaSJ3aQyoVyoqszFxXWPwagSjWCikPwopYXDpiD3cOV7kTTqYeO4y
fyIi9sABqhWLB0L/iMvGXInm0P7JUnKPS9Poc2YgDIJyZUj1pw4xqLClnAR07TL02LTzmkcAgPMA
DzqCdDjUZqE4BlO7ExY1Vw4/J/RIXVHHLQrx/OTF9lTcF4lhMBsgc28e2fPnkraKa/WWPbsBpGzV
slOrtTA1zhx9a7usybXLxXfGzlTTRLKeO3wjzKJasPZivg/a7T5TCphi2mIm6TYDCJHX+ZE5hfj8
SfvDpfqx+9ZysT5aSPK4eYXlnE8VIWKWUXr/K1OS0Sp+7cNZux0taF0Uo58NIdXsLKcM1PD7HUMZ
TGNUUpx1xOb9nVQnaLh1FhvFWi5EOlFlirhn7Bi6TVEdYEN8pWvbotkayGr4Dfeo7JPNb2qE68/o
fVbhrvUypQ+iDHub3RcKOpCdyggzQHkw91yBtxX7DPvphrQWgHtdbegBlYfxb7ZeZSpWxHPzN3zM
lSWNM+XFKHyEYMzSbipg4m5gWxr10A9izp94ZsnJKBBpf8Vzqy9Hn1Od3K+u2njUq6APEVVwwnIh
HE242urLbYD8PNfR0SHqibTjenC1ghOs9pXZFF/fEmCVml6kDNWXyYit/LTupye/hHOirkqX8hTn
KwyRJZGoX8KcM46lTf7cNtgwRybBWVDeVbM16h+Op2K5zI8YKbS58cX4HbWHHZ3pOFiTPleA3IpQ
YdzXLbjrMOm5csVvL+J73pFOdlVwYjNrFs18tRVnQrEQMlP9ajfLTnqnusYZO27qsUwjtFy92IT0
XEn070GdL4MeciR9UJ1La8BKP1nPdHjyzyUIMyC70fIAMb09uW9tjYzP+RySiDPBidTId8r6Qk77
JpVaqljQYHz7l5+IlTeADdkyoC9XvBCPyMDx4hdJJ9DJQBR4HRkyd+Y1lyAouQI8SyUFXl9Cq9AE
MAUq+CoMhbSD1pJGZrWkWRgvajmHfXTfI6eroTpLmu6Hwq1dRhMX/xMagd2vG9nJdbpWL7S3NyA0
xV5Cs826t1W6Y/kFKGkXHpU3CX7XvbASSbwtMXlD+uRAfHN8cwBiL/nFKEP5+vnRtOOkCxNncBO4
SdvpYyJVqH0fS4F0WZaUekwTQfN7XdVSXX8PT5BFI9gzFdjB2yxBcIC6NBj0Yc8axcWRuHoIKJ2o
Hc5RaFitC/rdPmaeoGqtMVXzA4oW/fEQM6BCrz1Tvxvb5NwtaJBnBe/TOyNwwzP/jXB1qcJXuUPQ
jEvgOyeoNTipiy/6JXErA/grO/iuG997dBuxfaPGu5+oCBPt9FDwMgZrz80hiQEbDsD12tyHKWCm
ojL71uixvKVYoXp1iBJbpHx/ZggYrEOB6UxkHHVwXDRqk0OfDVZtGDb20igbzwXCEkuXTPY9zgYu
0VyKnDk1MkXVFPsXrkqHBsy+WkBqkyDyVydD+XRzvZg6UPhk0BgwIGEN351aA2qip/tno4PXGVN5
xQslf8U1ezZHlhUXBfG6rsHTTFt5KS43XEO9mz5Q+8qgZsWJASNqZw7M44IOE3qrKxgvvwEmqAMX
dLb88X8Qfn/a3Bl3vcZ9uLKlnuQh5sL5nt1w/I43l2HRaEWeSOpwWKOHf3/cp/uZUw2KYUN3fGVI
3CRKRFN5xFgsGfy8wyBZLFXCs9JRjydZBEvTtSfmK+DKV9liCjXNMpBEL4nNDfdTupQ4jsE/rSpL
+vso3Rjml1jXqRD/Gl+wuDuApSPshB7qRRsLnm760f0CCFSFn7sku19O08p67qSGHCY0ha4XZuRZ
drS+EygZChI4OHqIbo1tndye0M+u6R3WhG6L52F80F+HaYHhnSnGi989bvhyyoccEF5BYKdB/xYo
X7fLPuxB7zA3kWIGJ69yvDyN+470UEwRVLmL4GFDO+la48bV1+rIpQ5/y8cItXONEGxWIR7OtAna
F6yGhi8JgM35id4X9Ii5Hz5iNF4gDIB061VRrwMXpz+yFzPt5gms7OS4l2fwawwlzha6mIezNles
sLeijDmny6K+w8ZqhRuj47w5js59O3dApESOWPNRpic0JXr9w86JQ4yGAtAIwwMUSGCSVfuExYh9
Ho+qDQbT4zig3ZuZ36IIP+KYhAerqVZbRWBBr91i2wNcDUiYC87pfk89NTkKnBlUEhgtjsmPuiKS
8f9dIRd1d2NmnLAqzo1I2QqF/Fy3ErxeHOSYUuH0mRpzeFo7unJc9+jPMHHPblxgAFqt+eUdDZCe
UJS7WLEzcYU2m1sdAOBcsBvCkHGNtD/rBreI5GmPcWzcrXv/MmaxjsfC7TGXdRS1LYRfFZaF0Gud
a776vIaghJHHdwZL3yy0Hvn7vPbLg+XcMUYLXeM0fgO80mExkiVtZAo6WZUiAj4yJjuGAB/H7haK
vK7sXq4S5GrhWlyVbcBYO94ew9yC06qfPAf1wjhEDf1NYRGc7Bya+HjSXDPPkY/IU+40Ox8BM7uW
rt97W/Kz3kS4jdsjR+ybJJxQ0xinjDnwLOhOt4bNw9GForsBwz9Ccvo2nvdZmsGFJsAczHw4uFAJ
2PicZM5lkxFtB92OTDWjtAyQeLXuTyL+HeHTzh/P6jbduwx4X5toJJbxBNxxt3q4Gacr0n58WXSa
6PBkRO0EBtCfAuBO6yxpQEdPF0JR7s7xXAu5Z+9hngMEGs7rYC9Ms0eYCh2rj3WGzqz/Zt/CXNKv
RdohB8ghwQN6GDI9Jz25eiM5K1Pdzp7pJCU5LnfMAiqSqqX8qDYEGmHOR34SruuAK9hqVL7pFTMX
IJwd/vyIVgNteeUO44MYIY0CXYFuEvFWHo/uFFgcOU2S9KApJGbkb4aDvwBomLRblmeRLGBqHpvX
ZSf81JQOMptfAEbrlu+Okhq/vcIk7cr3++am7Hx/Bzxf7d06EmlJePVgDGaODp/hcEytBm1UYZuX
pRSPlW2uKEz1XjSf7vv+hN9bAlSZ7lDEvcYJb85BKqni9jnrRM2YlcHyjpV357vBtklPjVPKkkcA
mmKTce0ADS2on8v3ZBQh8hXVUy2ncuf4/oJxQJBwLR/85ZWeXJtPNOVWlj10+mohqd/RaIRJ5uLN
5yrE6NlfEi7zPB/Rvlp7P0/IVUdX0+GWqwXr9fQRDPTI0kOWd6zLoP6pDgmPdOsvJwN/maF5OusL
892mWQmgCqayR8hDWLy0muGuK1mLxQMcghQY6I6Z0UHZPuMaVVs63X6CqgYfESJ6RTtizZgJW3/T
02rkXwdI37p4dJLlT1WZnNIn0HrHdBv/0ybO5/dtHTDgM6BmxxztOKIfOOVAlBEhF8plBfwDTHuX
QQF/di1+6Pv9en0sD5YFdeqjQK0loSaTCUBmgzPnGUGi+1dSOQUpS1PCp9zXN5OBvDmTsWWxIg6V
DwrDMFddSct7+0/4GHPhUSYe/WOIwTbNSWJVNMDdJUFv2DCjCxa9okIS5xaG7yoB+XoHImVwcFPw
EMswEHcFTO4r98DfTJxpaRaasR+gT/lpAbzsMoENGCeLCZGpLEDHuy59brajNULjw5yTvz38rsvZ
YRP/1ILh9AAwL5lplkxNqwxQwT/dRgAFibLx0uSeT4CGnVW/KFkD/kttDwZ7MIYuBv98em3+OlZ7
wqzAPAcDw/stK7RYv7d8dYqB4QOyMHQtPuG1s3o8p4hWR3JrqHZMiO8KFs0Nc3U7E1JOB0EDRvGE
NVjNjT6/xDnspTpCdOD51mWmlVjEgpqX7da4jRibJ6PXJPTAx0A8RMwzpHPLHDT0s7UiDn1or/bX
MtNmiYtvbOuglLsRuh8ypniIYHx+AhKjP1buljtEkkdvsqXOazBEyG+D2yHvWkf/UP6TIZxGvd4q
pZ9XLQwr31lWqErDhvXc05bfdMrgz2hp56t6zt2n5eA82HLfqD9Qke2P/Csi8HqPTEOlvDuvor7h
zeuNl8e1ARW9hz7DEIGHleCQh/PpiJ2dJV8U8g+WcLHjsHuc2Yq1HW8nsY+DMlqsTRguAmp4vKoA
I8SVQa/uNt0WWFqV0Azz/54LyESWWJVBzyJwY+G9TwTmhrxsw26Dp9q6WSqj2ToNhtmmprxqCnhm
fkohzkpopb4Q6R3DR5mFxeP2+U4Z+uds4PQGnx0fgOCICtXRgC+Qe4VRjvGELnoRzVpe56NF/U2R
2KtGXVBMWVc79yiUsbgSo6uuYTAmbfSa+Ai+GvCj0ecS65g2sqf7jAkkfrKVmMeP0RWrc2CtTfjY
nmPav9JwfqYSSIl647eH3IK8Kt0zddC4UoYg9TXY7QMBer/qLa4erT14qHZ9QXz7ViikwBzaeAan
X85ZBa37mUvNPdZiIu3AKaBdAoBHr6OGi+Qpwd13gyaGMPb6lkXABH1xaTyO0avESRyFroo/n6xQ
zDh5n0TpXxnhrSJerq6frMUYGHpkZloFKoM9w3IQXXkbEwwHetnzgGZkJmdmbTHLbZSDY/3iiueZ
cd2uzZTwfpNWbf6AymmqEzgo3fZCjk/OQyX7gTCkR6BL+SP4aJGuZIWT4FBcpzncIZXox9PJNYt9
slkz6wZX+j4lHGQpgqxQPoBjueDolQm6Rm/GDWIY+oEmv1pVxeMbtrGpk4BFBAdq1/yxf6d7a5eT
13/gv6tLePRYi4AQnwz11XGW6oQmmojAX06VZa0Hu3Z3aXqnT8Lq8Bk4dtgF7P+LmnvOX08Zj2Fx
t4YQLl/rRx3Dj2WRXWAAv79OuBOdCojPGk3MxBfivnreYUEU2k64GDNGGY2qiy2y4/iBhObM5JjX
+W5CYhdvPKmlgXqQOenCfuCQWQCtGXSSty31EXf9AqnXF9fvM61yXBHAazoy8yftrXgMYgBnDf4s
RpHbONA+2AbOSVOVIJi1tXlr0x9oegDXZye/SqReBLfASTWcBqBcH+1cjpbv1hy0M6wunoIeiIgj
g0/L+J/7Km8GdSXOwGio93XQtxUkWfcIi39iDX/iOt67qkVgzHE2pLmZW31F92RQqRLWG3X6ovkj
iDT02UBsRRDcgwqVMt+tj0h9lWfgN4El/IenJBsu6iFDmuK9FUA8q6aF8SgWEZGtnW2ub+AciYD4
q4X4OeJqOFhTwniXGQf2s1zqI5ptZFkGg+LrXKT2lJOemkky8EmK8f8J88icGjPLkDJyt6BSSO8I
+qxzFMj2sdxhVY95OuUOI20rywQdJAP+GkLFK7KJgYYiNKW62i4+8StNhkQTTvXo26Q0FR5RoiFH
+r5lkt7f5phJ3numzir7XhllXq3SMa2k26Uet3a7d1pp6qxFw+56h9DmotKdOFLREZfugyeWM8WA
a03vRNoCYfO1+zY0EH5jlSLUvxF+kYR59c1GfBqCqYNt+pcApOGcgIN6X68rF2ksfVDkGym6uJ80
KZa5hQPowKO3GbV+Gwcg75AaNq0xxFWqMC/y6XJ9/WQQcXF+x+2TZf3fIaHwetcgUWhVDh421EQC
PZT9/TEuzg+EA2mjLEaDHG78myQPuSfFEoQt0ru0H70T92pBcVR5iW9Bquf9Kg1cFYhjhZ4ZnySq
cfgOswvslwfJ9qpkcC/+LvL8QnmpvZ+szGOCB+WYcmV51fR/MJaR8DtdIvDjdvV8x4n406xTBsY6
9bf3Ylt4sVI1guagS1m+hG0ZivIP3iORkdhaNTmE7crSMtwQP3Vk5WF0jVkb0kRjP9Sta+NLHUuI
Ticgarx+4BPP5Hpuq0gZRIaKpMaKUG8oBW8wchnKAQ0fACQzwvvfNnRijn/njyh4GP5U/ddjaQ5t
crgbDeUqnbPhmUZjyaHFRI5BxWk/R4PRcuxy1rc0+3GRZ4+DHj59FX3R5ilJ9JfwazwvRiBUYidN
HJN7kQdnTuFgXTGML+m4ycBLlWcEEB4aH4Ny9UoZjRJj0iygWjGjxnm30im24FALTxWWZkl999OA
hFLjJW0tPObWMgaq1g0KIrSLQ+nLtlOY8vLFwd2ZNwa1n1jIfsE9F84a/6XQjE8baux1I1et/3R4
WKW9h+zm2a+ly5hMomlnsPwmveTUx/05gOxkL4zd7cGFW2SYXqvbe+gpz6QVj5rDNIndRZrSKCKO
3a+J8+XuCMmDCPMd/feK/mroABDjPyYXb3gXe3maTjFoLxbUecIuc/avhhekHK78kqtjIAtV2p2x
3Nzoy/n3d2j+Rt2iC177hhOqogetQ6AFW4Rydkl/zy/17h2j33ZU8EivsA4pNsS984v7dy+52Cwz
pwwaV3HY2vwHXkPkUwvPogRk1XZO1l1GMydNQGqELn/6SAZJqs5aZqm9gRKOGJma5s2oBfvVMRHV
+N9CF3JOAfAHUeelnAv5jqgT/DHMnB5VU8cSbS4SX91Fm1a4NX+V3OISr5TKxThBZ6zaF8/TWGK3
0ZfpBITzjSkceohr06ai7Y9/XCvlTEuh94jdyRyTviXjGUSa/8ogOjFMXzR/5pQtFHVFzmkf/ydl
fd4jz3zWJjtB+uhHnGiaGA9qff7vh4oBbEW2FripJz+m2O1CtNRuWrp3FXaHmIE9PCqIAPEuiF+r
ouHRd79l6TbyD09zRglre5IQjYoV1Llyf5D4QEdarRbGewxmI2UxLWDPsV3/SvOsiy9VXkX/+yA0
DyizqUyR0e52h238en24uL6qMmCbAxMfoK4Ce85SttUi/CJlgxlbs9xznclZ1gDv+2RfF8/focUS
x9V/nMgdifv1/vvIdn4kNoPhgiMEMaqFdGZJBydu3EoHegsuyiakzUA8tfs4FkLzX5j2BfASROFW
WcSuJdw2A4i/KzObTmFO6lWb67lxk1PyQkJaydVIFgI1DnaMwYxAyPahfw3roqbDG7HLKRDRXmMc
Ane0JvLQFWv/81aGst0TzvDnFvAWEJNkckicAdEA5X2FXzMiFPQrs6Ro+tDQ2eGY1W3xE2kIP2SA
7KMvlW7ifTtbipkAv+nt44A386P4MWSgPmwWvQN423DJ1hOUfLuBfLl0M2niNdWjuGfGltjvYk0x
+208EgKqYw4iCR/m513ZFabUsX75j3ZyDzdWD0kEV/SW17cq4LLmbCBqmd2jSbJofQgLwL5rS00r
58AeCho6iz4Srke53n4QwYRqWxh2FwjGcJ9y4iGns6UR+GF99YXy9vIsxM4hDr4L9BRXyONVTUNJ
LsBVtCGQq9o5tvvcFselJiEMVFfUB6bROB5Mqv7V+OAY8wgP6ot5Y3HP3ZCEEpS9aQoa2nJ5NT0c
XXCEHC5qf+lbhNlw5Gv1usK0gBDlfvclMAiFZR0XjHjXEavuAq3g2l2QW/n5OdLWIfFkdHWij3GG
U11/BqFrtNMrqRW+26H3QD5+X3+BYxR1+ajCNn6j2QONFTMmG9oy5dM7u/f3HtLWxiRVpMCYNL22
RY+th1A0dG7j0h16qVO/j8C7qQCAmJMRrQS+S4+3Dy4UURKcWyRqg+AotOLa7ENoHL9cEVDmwRrD
xBqLIpzZQIVMy3zS/WLLjTySifcZ1ybKC3TxEiFOMESv4POSGfw/eWn5mcF4OG3qcnVNXK4Z
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
