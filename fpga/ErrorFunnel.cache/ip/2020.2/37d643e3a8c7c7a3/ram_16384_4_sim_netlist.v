// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 17 09:53:09 2023
// Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ram_16384_4_sim_netlist.v
// Design      : ram_16384_4
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_16384_4,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 45024)
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
