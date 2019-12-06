/*

	VGA output module

*/

module vgaOutput
		(input clock50MHz,
		 input inReset,
		 input inRed,
		 input inGreen,
		 input inBlue,
		 output hSync,
		 output vSync,
		 output [3:0] outRed, outGreen, outBlue);
	
	logic [3:0] redCount;
	logic [3:0] greenCount;
	logic [3:0] blueCount;
	
	vga_counter #(.N(4)) redCounter (
		.clk(inRed),
		.reset(~inReset),
		.q(redCount)
	);
	
	vga_counter #(.N(4)) greenCounter (
		.clk(inGreen),
		.reset(~inReset),
		.q(greenCount)
	);
	
	vga_counter #(.N(4)) blueCounter (
		.clk(inBlue),
		.reset(~inReset),
		.q(blueCount)
	);

	clockDivBy2 clockDivider(
		.clock50MHz(clock50MHz),
		.inReset(~inReset),
		.outClock(clock25MHz)
	);
	
	vga_syncCounterComp #(.a(10'd96), .b(10'd48), .c(10'd640), .d(10'd16)) hSyncCounter (
		.inClock(clock25MHz),
		.clock50MHz(clock50MHz),
		.inReset(~inReset),
		.signal(hSync),
		.displaySignal(hSignal)
	);
	
	clockDivBy2 syncDivider(
		.clock50MHz(hSync),
		.inReset(~inReset),
		.outClock(hClock)
	); 
	
	vga_syncCounterComp #(.a(10'd2), .b(10'd33), .c(10'd480), .d(10'd10)) vSyncCounter (
		.inClock(hClock),
		.clock50MHz(clock50MHz),
		.inReset(~inReset),
		.signal(vSync),
		.displaySignal(vSignal)
	);
	
	vga_displayMux display (
		.select(hSignal & vSignal),
		.inRed(redCount),
		.inGreen(greenCount),
		.inBlue(blueCount),
		.outRed(outRed),
		.outGreen(outGreen),
		.outBlue(outBlue)
	);

endmodule