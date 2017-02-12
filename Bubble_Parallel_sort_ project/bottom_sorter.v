`timescale 1ns / 1ps

module bottom_sorter
	#(parameter N = 8)
	(
		input wire clk,
		input wire [N-1:0] i1, i2, i3, i4, 
		output wire [N-1:0] o1, o2, o3, o4
    );
	
	wire [N-1:0] w2, w3;
	 
	 Swapper #(.N(N)) odd_1
	(
		.clk(clk),
		.x(i1),.y(i2),
		.s(o1),.g(w2)
    );
	 
	 Swapper #(.N(N)) odd_2
	(
		.clk(clk),
		.x(i3),.y(i4),
		.s(w3),.g(o4)
    );
	 
	 Swapper #(.N(N)) even_1
	(
		.clk(clk),
		.x(w2),.y(w3),
		.s(o2),.g(o3)
    );
	 
endmodule
