module clk_divider(input logic     clk_in,
                   input logic [25:0] cap,
					    input logic  reset, en,
						 output logic   clk_out);
   							
	logic [25:0] count;						
   
	
	always_ff@(posedge clk_in, posedge reset)
	   if(reset) 
		   begin
			   clk_out <= 0;
				count <= 0;
			   
			end
		else if(count > cap)
		   begin
			   clk_out <= ~clk_out;
				count <= 0;
			
			end
      else if(en) count <= count + 1;
	
    

endmodule 