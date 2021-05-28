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
    reg [2:0] colour;
    reg enable;
    reg err;
    wire [23:0] rgb;
    
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
	err=0;
	enable=0;
	#100
	enable=1;
	forever begin
		#(CLK_PERIOD*2)
		$display("colour=%d and rgb=%d enable=%d", colour, rgb,enable);
		if (colour==0 && rgb!=24'h000000)
		 begin
		 $display("***TEST FAILED! :( colour=%d and rgb=%d***", colour, rgb);
		 err=1;
		 end
		if (colour==1 && rgb!=24'h0000FF)
		 begin
		 $display("***TEST FAILED! :( colour=%d and rgb=%d***", colour, rgb);
		 err=1;
		 end
		if (colour==2 && rgb!=24'h00FF00)
		 begin
		 $display("***TEST FAILED! :( colour=%d and rgb=%d***", colour, rgb);
		 err=1;
		 end
		if (colour==3 && rgb!=24'h00FFFF)
		 begin
		 $display("***TEST FAILED! :( colour=%d and rgb=%d***", colour, rgb);
		 err=1;
		 end
		if (colour==4 && rgb!=24'hFF0000)
		 begin
		 $display("***TEST FAILED! :( colour=%d and rgb=%d***", colour, rgb);
		 err=1;
		 end
		if (colour==5 && rgb!=24'hFF00FF)
		 begin
		 $display("***TEST FAILED! :( colour=%d and rgb=%d***", colour, rgb);
		 err=1;
		 end
		if (colour==6 && rgb!=24'hFFFF00)
		 begin
		 $display("***TEST FAILED! :( colour=%d and rgb=%d***", colour, rgb);
		 err=1;
		 end
		if (colour==7 && rgb!=24'hFFFFFF)
		 begin
		 $display("***TEST FAILED! :( colour=%d and rgb=%d***", colour, rgb);
		 err=1;
		 end
		
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
