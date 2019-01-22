module RegFile_tb;
    
    reg clk;
    reg init;
    reg [31:0] writeData;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;
    wire [31:0] busA;
    wire [31:0] busB;
	wire [31:0] r2;
	wire [31:0] r3;
	wire [31:0] r4;
	wire [31:0] r5;
	wire [31:0] r6;
	wire [31:0] r7;
    
	RegFile reg_0 (.clk(clk), .arst(init), .aload(1'b0), .busW(32'b1), .RegWr(1'b1), .RegDst(1'b1), .Rs(rs), .Rt(rt), .Rd(rd), .busA(busA), .busB(busB), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7));

	
    initial
      begin
		#10
	    clk = 1'b1;
        init = 1'b1;
		rs=5'b0;
		rt=5'b11;
		rd=5'b11;
	#2
	init = 1'b0;
        end
	always
		#10
		clk = !clk;

endmodule
