module reg32bit_write(clk, writeEnable, din, orgData, pos);
	input clk, writeEnable;
	input [31:0] din;
	input [31:0] orgData;
	output [31:0] pos;



wire [31:0] final_data;
mux_32 mux_0 (.sel(writeEnable), .src0(orgData), .src1(din), .z(final_data));

generate
genvar i;
for (i = 0; i < 32; i = i+1)
	begin
	dff dff_0 (.clk(clk), .d(final_data[i]), .q(pos[i]));
	end
endgenerate

endmodule
