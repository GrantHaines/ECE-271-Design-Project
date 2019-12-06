/*
Inputs: A select signal and red, green, and blue
binary input values.
Outputs: Either the inputted RGB values or 0 values.

Description: The VGA displayMux decides whether to send
the inputted RGB values to the screen or not to, depending
on whether or not we are within the displayable area, as
given by the hSync and vSync modules.
*/

module vga_displayMux
		(input select,
		 input [3:0] inRed, inGreen, inBlue,
		 output [3:0] outRed, outGreen, outBlue);

	assign outRed 		= (select) ? inRed : 4'b0000;
	assign outGreen 	= (select) ? inGreen : 4'b0000;
	assign outBlue 	= (select) ? inBlue : 4'b0000;

endmodule