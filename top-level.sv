/*

	Top-level module for the design project

*/

module top-level
		(input clock50MHz,
		 input NESDataYellow,
		 output vgaHsync, vgaVsync,
		 output vgaOutRed, vgaOutGreen, vgaOutBlue);

	NesReader NesReader1 (
		.dataYellow(NESDataYellow),
		.clock(clock50MHz),
		.reset_n(),
		.latchOrange(),
		.clockRed(),
		.up(NESUp),
		.down(NESDown),
		.left(NESLeft),
		.right(NESRight),
		.start(NESStart),
		.select(NESSelect),
		.a(NESA),
		.b(NESB)
	);

	vgaOutput vgaOutput1 (
		.clock50MHz(clock50MHz),
		.inReset(NESStart),
		.inRed(NESUp),
		.inGreen(NESLeft),
		.inBlue(NESRight),
		.hSync(vgaVsync),
		.vSync(vgaHsync),
		.outRed(vgaOutRed),
		.outGreen(vgaOutGreen),
		.outBlue(vgaOutBlue)
	);

endmodule