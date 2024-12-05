// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Nov 17 09:56:01 2023
// Host        : LAPTOP-CK74LVEA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ram_2047_17_sim_netlist.v
// Design      : ram_2047_17
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_2047_17,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28016)
`pragma protect data_block
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
oAlqOPVViCI/jvVhpuxR1DUMsVMu1OMJOakSr1o=
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
