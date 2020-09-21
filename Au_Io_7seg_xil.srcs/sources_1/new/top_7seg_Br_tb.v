`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2020 02:54:34 PM
// Design Name: 
// Module Name: top_7seg_Br_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_7seg_Br_tb(
    );
    // from the system
    reg clk;
    reg  rst;   
wire rst_n;
  
    // Output
	wire[6:0] io_seg;
	wire [3:0] io_sel;
 
	wire[6:0] seg_data;
	wire [3:0] seg_select;
    
wire [3:0] val3; 
wire [3:0] val2;   
wire [3:0] val1;   
wire [3:0] val0;      

assign rst_n = ~rst;

assign val3 = 4'h5;  
assign val2 = 4'h4;  
assign val1 = 4'h3;  
assign val0 = 4'h2;    

wire [6:0] io_seg_int;
wire [3:0] io_sel_int;

assign io_seg[6:0] = io_seg_int;
assign io_seg[7] = 0;

assign io_sel = io_sel_int;
 
IoBd_7segX4 IoBoard(
	.clk(clk),
	.reset(~rst_n),
	.seg3_hex(val3),
	.seg3_dp(1'b0),
	.seg3_ena(1'b1),
	.seg2_hex(val2),
	.seg2_dp(1'b0),
	.seg2_ena(1'b1),
	.seg1_hex(val1),
	.seg1_dp(1'b0),
	.seg1_ena(1'b1),
	.seg0_hex(val0),
	.seg0_dp(1'd0),
	.seg0_ena(1'b1),
	.bright(4'b0000),
	.seg_data(io_seg_int[6:0]),
	.seg_select(io_sel_int)
	);   
       

    initial begin

        rst = 1;
        clk = 0;
        #50;
        clk = 1;
        #50;
        clk = 0;
        #50;
        clk = 1;
        #50;
        clk = 0;
        #50;
        clk = 1;
        #50;
        clk = 0;
        rst = 0;
        #50;
        clk = 1;
        #50;
        clk = 0;
        #50;

        repeat (1000) begin
            clk =  ! clk;
            #50;
        end

        #200;
        clk =  ! clk;
        end
            
endmodule
