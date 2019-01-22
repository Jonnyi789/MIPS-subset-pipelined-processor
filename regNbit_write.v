module regNbit_write(clk, writeEnable, din, orgData, pos);
	parameter n;
	input clk, writeEnable;
	input [n-1:0] din;
	input [n-1:0] orgData;
	output [n-1:0] pos;



wire [n-1:0] final_data;
mux_n #(.n(n)) mux_0 (.sel(writeEnable), .src0(orgData), .src1(din), .z(final_data));

generate
genvar i;
for (i = 0; i < n; i = i+1)
	begin
	dff dff_0 (.clk(clk), .d(final_data[i]), .q(pos[i]));
	end
endgenerate

endmodule
