module registers_tb;

    reg writeEnable, clk,init;
	reg [4:0] readReg1, readReg2, writeReg;
	reg [31:0] writeData;
	wire [31:0] readData1, readData2;
	wire [31:0] r2;
	wire [31:0] r3;
	wire [31:0] r4;
	wire [31:0] r5;
	wire [31:0] r6;
	wire [31:0] r7;
	registers reg_0 (.clk(clk),.init(init), .writeEnable(writeEnable), .readReg1(readReg1), .readReg2(readReg2), .writeReg(writeReg),
		.writeData(writeData), .readData1(readData1), .readData2(readData2),.r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7));
initial
      begin
		#10
	    clk = 1'b1;
        init = 1'b1;
		readReg1=5'b0;
		readReg2=5'b1;
	#2
	init = 1'b0;
        end
	always
		#10
		clk = !clk;

endmodule
