
module AC (
    //ports
    input clk,
    input [4:0] temp,
    output reg h,
    output reg c 
);
// wire
    wire out;

//logic
always @(posedge clk)
    	begin
	if (temp<=18)
		c=0;
		h=1;
	if (temp>=22)
		h=0;
		c=1;
	if (h==1 && temp>=20)
		h=0;
	if (c==1 && temp<=20)
		c=0;
	end

endmodule
