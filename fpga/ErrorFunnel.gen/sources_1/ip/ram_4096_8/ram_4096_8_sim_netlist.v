// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 17 09:53:11 2023
// Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/SourceCode/Xilinx/ErrorFunnel/ErrorFunnel.gen/sources_1/ip/ram_4096_8/ram_4096_8_sim_netlist.v
// Design      : ram_4096_8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_4096_8,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module ram_4096_8
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [11:0]addra;
  wire [11:0]addrb;
  wire clka;
  wire clkb;
  wire [7:0]dina;
  wire [7:0]doutb;
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
  wire [7:0]NLW_U0_douta_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     4.53475 mW" *) 
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
  (* C_INIT_FILE = "ram_4096_8.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
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
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  ram_4096_8_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27344)
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
