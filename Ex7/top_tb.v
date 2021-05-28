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
    reg [23:0] rgb;
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
		if (sel==1 && light!=rgb)
			begin
			$display("***TEST FAILED! :( sel= %d light=%d rgb=%d ",sel,light,rgb);
			err=1;
			end
		if (sel==0 && light!=24'hFFFFFF)
			begin
			$display("***TEST FAILED! :( sel= %d light=%d rgb=%d ",sel,light,rgb);
			err=1;
			end
			
		
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
    selector top(
     .clk (clk),
     .sel (sel),
     .rst (rst),
     .button (button),
     .rgb (rgb),
     .light (light)
     );
     
endmodule
