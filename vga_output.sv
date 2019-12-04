/*

	VGA output module

*/

module vgaOutput
		(input clock50MHz,
		 input inReset,
		 input redSwitch1, redSwitch2,
		 input greenSwitch1, greenSwitch2,
		 input blueSwitch1, blueSwitch2,
		 output hSync,
		 output vSync,
		 output [3:0] outRed, outGreen, outBlue);
	
	logic [3:0] inRed, inGreen, inBlue;
	
	assign inRed[3:2] = {2{redSwitch1}};
	assign inRed[1:0] = {2{redSwitch2}};
	
	assign inGreen[3:2] = {2{greenSwitch1}};
	assign inGreen[1:0] = {2{greenSwitch2}};
	
	assign inBlue[3:2] = {2{blueSwitch1}};
	assign inBlue[1:0] = {2{blueSwitch2}};
		 
	clockmod clockDivider(
		.clock50MHz(clock50MHz),
		.inReset(~inReset),
		.outClock(clock25MHz)
	);
	
	hCounterComp #(.a(10'd96), .b(10'd48), .c(10'd640), .d(10'd16)) hSyncCounter (
		.inClock(clock25MHz),
		.clock50MHz(clock50MHz),
		.inReset(~inReset),
		.signal(hSync),
		.displaySignal(hSignal)
	);
	
	clockmod syncDivider(
		.clock50MHz(hSync),
		.inReset(~inReset),
		.outClock(hClock)
	); 
	
	vCounterComp #(.a(10'd2), .b(10'd33), .c(10'd480), .d(10'd10)) vSyncCounter (
		.inClock(hClock),
		.clock50MHz(clock50MHz),
		.inReset(~inReset),
		.signal(vSync),
		.displaySignal(vSignal)
	);
	
	displayMux display (
		.select(hSignal & vSignal),
		.inRed(inRed),
		.inGreen(inGreen),
		.inBlue(inBlue),
		.outRed(outRed),
		.outGreen(outGreen),
		.outBlue(outBlue)
	);

endmodule