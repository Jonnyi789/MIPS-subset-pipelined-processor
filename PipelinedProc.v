module PipelinedProc( clk, initPC,initPC2,nextPC, regPC,PCplus4_1,inst,writeData, readData1, readData2,rt, rs, rd, shamt, opcode, funct, immed,r2, r3, r4, r5, r6, r7, ALUinA, ALUinB, ALUctrl, carryout, overflow, zero, ALUresult, ALUop_2, funct_2, ALUop_t, ALUop, rd_2, rd_3, rd_4, ALUresult_4,MemOut_4, PCwrite, Branch, Branch_2, Branch_3, PCbranch_3);
    parameter data_file;
	input clk;
	input initPC;
	input initPC2;
	output [31:0] r2;
	output [31:0] r3;
	output [31:0] r4;
	output [31:0] r5;
	output [31:0] r6;
	output [31:0] r7;
	output [31:0] nextPC, regPC,PCplus4_1;
	output [4:0] rt, rs, rd, shamt;
	output [5:0] opcode, funct;
	output [15:0] immed;
	output [31:0] inst;
	output [31:0] writeData, readData1, readData2;
	
  output [31:0] ALUinA;
  output [31:0] ALUinB;
  output [3:0] ALUctrl;
  output carryout;
  output overflow;
  output zero;
  output wire [31:0] ALUresult;
  
  output [1:0]  ALUop_2;
  output [5:0]  funct_2;
  output [1:0]  ALUop_t;
  output [1:0]  ALUop;
  
  output [4:0] rd_2, rd_3, rd_4;

  output [31:0] ALUresult_4,MemOut_4;
  
  output PCwrite;
  
  output Branch, Branch_2, Branch_3;
  
  output [31:0] PCbranch_3;
  wire not_clk;
  
  not_gate not_clk0 (.x(clk), .z(not_clk));
	
// wire for IF:0
wire [31:0] PCplus4,  PCBranch,setlessthan, fetchPC;

// wire for ID:1
wire RegDst, MemReg, RegW, MemW, ExtOp, IIWrite, ctrl0, flush;
wire [1:0]  ALUsrc;
wire RegDst_t, MemReg_t, RegW_t, MemW_t, Branch_t, ExtOp_t;
wire [1:0]  ALUsrc_t;
wire [31:0] PCplus4_1, inst_1, imext,imOffset;
wire [9:0] ctrlALL, ctrlALL_1;

// wire for EX:2
wire RegDst_2, MemReg_2, RegW_2, MemW_2, ExtOp_2; 
wire [31:0] readData1_2, readData2_2, shamtExt, PCbranch_2, PCplus4_2;
wire [4:0] rs_2, rt_2,RegDestination, shamt_2;
wire [1:0]  ALUsrc_2,forwardA, forwardB;
wire [5:0] opcode_2;
wire [31:0]  imext_2, ex_temp1,ex_temp2, ex_temp3, ex_temp4;

// wire for MEM:3
wire [31:0] ALUresult_3, ALUinB_3, MemOut,PCplus4_3;
wire zero_3, MemW_3, MemReg_3, RegW_3, overflow_3;
wire [5:0] opcode_3;

// wire for WB:4
wire MemReg_4, RegW_4;



