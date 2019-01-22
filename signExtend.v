
module signExtend(ExtOp, dataIn, dataOut);
	input ExtOp;
	input [15:0] dataIn;
	output [31:0] dataOut;

wire flag;
wire [15:0] tmpOut;
wire [15:0] zeros;
wire [15:0] ones;
// initialize choices of extension
assign zeros = 16'h0000;
assign ones = 16'hFFFF;

and_gate and_0 (.x(ExtOp), .y(dataIn[15]), .z(flag));
mux_n #(.n(16)) mux_0 (.sel(flag), .src0(zeros), .src1(ones), .z(tmpOut));


assign dataOut ={tmpOut, dataIn};

endmodule
