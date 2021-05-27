//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk;
    reg colour[2:0];
    reg enable;
    reg err;
    wire rgb[23:0];
    
    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
	colour=0;
	
	forever begin
		#(CLK_PERIOD)
		if (colour==0)
			if (rgb!=24'h000000)
			$display("***TEST FAILED! :( ***");
			err=1;
		#(CLK_PERIOD)
		if (colour==1)
			if (rgb!=24'h0000FF)
			$display("***TEST FAILED! :( ***");
			err=1;
		#(CLK_PERIOD)
		if (colour==2)
			if (rgb!=24'h00FF00)
			$display("***TEST FAILED! :( ***");
			err=1;
		#(CLK_PERIOD)
		if (colour==3)
			if (rgb!=24'h0000FF)
			$display("***TEST FAILED! :( ***");
			err=1;
		#(CLK_PERIOD)
		if (colour==4)
			if (rgb!=24'hFF0000)
			$display("***TEST FAILED! :( ***");
			err=1;
		#(CLK_PERIOD)
		if (colour==5)
			if (rgb!=24'hFF00FF)
			$display("***TEST FAILED! :( ***");
			err=1;
		#(CLK_PERIOD)
		if (colour==6)
			if (rgb!=24'hFFFF00)
			$display("***TEST FAILED! :( ***");
			err=1;
		#(CLK_PERIOD)
		if (colour==1)
			if (rgb!=24'hFFFFFF)
			$display("***TEST FAILED! :( ***");
			err=1;
		
		colour = colour+1;
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
