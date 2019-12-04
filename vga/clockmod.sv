
module clockmod
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