//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10; // set clock period

    //Registers and wires
    reg clk;
    reg rst;
    reg button;
    reg [2:0]colour_prev;
    wire [2:0]colour;
    reg err;

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
       colour_prev=0;
       err=0;
       button=1;
       #5
       forever begin
	 if (rst==1)
	 begin
	 $display("***TEST FAILED! colour should be 0 when rst is 1");
	 err=1;
	 end
	 
	 if (colour_prev==0 || colour_prev==7 && colour!=1)
         begin
         $display("***TEST FAILED! colour is not 1 when  colour was is 0 or 7!");
         err=1;
         #6;
         end
	 else
	 	if (button==0 && colour!=colour_prev)
	   	begin
           	$display("***TEST FAILED! when button is not pressed LED colour still changes!");
           	err=1;
	   	end
		else // i.e button == 1
			if (colour_prev==6 && colour!=1)
			begin
			$display("***TEST FAILED! colour does not change to 001 from 110!");
			err=1;
			end
			else 
			     if (colour!=colour_prev+1)
			     begin
			     $display("***TEST FAILED! when colour doesn't increase by 1!");
				err=1;
			      end
	    
	 colour_prev=colour;
         //counter_out=counter_out+1;
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
	LED top(
	     .rst (rst),
	     .button (button),
	     .colour (colour)
	     );
 
endmodule
