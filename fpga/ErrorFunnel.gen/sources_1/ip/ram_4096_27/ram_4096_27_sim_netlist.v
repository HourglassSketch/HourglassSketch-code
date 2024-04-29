// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 17 09:56:03 2023
// Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/SourceCode/Xilinx/ErrorFunnel/ErrorFunnel.gen/sources_1/ip/ram_4096_27/ram_4096_27_sim_netlist.v
// Design      : ram_4096_27
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_4096_27,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module ram_4096_27
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [26:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [26:0]doutb;

  wire [11:0]addra;
  wire [11:0]addrb;
  wire clka;
  wire clkb;
  wire [26:0]dina;
  wire [26:0]doutb;
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
  wire [26:0]NLW_U0_douta_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [26:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_36K_BRAM = "3" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     13.767449 mW" *) 
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
  (* C_INIT_FILE = "ram_4096_27.mem" *) 
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
  (* C_READ_WIDTH_A = "27" *) 
  (* C_READ_WIDTH_B = "27" *) 
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
  (* C_WRITE_WIDTH_A = "27" *) 
  (* C_WRITE_WIDTH_B = "27" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  ram_4096_27_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[26:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[26:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64112)
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
