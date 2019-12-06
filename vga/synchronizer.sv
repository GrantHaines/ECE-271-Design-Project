/*
Inputs: A clock signal and a 1-bit data value.
Outputs: A 1-bit data value.

Description: The synchronizer takes asynchronous
inputs and syncs them to the clock edge.
*/

module vga_synchronizer
		(input logic clk,
		 input logic d,
		 output logic q);

	logic n1;
	
	always_ff @(posedge clk)
		begin
			n1 <= d;
			q <= n1;
		end

endmodule