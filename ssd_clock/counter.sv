module counter(input logic [5:0]           init,
               input logic            en, reset,
					input logic                  clk,
					output logic [5:0]         count);
					
   always_ff@(posedge clk, posedge reset)
	   if(reset) count <= 0;
		else if(en) count <= count + 1;
		else count <= init;



endmodule 