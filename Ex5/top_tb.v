//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk;
    reg [4:0] temp;
    //reg [4:0] temp_prev;
    reg err;
    wire h;
    wire c;
    
    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
	temp<=15;
        err<=0;
       #(CLK_PERIOD)
       forever begin
         #(CLK_PERIOD)
	 if (h==1 && c==1)
         begin
           $display("***TEST FAILED! both heating and cooling are on");
           err=1;
         end
	 if (h==1 && temp>=20)
         begin
           $display("***TEST FAILED! heating is still on when temp is greater than 20");
           err=1;
         end
         if (c==1 && temp<=20)
           begin
           $display("***TEST FAILED! cooling is still on when temp is less than 20");
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
    AC top(
     .temp (temp),
     .clk (clk),
     .h (h),
     .c (c)
     );
     
endmodule
