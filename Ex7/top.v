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

LED top1 (
  .clk      ( clk  ), // clk
  .rst      ( rst  ), // input 
  .button   (button), // input  
  .colour   (colour)  // output [2:0]
);

converter top2 (
  .clk      ( clk  ), // input
  .enable   (enable), // input 
  .colour   (colour), // input  [2:0]
  .rgb      ( rgb  )  // output [23:0]
);

multiplexer top3 (
  .rgb      ( rgb  ), // input [23:0]
  .sel      ( sel  ), // input 
  .light  ( data_temp )  // output [23:0]
);

endmodule
