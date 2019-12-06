module updowncounter(input logic     up, down,
					      input logic           en,
					      input logic       clk_in,
					      input logic        reset,
							input logic [5:0]    cap,init,
					      output logic [5:0] count);
							
   always_ff@(posedge clk_in, posedge reset)
	   if(reset) count <= init;
		else if(count < 1 & down & en) count <= cap;
		else if(count == cap & up & en) count <= 0;
		else if(en & up) count <= count + 1;
		else if(en & down) count <= count - 1;
						 
   
	

endmodule 