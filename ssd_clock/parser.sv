module parser #(N = 8)
               (input logic [N-1:0]     value,
					 output logic [3:0] ones, tens);
	
	 assign ones = value % 4'd10;				
	 assign tens = (value - ones) / 4'd10;
					
endmodule 