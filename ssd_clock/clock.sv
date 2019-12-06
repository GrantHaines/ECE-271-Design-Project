module clock(input logic      [5:0] hinit, minit, sinit,
             input logic                 en, set, reset,
				 input logic                      clk_50MHz,
				 output logic [5:0] hours, minutes, seconds);
   
	logic clk_1Hz, clk_seconds, clk_minutes;
	
	
	clk_divider clk50M_to_1(
	
      .cap       (26'd24999999),
		.clk_in       (clk_50MHz),
		.reset            (reset),
		.en                  (en),
		.clk_out        (clk_1Hz)
	
	);
	
	clk_counter seconds_counter(
	
	   .init             (sinit),
	   .clk_in          (clk_1Hz),
		.clk_50MHz     (clk_50MHz),
		.cap               (6'd59),
		.reset             (reset),
		.set                 (set),
		.value           (seconds),
		.clk_out     (clk_seconds)
	
	);
	
	clk_counter minutes_counter(
	
	   .init              (minit),
	   .clk_in      (clk_seconds),
		.clk_50MHz     (clk_50MHz),
		.cap               (6'd59),
		.reset             (reset),
		.set                 (set),
		.value           (minutes),
		.clk_out     (clk_minutes)
	
	);

   clk_counter hours_counter(
	
	   .init              (hinit),
	   .clk_in      (clk_minutes),
		.clk_50MHz     (clk_50MHz),
		.cap               (6'd11),
		.reset             (reset),
		.set                 (set),
		.value             (hours)
	
	);

endmodule 