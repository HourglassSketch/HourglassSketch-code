// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 17 09:53:09 2023
// Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ram_16384_2_sim_netlist.v
// Design      : ram_16384_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_16384_2,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27040)
`pragma protect data_block
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
UwFqgPdslbYu0CCs2Nxwhyw/mEy3wQ==
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
