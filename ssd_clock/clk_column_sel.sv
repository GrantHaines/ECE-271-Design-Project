module clk_column_sel(input logic left, right,
                      input logic reset,
                      output logic [1:0] state);
							 
							 
   logic [1:0] nextstate;
	
	assign nextstate[0] = (~state[1] & ~state[0] & left & ~right) | (state[1] & ~state[0] & ~left & right);
	assign nextstate[1] = (~state[1] & ~state[0] & ~left & right) | (~state[1] & state[0] & left & ~right);
	
	
	always_ff@(posedge left, posedge right, posedge reset)
	   if(reset) state <= 0;
		else state <= nextstate;
	   

   


endmodule 