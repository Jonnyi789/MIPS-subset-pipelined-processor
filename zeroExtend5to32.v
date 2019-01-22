module zeroExtend5to32(dataIn, dataOut);
	input [4:0] dataIn;
	output [31:0] dataOut;

assign dataOut ={27'b000000000000000000000000000, dataIn};

endmodule
