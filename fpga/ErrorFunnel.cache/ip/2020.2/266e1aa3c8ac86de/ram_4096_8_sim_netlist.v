// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 17 09:53:09 2023
// Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ram_4096_8_sim_netlist.v
// Design      : ram_4096_8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_4096_8,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27408)
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
