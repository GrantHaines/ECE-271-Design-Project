/*
Inputs: Two N-bit binary values
Outputs: Six logic values indicating if the second
value was equal to, not equal, less than, less than
or equal to, greater than, or greater than or equal
to the first value.

Description: This comparator compares two binary
values.
*/

module vga_comparator #(parameter N = 1)
		(input logic [N-1:0] a, b,
		 output logic eq, neq, lt, lte, gt, gte);

	assign eq	= (a == b);
	assign neq	= (a != b);
	assign lt	= (a < b);
	assign lte	= (a <= b);
	assign gt	= (a > b);
	assign gte	= (a >= b);

endmodule