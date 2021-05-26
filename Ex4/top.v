//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
module LED (
    //ports
    input clk,
    input rst,
    input button,
    output reg[2:0] colour 
);
// wire
    wire out;

//logic
    always @(posedge clk)
    begin
    if (rst==1)
	colour<=0; 
    if (rst==0)
	if (button == 0 && (colour==7 || colour==0))
		colour<=1;
	else
	if (button == 1)
		if (colour==6 || colour==7)
			colour<=1;
		else
			colour <= colour+1;
		//if (colour < 6)
			//colour<=colour + 1;
		//else
			//colour<=1;
    	else 
		colour <= colour;
	
    end

endmodule

