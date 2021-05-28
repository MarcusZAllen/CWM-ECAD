
module converter(
	input wire clk,
	input wire [2:0] colour,
	input wire enable,
	output wire [23:0] rgb
);
blk_mem_gen_0 top1(
  .clka(clk),    // input wire clka
  .ena(enable),      // input wire ena
  .wea(1'b0),      // input wire [0 : 0] wea
  .addra(colour),  // input wire [2 : 0] addra
  .dina(24'h0),    // input wire [23 : 0] dina
  .douta(rgb)  // output wire [23 : 0] douta
);

endmodule