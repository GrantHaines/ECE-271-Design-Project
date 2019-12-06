module clock_set(input logic start, up, down, left, right,
                 input logic [5:0] h_curr, m_curr, s_curr,
                 input logic clk_50MHz,
					  output logic edit_en, h_en, m_en, s_en,
					  output logic [5:0] hours, minutes, seconds,
					  output logic clk_2Hz);
					  
   
	logic [1:0] state_sel;

	
	
	clk_divider clk50M_to_2(
	
      .cap       (26'd12499999),
		.clk_in       (clk_50MHz),
		.reset            (start),
		.en             (edit_en),
		.clk_out        (clk_2Hz)
	
	);
	
	
	clk_column_sel clk_nav(
	   .left      (left),
		.right     (right),
		.reset      (start),
		.state    (state_sel)
	
	);
	
	
	
	assign s_en = edit_en & (~state_sel[0] & ~state_sel[1]);
	assign m_en = edit_en & state_sel[0];
	assign h_en = edit_en & state_sel[1];
	
	
	updowncounter s_count(
	
      .up             (up),
		.down         (down),
	   .en           (s_en),
		.clk_in    (clk_2Hz),
	   .reset       (start),
		.cap         (6'd59),
		.init       (s_curr),
		.count     (seconds)
	
	);
	
	updowncounter m_count(
	
      .up             (up),
		.down         (down),
	   .en           (m_en),
		.clk_in    (clk_2Hz),
	   .reset       (start),
		.cap         (6'd59),
		.init       (m_curr),
		.count     (minutes)
	
	);
	
	updowncounter h_count(
	
      .up             (up),
		.down         (down),
	   .en           (h_en),
		.clk_in    (clk_2Hz),
	   .reset       (start),
		.cap         (6'd11),
		.init       (h_curr),
		.count       (hours)
	
	);
	
	
	
					  
   

					  
   always_ff@(posedge start)
      if(edit_en) edit_en <= 0;
	   else edit_en <= 1;	
					  


endmodule 