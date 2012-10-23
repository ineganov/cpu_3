module testbench;
  
  
reg CLK = 0;
reg CLK_MEM = 0;
reg RESET = 1;

//clock generation
always
  begin
  CLK = ~CLK;
  #10ns;
  end 

always@ (posedge CLK)
  begin
  #6.66ns;
  CLK_MEM = 1;  
  end
  
always@ (negedge CLK)
  begin
  #6.66ns;
  CLK_MEM = 0;  
  end

//end clock generation
  
initial
  begin
  RESET = 1;
  repeat(2)
    @(posedge CLK) #10;
  RESET = 0; 
  end  

wire DATA_WE;
wire [3:0] DATA_BE;
wire [29:0] DATA_ADDR, INST_ADDR;
wire [31:0] DATA_WD, INST_RD, DATA_RD, INST_P2_RD;

imem imem(   .CLK     ( CLK_MEM    ),
             
             .DATA_A  ( 30'd0      ),
             .DATA_WE ( 1'b0       ),
             .DATA_WD ( 32'd0      ),
             .DATA_RD ( INST_P2_RD ),
              
             .MAIN_A  ( INST_ADDR  ), 
             .MAIN_RD ( INST_RD    )); 

dmem dmem( .CLK  ( CLK_MEM  ),
           .BE   ( DATA_BE  ),
           .WE   ( DATA_WE  ),    
           .ADDR ( DATA_ADDR), 
           .WD   ( DATA_WD  ),
           .RD   ( DATA_RD  ));
                
mcpu uut_mcpu(.CLK       ( CLK       ),
              .CLK_MEM   ( CLK_MEM   ),
              .RESET     ( RESET     ),
              .RUN       ( 1'b1      ),
              
              //External inst memory iface
              .INST_ADDR ( INST_ADDR ),
              .INST_RD   ( INST_RD   ),
                 
              //External data memory iface
              .DATA_WE   ( DATA_WE   ),
              .DATA_BE   ( DATA_BE   ),
              .DATA_ADDR ( DATA_ADDR ),
              .DATA_WD   ( DATA_WD   ),
              .DATA_RD   ( DATA_RD   ));
               
endmodule
