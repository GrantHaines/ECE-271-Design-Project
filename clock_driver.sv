module clock_driver(input logic clk_50MHz,
                    input logic start, up, down, left, right,
                    input logic reset,
						  input logic en,
						  output logic [6:0] Seg0, Seg1, Seg2, Seg3, Seg4, Seg5);
						
	logic edit_en, s_en, m_en, h_en;
	
	logic clk_2Hz;
	
	logic [6:0] s_seg_ones, s_seg_tens, m_seg_ones, m_seg_tens, h_seg_ones, h_seg_tens;
	logic [5:0] clk_hours, clk_minutes, clk_seconds, hinit, minit, sinit;
	logic [3:0] sec_ones, sec_tens, min_ones, min_tens, h_ones, h_tens;
	
	clock clk (
	   
		.hinit              (hinit),
		.minit              (minit),
		.sinit              (sinit),
		.en                    (en),
		.set              (start),
		.reset              (reset),
		.clk_50MHz      (clk_50MHz),
		.hours          (clk_hours),
		.minutes      (clk_minutes),
		.seconds      (clk_seconds)
	
	);
	
	clock_set clk_set (
	   
		.start                    (start),	
		.up                          (up),        
		.down                      (down),
		.left                      (left), 
		.right                    (right),
      .h_curr               (clk_hours), 
		.m_curr             (clk_minutes), 
		.s_curr             (clk_seconds),       
      .clk_50MHz            (clk_50MHz),
		.edit_en                (edit_en), 
		.h_en                      (h_en), 
		.m_en                      (m_en), 
		.s_en                      (s_en),
		.hours                    (hinit), 
		.minutes                  (minit), 
		.seconds                  (sinit),
		.clk_2Hz                (clk_2Hz)
	
	);
	
	
	
	parser #(6) parse_seconds(
	   
		.value    (edit_en ? sinit : clk_seconds),
	   .ones                          (sec_ones),
		.tens                          (sec_tens)  
	
	);
	
	seven_seg_driver disp_sec_ones(
	
	   .data         (sec_ones),
		.segments    (s_seg_ones)
	
	);
	
	assign Seg0 = (s_en & clk_2Hz) ? 1 : s_seg_ones; 
	
	seven_seg_driver disp_sec_tens(
	
	   .data         (sec_tens),
		.segments   (s_seg_tens)
	
	);
	
	assign Seg1 =  (s_en & clk_2Hz) ? 1 : s_seg_tens;  
	
	parser #(6) parse_minutes(
	   
		.value    (edit_en ? minit : clk_minutes),
	   .ones                      (min_ones),
		.tens                      (min_tens)
	
	);
	
	
	seven_seg_driver disp_min_ones(
	
	   .data             (min_ones),
		.segments       (m_seg_ones)
	
	);
	
	assign Seg2 = (m_en & clk_2Hz) ? 1 : m_seg_ones; 
	
	seven_seg_driver disp_min_tens(
	
	   .data             (min_tens),
		.segments       (m_seg_tens)
	
	);
	
	assign Seg3 =  (m_en & clk_2Hz) ? 1 : m_seg_tens; 
	
	parser #(6) parse_hours(
	   
		.value  (edit_en ? hinit + 1 : clk_hours + 1),
	   .ones                            (h_ones),
		.tens                            (h_tens)
	
	);
	
	seven_seg_driver disp_h_ones(
	
	   .data               (h_ones),
		.segments       (h_seg_ones)
	
	);
	
	assign Seg4 = (h_en & clk_2Hz) ? 1 : h_seg_ones; 
	
	seven_seg_driver disp_h_tens(
	
	   .data               (h_tens),
		.segments       (h_seg_tens)
	
	);
	
	assign Seg5 =  (h_en & clk_2Hz) ? 1 : h_seg_tens; 
	 

endmodule 