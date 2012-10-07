//===============================================//
module imem ( input [29:0] ADDR, 
              output[31:0] RD );
                
logic [31:0] RAM[0:63];

initial
  $readmemh ("soft/program.txt", RAM);

assign RD = RAM[ADDR];

endmodule
//===============================================//

//===============================================//
module dmem ( input        CLK,
              input        WE,
              input [ 3:0] BE,    
              input [29:0] ADDR, 
              input [31:0] WD,
              output[31:0] RD );
                
logic [3:0][7:0] RAM[0:63];

initial
  $readmemh ("soft/data.txt", RAM);

assign RD = RAM[ADDR];

always_ff@(posedge CLK)
  if (WE) 
    begin
    if(BE[0]) RAM[ADDR][0] <= WD[07:00];
    if(BE[1]) RAM[ADDR][1] <= WD[15:08];
    if(BE[2]) RAM[ADDR][2] <= WD[23:16];
    if(BE[3]) RAM[ADDR][3] <= WD[31:24];
    end
    
endmodule
//===============================================//
