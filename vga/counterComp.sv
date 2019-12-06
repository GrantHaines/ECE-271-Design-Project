/*
Inputs: A 25MHz clock signal, a 50MHz clock signal, and a reset signal.
Outputs: The horizontal sync rate for the VGA output and a signal
indicating that it is in the display area for the screen.

Description: The hCounterComp creates the hSync signal for the VGA driver,
as well as indicating that the signal is within the display area so that
the RGB values can be communicated to the screen. The hSync signal travels
through the horizontal row of pixels on the screen, displaying color when
appropriate.
*/

module vga_hCounterComp #(parameter a = 10, b = 10, c = 10, d = 10)
		(input inClock,
		 input clock50MHz,
		 input inReset,
		 output signal,
		 output displaySignal);
		 
	logic [9:0] currentCount;

	vga_counter #(.N(10)) count1 (
		.clk(inClock),
		.reset(cntReset | inReset),
		.q(currentCount)
	);
	
	vga_comparator #(.N(10)) aTob (
		.a(currentCount),
		.b(a),
		.gte(signal)
	);
	
	vga_comparator #(.N(10)) bToc (
		.a(currentCount),
		.b(a + b),
		.gte(disp1)
	);
	
	vga_comparator #(.N(10)) cToD (
		.a(currentCount),
		.b(a + b + c),
		.lt(disp2)
	);
	
	vga_comparator #(.N(10)) reset (
		.a(currentCount),
		.b(a + b + c + d),
		.eq(compSignal)
	);
	
	vga_synchronizer sync1 (
		.clk(clock50MHz),
		.d(compSignal),
		.q(cntReset)
	);
	
	assign displaySignal = disp1 & disp2;

endmodule

/*
Inputs: The hSync signal as a clock, a 50MHz clock signal, and a reset signal.
Outputs: The vertical sync rate for the VGA output and a signal
indicating that it is in the display area for the screen.

Description: The vCounterComp module generatese the vSync signal for the VGA
driver, which tells it when to move on to the next row of pixels, as well
as telling it when it is within the displayable area.
*/

module vga_vCounterComp #(parameter a = 10, b = 10, c = 10, d = 10)
		(input inClock,
		 input clock50MHz,
		 input inReset,
		 output signal,
		 output displaySignal);
		 
	logic [9:0] currentCount;

	vga_counter #(.N(10)) count1 (
		.clk(inClock),
		.reset(cntReset | inReset),
		.q(currentCount)
	);
	
	vga_comparator #(.N(10)) aTob (
		.a(currentCount),
		.b(a),
		.gte(signal)
	);
	
	vga_comparator #(.N(10)) bToc (
		.a(currentCount),
		.b(a + b),
		.gte(disp1)
	);
	
	vga_comparator #(.N(10)) cToD (
		.a(currentCount),
		.b(a + b + c),
		.lt(disp2)
	);
	
	vga_comparator #(.N(10)) reset (
		.a(currentCount),
		.b(a + b + c + d),
		.eq(compSignal)
	);
	
	vga_synchronizer sync1 (
		.clk(clock50MHz),
		.d(compSignal),
		.q(cntReset)
	);
	
	assign displaySignal = disp1 & disp2;

endmodule