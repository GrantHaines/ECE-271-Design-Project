module sync(input logic  clk,
            input logic    d,
			   output logic   q);


	logic n;
	
	always_ff@(posedge clk) 
	   begin
	   
		   n <= d;
		   q <= n;
		
	   end
	   

endmodule 