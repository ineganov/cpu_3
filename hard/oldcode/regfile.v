module regfile(	input           CLK,
				        input   [4:0]   RD_ADDR_1, 
				        input   [4:0]   RD_ADDR_2, 
				        input   [4:0]   WR_ADDR_3,
				        input   [31:0]  W_DATA,
				        input           WE,
				        output  [31:0]  R_DATA_1,
				        output  [31:0]  R_DATA_2);

reg [31:0] rf[31:0];

reg [31:0] rd1, rd2;

/*
assign R_DATA_1 = (RD_ADDR_1 == 0)         ? 0      :
                  (WR_ADDR_3 == RD_ADDR_1) ? W_DATA :
                  rf[RD_ADDR_1];

assign R_DATA_2 = (RD_ADDR_2 == 0)         ? 0      :
                  (WR_ADDR_3 == RD_ADDR_2) ? W_DATA :
                  rf[RD_ADDR_2];
*/

assign R_DATA_1 = rd1;
assign R_DATA_2 = rd2;
                  
always@(*)
  begin
  if(WE)
    begin
      if      (RD_ADDR_1 == 0)          rd1 = 0;
      else if (RD_ADDR_1 == WR_ADDR_3)  rd1 = W_DATA;
      else                              rd1 = rf[RD_ADDR_1];
    end
  else
    begin
      if      (RD_ADDR_1 == 0)          rd1 = 0;
      else                              rd1 = rf[RD_ADDR_1];
    end
  end

always@(*)
  begin
  if(WE)
    begin
      if      (RD_ADDR_2 == 0)          rd2 = 0;
      else if (RD_ADDR_2 == WR_ADDR_3)  rd2 = W_DATA;
      else                              rd2 = rf[RD_ADDR_2];
    end
  else
    begin
      if      (RD_ADDR_2 == 0)          rd2 = 0;
      else                              rd2 = rf[RD_ADDR_2];
    end
  end


always @ (posedge CLK)
	if (WE) rf[WR_ADDR_3] <= W_DATA;

endmodule
