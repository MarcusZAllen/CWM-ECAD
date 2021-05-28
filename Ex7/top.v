//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

module selector(
	input clk,
	input sel,
	input rst,
	input button,
	output [23:0] light
);

//logic
	wire [2:0] colour;
	wire [23:0] rgb;

    	assign light = sel?  {rgb}:
		24'hFFFFFF;

LED LED_0(clk,rst,button,colour);

converter rgb_converter (clk,!rst,colour,rgb);

endmodule
