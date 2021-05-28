//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk;
    reg sel;
    reg button;
    reg rst;
    reg err;
    wire [23:0] light;
    
    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
	err=0;
	rst=0;
	button=1;
	sel=1;
	#100
	rst=1;
	forever begin
		#(CLK_PERIOD*2);
		
	end
     end
				
      //Finish simulation and check for success
      initial begin
        #(CLK_PERIOD*50) 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

    //User's module
    converter top(
     .clk (clk),
     .colour (colour),
     .enable (enable),
     .rgb (rgb)
     );
     
endmodule
