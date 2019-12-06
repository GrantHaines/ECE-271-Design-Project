/*
Inputs: A clock signal and a reset signal.
Outputs: An N-bit binary value.

Description: This counter adds one to its output
value each rising clock edge.
*/

module vga_counter #(parameter N = 4)
		(input logic clk,
		 input logic reset,
		 output logic [N-1:0] q);

	always_ff @(posedge clk, posedge reset) begin
		if (reset)	q <= 0;
		else			q <= q + 1;
	end

endmodule