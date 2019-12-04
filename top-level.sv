/*

	Top-level module for the design project

*/

module top-level
		(input clock50MHz);

	NesReader NesReader1 (
		.dataYellow(),
		.clock(),
		.reset_n(),
		.latchOrange(),
		.clockRed(),
		.up(),
		.down(),
		.left(),
		.right(),
		.start(),
		.select(),
		.a(),
		.b()
	);
		
	vgaOutput vgaOutput1 (
		.clock50MHz(clock50MHz),
		.inReset(),
		.redSwitch1(),
		.redSwitch2(),
		.greenSwitch1(),
		.greenSwitch2(),
		.blueSwitch1(),
		.blueSwitch2(),
		.hsync(),
		.vsync(),
		.outRed(),
		.outGreen(),
		.outBlue()
	);

endmodule