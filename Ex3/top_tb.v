//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10; // set clock period

    //Registers and wires
    reg clk;
    reg change;
    reg on_off;
    reg rst;
    reg err;
    wire out;

    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
    initial begin
       rst=0;
       counter_out_prev=counter_out;
       err=0;
       change=0;
       counter_out=0;
       on_off=0;
       #5
       forever begin
	 if (rst==1 & counter_out!=0)
         begin
           $display("***TEST FAILED! counter is not 0 when rst is 1! a=%d);
           err=1;
         end
         #6
	 if (change==0 & counter_out_prev!=counter_out)
         begin
           $display("***TEST FAILED! when change is 0 counter still changes!);
           err=1;
         end
	 counter_out_prev=counter_out;
         counter_out=counter_out+1;
         if (ab==0)
           sel=~sel;
       end
     end

//Todo: Finish test, check for success
    initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end	
//Todo: Instantiate counter module
 
endmodule 
