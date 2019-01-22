module PipelinedProc_tb;
	reg clk;
	reg initPC;
	reg initPC2;
	wire [31:0] nextPC, regPC,PCplus4_1;
	wire [31:0] inst;
	wire [31:0] writeData, readData1, readData2;
	wire [31:0] r2;
	wire [31:0] r3;
	wire [31:0] r4;
	wire [31:0] r5;
	wire [31:0] r6;
	wire [31:0] r7;
	wire [5:0] opcode;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [4:0] shamt;
	wire [5:0] funct;
	wire [15:0] immed;
	
  wire [31:0] ALUinA;
  wire [31:0] ALUinB;
  wire [3:0] ALUctrl;
  wire carryout;
  wire overflow;
  wire zero;
  wire [31:0] ALUresult;
  wire carryout_;
  wire overflow_;
  wire zero_;
  wire [31:0] ALUresult_;
  
  wire [1:0]  ALUop_2;
  wire [5:0]  funct_2;
  wire [1:0]  ALUop_t;
  wire [1:0]  ALUop;
  
  wire [4:0] rd_2, rd_3, rd_4;
  
  wire [31:0] ALUresult_4,MemOut_4;
  wire PCwrite;
  
  wire Branch, Branch_2, Branch_3;
  
  wire [31:0] PCbranch_3;
  
/*   wire [31:0] readData1_, readData2_;
	wire [31:0] r2_;
	wire [31:0] r3_;
	wire [31:0] r4_;
	wire [31:0] r5_;
	wire [31:0] r6_;
	wire [31:0] r7_; */
	
    PipelinedProc pip ( .clk(clk), .initPC(initPC), .initPC2(initPC2), .nextPC(nextPC), .regPC(regPC),.PCplus4_1(PCplus4_1),.inst(inst),.writeData(writeData), .readData1(readData1), .readData2(readData2),.rt(rt), .rs(rs), .rd(rd), .shamt(shamt), .opcode(opcode), .funct(funct), .immed(immed),.r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7), .ALUinA(ALUinA), .ALUinB(ALUinB), .ALUctrl(ALUctrl), .carryout(carryout), .overflow(overflow), .zero(zero), .ALUresult(ALUresult), .ALUop_2(ALUop_2), .funct_2(funct_2), .ALUop_t(ALUop_t), .ALUop(ALUop), .rd_2(rd_2), .rd_3(rd_3), .rd_4(rd_4), .ALUresult_4(ALUresult_4),.MemOut_4(MemOut_4), .PCwrite(PCwrite), .Branch(Branch), .Branch_2(Branch_2), .Branch_3(Branch_3), .PCbranch_3(PCbranch_3));
    defparam pip.data_file = "data/bills_branch.dat";
	//unsigned_sum
	//bills_branch
	//sort_corrected_branch
	
	ALU alu_0 (.A(ALUinA), .B(ALUinB), .Ctrl(ALUctrl), .Carryout(carryout_), .Overflow(overflow_), .Zero(zero_), .Result(ALUresult_));
	
	//RegFile reg_0 (.clk(not_clk), .arst(initPC), .aload(1'b0), .busW(writeData), .RegWr(RegW_4), .RegDst(1'b1), .Rs(rs), .Rt(rt), .Rd(rd_4), .busA(readData1), .busB(readData2), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7));
	
	initial
      begin
		#10
	    clk = 1'b1;
        initPC = 1'b1;
		initPC2 = 1'b1;
	#2
	initPC = 1'b0;
	#60
	initPC2=1'b0;
        end
	always
		#10
		clk = !clk;

endmodule
