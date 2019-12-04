
module hCounterComp #(parameter a = 10, b = 10, c = 10, d = 10)
		(input inClock,
		 input clock50MHz,
		 input inReset,
		 output signal,
		 output displaySignal);
		 
	logic [9:0] currentCount;

	counter #(.N(10)) count1 (
		.clk(inClock),
		.reset(cntReset | inReset),
		.q(currentCount)
	);
	
	comparator #(.N(10)) aTob (
		.a(currentCount),
		.b(a),
		.gte(signal)
	);
	
	comparator #(.N(10)) bToc (
		.a(currentCount),
		.b(a + b),
		.gte(disp1)
	);
	
	comparator #(.N(10)) cToD (
		.a(currentCount),
		.b(a + b + c),
		.lt(disp2)
	);
	
	comparator #(.N(10)) reset (
		.a(currentCount),
		.b(a + b + c + d),
		.eq(compSignal)
	);
	
	synchronizer sync1 (
		.clk(clock50MHz),
		.d(compSignal),
		.q(cntReset)
	);
	
	assign displaySignal = disp1 & disp2;

endmodule


module vCounterComp #(parameter a = 10, b = 10, c = 10, d = 10)
		(input inClock,
		 input clock50MHz,
		 input inReset,
		 output signal,
		 output displaySignal);
		 
	logic [9:0] currentCount;

	counter #(.N(10)) count1 (
		.clk(inClock),
		.reset(cntReset | inReset),
		.q(currentCount)
	);
	
	comparator #(.N(10)) aTob (
		.a(currentCount),
		.b(a),
		.gte(signal)
	);
	
	comparator #(.N(10)) bToc (
		.a(currentCount),
		.b(a + b),
		.gte(disp1)
	);
	
	comparator #(.N(10)) cToD (
		.a(currentCount),
		.b(a + b + c),
		.lt(disp2)
	);
	
	comparator #(.N(10)) reset (
		.a(currentCount),
		.b(a + b + c + d),
		.eq(compSignal)
	);
	
	synchronizer sync1 (
		.clk(clock50MHz),
		.d(compSignal),
		.q(cntReset)
	);
	
	assign displaySignal = disp1 & disp2;

endmodule