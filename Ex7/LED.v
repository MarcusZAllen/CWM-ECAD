
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
