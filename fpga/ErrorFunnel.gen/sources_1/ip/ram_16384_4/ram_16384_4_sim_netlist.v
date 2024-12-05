// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 17 09:53:11 2023
// Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/SourceCode/Xilinx/ErrorFunnel/ErrorFunnel.gen/sources_1/ip/ram_16384_4/ram_16384_4_sim_netlist.v
// Design      : ram_16384_4
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_16384_4,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module ram_16384_4
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [13:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [3:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [13:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [3:0]doutb;

  wire [13:0]addra;
  wire [13:0]addrb;
  wire clka;
  wire clkb;
  wire [3:0]dina;
  wire [3:0]doutb;
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
  wire [3:0]NLW_U0_douta_UNCONNECTED;
  wire [13:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [13:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "14" *) 
  (* C_ADDRB_WIDTH = "14" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     8.7105 mW" *) 
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
  (* C_INIT_FILE = "ram_16384_4.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16384" *) 
  (* C_READ_DEPTH_B = "16384" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "4" *) 
  (* C_READ_WIDTH_B = "4" *) 
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
  (* C_WRITE_DEPTH_A = "16384" *) 
  (* C_WRITE_DEPTH_B = "16384" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "4" *) 
  (* C_WRITE_WIDTH_B = "4" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  ram_16384_4_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[3:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[13:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[13:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[3:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 44848)
`pragma protect data_block
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
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
