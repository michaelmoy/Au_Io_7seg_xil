// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1.1 (win64) Build 2960000 Wed Aug  5 22:57:20 MDT 2020
// Date        : Thu Sep 17 21:53:57 2020
// Host        : winonssd running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/MoySandbox/my-fpga/xil_7seg_Cu/xil_7seg_Cu.sim/sim_1/synth/func/xsim/top_7seg_Br_tb_func_synth.v
// Design      : top_7seg_Br
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tftg256-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module IoBd_7segX4
   (io_seg_OBUF,
    io_sel_OBUF,
    rst_n_IBUF,
    CLK);
  output [5:0]io_seg_OBUF;
  output [3:0]io_sel_OBUF;
  input rst_n_IBUF;
  input CLK;

  wire CLK;
  wire \FSM_sequential_curr_state[2]_i_1_n_0 ;
  wire \FSM_sequential_next_state_reg[1]_i_1_n_0 ;
  wire \FSM_sequential_next_state_reg[2]_i_2_n_0 ;
  wire [2:0]curr_state;
  wire [5:0]io_seg_OBUF;
  wire [3:0]io_sel_OBUF;
  wire [2:0]next_state;
  wire [2:0]next_state__0;
  wire rst_n_IBUF;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_curr_state[2]_i_1 
       (.I0(rst_n_IBUF),
        .O(\FSM_sequential_curr_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "STATE_IDLE:000,STATE_SEG_3:001,STATE_SEG_2:010,STATE_SEG_1:011,STATE_SEG_0:100,STATE_DARK:101," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_curr_state[2]_i_1_n_0 ),
        .D(next_state[0]),
        .Q(curr_state[0]));
  (* FSM_ENCODED_STATES = "STATE_IDLE:000,STATE_SEG_3:001,STATE_SEG_2:010,STATE_SEG_1:011,STATE_SEG_0:100,STATE_DARK:101," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_curr_state[2]_i_1_n_0 ),
        .D(next_state[1]),
        .Q(curr_state[1]));
  (* FSM_ENCODED_STATES = "STATE_IDLE:000,STATE_SEG_3:001,STATE_SEG_2:010,STATE_SEG_1:011,STATE_SEG_0:100,STATE_DARK:101," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_state_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_curr_state[2]_i_1_n_0 ),
        .D(next_state[2]),
        .Q(curr_state[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_next_state_reg[0] 
       (.CLR(1'b0),
        .D(next_state__0[0]),
        .G(\FSM_sequential_next_state_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    \FSM_sequential_next_state_reg[0]_i_1 
       (.I0(curr_state[0]),
        .I1(curr_state[2]),
        .I2(curr_state[1]),
        .O(next_state__0[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_next_state_reg[1] 
       (.CLR(1'b0),
        .D(\FSM_sequential_next_state_reg[1]_i_1_n_0 ),
        .G(\FSM_sequential_next_state_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \FSM_sequential_next_state_reg[1]_i_1 
       (.I0(curr_state[1]),
        .I1(curr_state[0]),
        .I2(curr_state[2]),
        .O(\FSM_sequential_next_state_reg[1]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_next_state_reg[2] 
       (.CLR(1'b0),
        .D(next_state__0[2]),
        .G(\FSM_sequential_next_state_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h24)) 
    \FSM_sequential_next_state_reg[2]_i_1 
       (.I0(curr_state[0]),
        .I1(curr_state[2]),
        .I2(curr_state[1]),
        .O(next_state__0[2]));
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_next_state_reg[2]_i_2 
       (.I0(curr_state[1]),
        .I1(curr_state[2]),
        .O(\FSM_sequential_next_state_reg[2]_i_2_n_0 ));
  hexto7segment h27seg
       (.Q(curr_state),
        .io_seg_OBUF(io_seg_OBUF[4:0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \io_seg_OBUF[5]_inst_i_1 
       (.I0(curr_state[2]),
        .I1(curr_state[1]),
        .I2(curr_state[0]),
        .O(io_seg_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \io_sel_OBUF[0]_inst_i_1 
       (.I0(curr_state[0]),
        .I1(curr_state[2]),
        .O(io_sel_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \io_sel_OBUF[1]_inst_i_1 
       (.I0(curr_state[2]),
        .I1(curr_state[1]),
        .I2(curr_state[0]),
        .O(io_sel_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \io_sel_OBUF[2]_inst_i_1 
       (.I0(curr_state[2]),
        .I1(curr_state[1]),
        .I2(curr_state[0]),
        .O(io_sel_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \io_sel_OBUF[3]_inst_i_1 
       (.I0(curr_state[2]),
        .I1(curr_state[0]),
        .I2(curr_state[1]),
        .O(io_sel_OBUF[3]));
endmodule

module hexto7segment
   (io_seg_OBUF,
    Q);
  output [4:0]io_seg_OBUF;
  input [2:0]Q;

  wire [2:0]Q;
  wire [4:0]io_seg_OBUF;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h5E)) 
    \io_seg_OBUF[0]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(io_seg_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hA7)) 
    \io_seg_OBUF[1]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(io_seg_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hF1)) 
    \io_seg_OBUF[2]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(io_seg_OBUF[2]));
  LUT2 #(
    .INIT(4'hD)) 
    \io_seg_OBUF[4]_inst_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .O(io_seg_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \io_seg_OBUF[6]_inst_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(io_seg_OBUF[3]));
endmodule

(* NotValidForBitStream *)
module top_7seg_Br
   (clk,
    rst_n,
    io_seg,
    io_sel);
  input clk;
  input rst_n;
  output [7:0]io_seg;
  output [3:0]io_sel;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [7:0]io_seg;
  wire [5:0]io_seg_OBUF;
  wire [3:0]io_sel;
  wire [3:0]io_sel_OBUF;
  wire rst_n;
  wire rst_n_IBUF;

  IoBd_7segX4 IoBoard
       (.CLK(clk_IBUF_BUFG),
        .io_seg_OBUF(io_seg_OBUF),
        .io_sel_OBUF(io_sel_OBUF),
        .rst_n_IBUF(rst_n_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \io_seg_OBUF[0]_inst 
       (.I(io_seg_OBUF[0]),
        .O(io_seg[0]));
  OBUF \io_seg_OBUF[1]_inst 
       (.I(io_seg_OBUF[1]),
        .O(io_seg[1]));
  OBUF \io_seg_OBUF[2]_inst 
       (.I(io_seg_OBUF[2]),
        .O(io_seg[2]));
  OBUF \io_seg_OBUF[3]_inst 
       (.I(io_seg_OBUF[3]),
        .O(io_seg[3]));
  OBUF \io_seg_OBUF[4]_inst 
       (.I(io_seg_OBUF[4]),
        .O(io_seg[4]));
  OBUF \io_seg_OBUF[5]_inst 
       (.I(io_seg_OBUF[5]),
        .O(io_seg[5]));
  OBUF \io_seg_OBUF[6]_inst 
       (.I(io_seg_OBUF[3]),
        .O(io_seg[6]));
  OBUF \io_seg_OBUF[7]_inst 
       (.I(1'b0),
        .O(io_seg[7]));
  OBUF \io_sel_OBUF[0]_inst 
       (.I(io_sel_OBUF[0]),
        .O(io_sel[0]));
  OBUF \io_sel_OBUF[1]_inst 
       (.I(io_sel_OBUF[1]),
        .O(io_sel[1]));
  OBUF \io_sel_OBUF[2]_inst 
       (.I(io_sel_OBUF[2]),
        .O(io_sel[2]));
  OBUF \io_sel_OBUF[3]_inst 
       (.I(io_sel_OBUF[3]),
        .O(io_sel[3]));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
endmodule
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
