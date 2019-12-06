module periodTime(input logic clk,
					input logic [9:0] data,
					output logic q);
			
int compareNumber;
int count;

always_ff @(negedge q)
	begin
		compareNumber = (data + 100)*(10/7);
		if (count >= compareNumber)
		count <= 0;
	end

always_ff @(posedge clk)
	begin
			count <= count +1;
	end

always_comb
	begin
			if( count < compareNumber)				
				q = (count > compareNumber/2); 	//assigns output duty cycle 50% with initial low
			else 
				q = 0;
	end

endmodule