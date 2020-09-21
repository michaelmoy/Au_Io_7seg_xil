`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: MoySys, LLC
// Engineer: Michael Moy
// 
// Create Date: 09/13/2020 02:54:34 PM
// Design Name: 
// Module Name: top_7seg_Br
// Project Name: 
// Target Devices: Br Shield ontop of the Au FPGA base
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


module top_7seg_Br(
    input clk,
    input rst_n,
    output [7:0] led,       // 8 user controllable LEDs   
	output wire [7:0] io_seg,
	output wire [3:0] io_sel
    );

// internal segment data. The Display Controller drives this
wire [7:0] io_seg_int;

// digit values to display    
wire [3:0] val3; 
wire [3:0] val2;   
wire [3:0] val1;   
wire [3:0] val0;    

// digit enable flags
wire ena_3 = 1;  
wire ena_2 = ~counter[28]; // Turn this display On and Off
wire ena_1 = 1;  
wire ena_0 = 1;  

// free running counter
reg [64:0] counter;

// load the 7seg digit values from the free running counter
assign val3 = counter[39:36];
assign val2 = counter[35:32];
assign val1 = counter[31:28];
assign val0 = counter[27:24];

// load the Au LED's from the free running counter
assign led[7:0] = counter[27:20];

// wire up the segments as needed. Set DP off:1 for now
assign io_seg[0] = ~io_seg_int[6];
assign io_seg[1] = ~io_seg_int[5];
assign io_seg[2] = ~io_seg_int[4];
assign io_seg[3] = ~io_seg_int[3];
assign io_seg[4] = ~io_seg_int[2];
assign io_seg[5] = ~io_seg_int[1];
assign io_seg[6] = ~io_seg_int[0];
assign io_seg[7] = ~io_seg_int[7];

// wire up the Io Board 4 Digit 7seg Display Controller
IoBd_7segX4 IoBoard7segDisplay(
	.clk(clk),
	.reset(~rst_n),
	
	.seg3_hex(val3),
	.seg3_dp(1),			// turn this digit's DP On, solid
	.seg3_ena(ena_3),
	
	.seg2_hex(val2),
	.seg2_dp(0),			// turn this DP Off
	.seg2_ena(ena_2),
	
	.seg1_hex(val1),
	.seg1_dp(counter[27]),	// blink this digit's DP fast
	.seg1_ena(ena_1),
	
	.seg0_hex(val0),
	.seg0_dp(counter[26]),	// blink this digit's DP faster
	.seg0_ena(ena_0),
	
	.bright(4'h4),
	.seg_data(io_seg_int),
	.seg_select(io_sel)
	);   
    
// keep a free running counter to use for Display Data			
always @(posedge clk) begin
	if(rst_n == 0)
		counter <= 0;
	else
		counter[63:2] <= counter[63:2] + 1;  
	end
	 
endmodule
