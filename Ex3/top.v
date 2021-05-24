//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If event=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (
    //ports
    input clk;
    input rst;
    input change;
    input on_off;
    output reg[7:0] counter_out; 
    );
                    
    //registers and wires, if needed
    reg rst, clk, change, on_off, counter_out;
    wire out;
    
    //Todo: add user logic
    always @(posedge clk)
    begin
    if (rst == 1)
	counter_out = 0;
    else 
	if (change == 0)
	counter_out = counter_out;
	else
    		if (on_off == 0)
			counter_out = counter_out - 1;
    		else //i.e if on_off == 1
			counter_out = counter_out + 1;
    end

    
      
endmodule
