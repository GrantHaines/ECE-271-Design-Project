
module displayMux
		(input select,
		 input [3:0] inRed, inGreen, inBlue,
		 output [3:0] outRed, outGreen, outBlue);

	assign outRed 		= (select) ? inRed : 4'b0000;
	assign outGreen 	= (select) ? inGreen : 4'b0000;
	assign outBlue 	= (select) ? inBlue : 4'b0000;

endmodule