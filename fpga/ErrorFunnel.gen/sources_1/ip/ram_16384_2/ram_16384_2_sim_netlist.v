// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 17 09:53:11 2023
// Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/SourceCode/Xilinx/ErrorFunnel/ErrorFunnel.gen/sources_1/ip/ram_16384_2/ram_16384_2_sim_netlist.v
// Design      : ram_16384_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_16384_2,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module ram_16384_2
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [1:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [13:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [1:0]doutb;

  wire [13:0]addra;
  wire [13:0]addrb;
  wire clka;
  wire clkb;
  wire [1:0]dina;
  wire [1:0]doutb;
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
  wire [1:0]NLW_U0_douta_UNCONNECTED;
  wire [13:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [13:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     4.35525 mW" *) 
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
  (* C_INIT_FILE = "ram_16384_2.mem" *) 
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
  (* C_READ_WIDTH_A = "2" *) 
  (* C_READ_WIDTH_B = "2" *) 
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
  (* C_WRITE_WIDTH_A = "2" *) 
  (* C_WRITE_WIDTH_B = "2" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  ram_16384_2_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[1:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[1:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 26992)
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