// initialize or nextPC
mux_32 mux_0 (.sel(initPC),.src0(nextPC), .src1(32'h00400020), .z(regPC));

// stage IF 0
PC pc_0 (.clk(clk), .initPC(initPC), .PCwrite(PCwrite), .Branch(Branch_3), .Zero(zero_3), .Overflow(overflow_3), .Opcode(opcode_3),
	 .ALUresult(ALUresult_3), .CurrPC(regPC), .PCplus4(PCplus4), .PCbranch(PCbranch_3), .NextPC(nextPC), .PCplus4_branch(PCplus4_3));
adder_32 add_0 (.a(regPC), .b(32'h00000004), .z(PCplus4));
/* instruction out of range
unsigned_sum: 00400044
*/
//ALU ALU_if(.A(regPC),.B(32'h00400044), .Ctrl(4'b1011), .Result(setlessthan));
//mux_32 mux_if (.sel(setlessthan[0]),.src0(32'h00400044), .src1(regPC), .z(fetchPC));
instrfetch  infetch_0 (.PC(regPC), .inst(inst));
defparam infetch_0.inst_mem = data_file;

// reg IF/ID
if_id_reg if_id (.clk(clk),.init(initPC), .writeEnable(IIWrite), .ifFlush(flush), .pc_in(PCplus4), .inst_in(inst), .pc_out(PCplus4_1), .inst_out(inst_1));

// stage ID 1
instrdecode instrdecode_0 (.inst(inst_1), .opcode(opcode), .rs(rs), .rt(rt), .rd(rd), .shamt(shamt), .funct(funct), .immed(immed));
control control_0 (.opc(opcode), .func(funct), .RegDst(RegDst), .ALUsrc(ALUsrc), .MemReg(MemReg), .RegW(RegW), .MemW(MemW), .Branch(Branch), .ExtOp(ExtOp), .ALUop(ALUop));
stall stall_0 (.initi(initPC2), .IE_MemRead(MemReg_2), .IIBranch(Branch), .IEBranch(Branch_2), .EMBranch(Branch_3), 
	.IE_RegRt(rt_2), .II_RegRs(rs), .II_RegRt(rt), .PCWrite(PCwrite), .IIWrite(IIWrite), .ctrl0_final(ctrl0), .flush(flush));
signExtend signext_0 (.ExtOp(1'b1), .dataIn(immed), .dataOut(imext));
sll shift_0 (.A(imext), .B(32'h00000002), .Ctrl(4'b1111), .Result(imOffset)); 
adder_32 add_1 (.a(PCplus4_1), .b(imOffset), .z(PCBranch));
RegFile reg_0 (.clk(clk), .arst(initPC), .aload(1'b0), .busW(writeData), .RegWr(RegW_4), .RegDst(1'b1), .Rs(rs), .Rt(rt), .Rd(rd_4), .busA(readData1), .busB(readData2), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7));
/* registers reg_0 (.clk(clk),.init(initPC2), .writeEnable(RegW), .readReg1(rs), .readReg2(rt), .writeReg(rd_4),
		.writeData(writeData), .readData1(readData1), .readData2(readData2),.r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7)); */
assign ctrlALL = {RegDst, MemReg, RegW, MemW, Branch, ExtOp, ALUop, ALUsrc};
mux_n #(.n(10)) mux_1 (.sel(ctrl0), .src0(ctrlALL), .src1(10'b0000000000), .z(ctrlALL_1));
assign RegDst_t = ctrlALL_1[9];
assign MemReg_t = ctrlALL_1[8];
assign RegW_t = ctrlALL_1[7];
assign MemW_t = ctrlALL_1[6];
assign Branch_t = ctrlALL_1[5];
assign ExtOp_t = ctrlALL_1[4];
assign ALUop_t = ctrlALL_1[3:2];
assign ALUsrc_t = ctrlALL_1[1:0];

// reg ID/EX 
id_ex_reg id_ex_reg_0 (.clk(clk), .init(initPC),
		  .PCplus4(PCplus4_1),
		  .RegDst(RegDst_t), .MemReg(MemReg_t), .RegW(RegW_t), .MemW(MemW_t), 
		  .Branch(Branch_t), .ExtOp(ExtOp_t), .ALUop(ALUop_t),.ALUsrc(ALUsrc_t),
		  .RegRead1(readData1), .RegRead2(readData2), .ImmdExt(imext), .rs(rs), .rt(rt), .rd(rd), .Opcode(opcode),.funct(funct), .shamt(shamt),.pcbranch(PCBranch),
		  .PCplus4_o(PCplus4_2),
		  .RegDst_o(RegDst_2),.MemReg_o(MemReg_2), .RegW_o(RegW_2), .MemW_o(MemW_2),
		  .Branch_o(Branch_2), .ExtOp_o(ExtOp_2), .ALUop_o(ALUop_2),.ALUsrc_o(ALUsrc_2),
		  .RegRead1_o(readData1_2), .RegRead2_o(readData2_2), .ImmdExt_o(imext_2), .rs_o(rs_2), .rt_o(rt_2), .rd_o(rd_2), .Opcode_o(opcode_2), .funct_o(funct_2), .shamt_o(shamt_2), .pcbranch_o(PCbranch_2));

// stage EX 2
forward forward_0 (.initi(initPC2), .MW_RegWrite(RegW_4), .MW_RegRd(rd_4), .EM_RegWrite(RegW_3), .EM_RegRd(rd_3), .IE_RegRs(rs_2), .IE_RegRt(rt_2), .ForwardA(forwardA), .ForwardB(forwardB));
mux_32 mux_ex_0 (.sel(forwardA[1]), .src0(readData1_2), .src1(ALUresult_3), .z(ex_temp1));
mux_32 mux_ex_1 (.sel(forwardA[0]), .src0(ex_temp1), .src1(writeData), .z(ALUinA));

zeroExtend5to32 zeroext_0(.dataIn(shamt_2), .dataOut(shamtExt));
mux_32 mux_ex_2 (.sel(forwardB[1]), .src0(readData2_2), .src1(ALUresult_3), .z(ex_temp2));
mux_32 mux_ex_3 (.sel(forwardB[0]), .src0(ex_temp2), .src1(writeData), .z(ex_temp3));
mux_32 mux_ex_4 (.sel(ALUsrc_2[0]), .src0(ex_temp3), .src1(imext_2), .z(ex_temp4));
mux_32 mux_ex_5 (.sel(ALUsrc_2[1]), .src0(ex_temp4), .src1(shamtExt), .z(ALUinB));
ALUctrl aluctrl_0 (.aluop(ALUop_2), .func(funct_2), .aluctrl(ALUctrl));
ALU alu_0 (.A(ALUinA), .B(ALUinB), .Ctrl(ALUctrl), .Carryout(carryout), .Overflow(overflow), .Zero(zero), .Result(ALUresult));
mux_n #(.n(5)) mux_ex_6 (.sel(RegDst_2), .src0(rt_2), .src1(rd_2),.z(RegDestination));

// reg EX/MEM
ex_mem_reg ex_mem_reg_0 (.clk(clk), .init(initPC),
		  .MemReg(MemReg_2), .RegW(RegW_2),.MemW(MemW_2), .Branch(Branch_2), .PCplus4(PCplus4_2),
		  .Zero(zero),.overflow(overflow), .ALUresult(ALUresult), .RegRead2(ALUinB), .RegDestination(RegDestination), .Opcode(opcode_2),.pcbranch(PCbranch_2),
		  .MemReg_o(MemReg_3), .RegW_o(RegW_3), .MemW_o(MemW_3), .Branch_o(Branch_3), .PCplus4_o(PCplus4_3),
		  .Zero_o(zero_3), .overflow_o(overflow_3), .ALUresult_o(ALUresult_3),.RegRead2_o(ALUinB_3), .RegDestination_o(rd_3), .Opcode_o(opcode_3), .pcbranch_o(PCbranch_3));

// stage MEM 3
syncram syncram_0 (.clk(clk),.cs(1'b1),.oe(1'b1),.we(MemW_3),.addr(ALUresult_3),.din(ALUinB_3),.dout(MemOut));
defparam syncram_0.mem_file = data_file;

//reg MEM/WB
mem_wb_reg mem_wb_reg_0 (.clk(clk), .init(initPC),
		  .MemReg(MemReg_3), .RegW(RegW_3), 
		  .dataRead(MemOut), .ALUresult(ALUresult_3), .RegDestination(rd_3),
		  .MemReg_o(MemReg_4), .RegW_o(RegW_4), 
		  .dataRead_o(MemOut_4), .ALUresult_o(ALUresult_4), .RegDestination_o(rd_4));

// stage WB 4
mux_32 mux_wb_0 (.sel(MemReg_4), .src0(ALUresult_4), .src1(MemOut_4), .z(writeData));

endmodule
