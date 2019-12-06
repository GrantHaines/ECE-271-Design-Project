module clk_counter(input logic [5:0]          init, cap,
                   input logic               set, reset,
						 input logic        clk_in, clk_50MHz,
						 output logic [5:0]             value,
						 output logic                 clk_out);

   logic gt;
	
	counter clk_count(
	   
		.init                (init),
		.en                  (~set),
		.reset    (reset | clk_out),
		.clk         (clk_in | set),
		.count              (value)
	
	);
	
	
	comp comparator(
	   
		.a    (value),   
		.b      (cap),
		.gt      (gt)
	
	);
	

	sync synchronizer(
	
	   .clk  (clk_50MHz),
		.d           (gt),
		.q      (clk_out)
	
	);
	

endmodule 