`timescale 1ns / 1ps

module top_sorter	
	#(parameter N = 8)
	(
		input wire clk,
		input wire [N-1:0] i1, i2, i3, i4, 
		output wire [N-1:0] o1, o2, o3, o4
    );

	wire [N-1:0] w1, w2, w3, w4;
	
	bottom_sorter #(.N(N)) stage_1
	(
		.clk(clk),
		.i1(i1), .i2(i2), .i3(i3), .i4(i4),
		.o1(w1), .o2(w2), .o3(w3), .o4(w4)
    );
	 
	 bottom_sorter #(.N(N)) stage_2
	(
		.clk(clk),
		.i1(w1), .i2(w2), .i3(w3), .i4(w4), 
		.o1(o1), .o2(o2), .o3(o3), .o4(o4)
    );
	 
endmodule
