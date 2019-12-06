/*
Inputs: A clock signal and a reset signal.
Outputs: A clock signal half as fast as the
input clock signal.

Description: This module takes in a clock
input and divides its frequency by 2. For
example, a 50MHz clock input would become
a 25MHz clock input.
*/

module clockDivBy2
	(input clock50MHz,
	 input inReset,
	 output reg outClock);

	always @(posedge clock50MHz) begin
		if (inReset)
			  outClock <= 1'b0;
		else
			  outClock <= ~outClock;
	end

endmodule