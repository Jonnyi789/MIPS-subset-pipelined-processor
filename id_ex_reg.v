module id_ex_reg (clk, init, PCplus4,
		  RegDst, MemReg, RegW, MemW, Branch, ExtOp, ALUop,ALUsrc,
		  RegRead1, RegRead2, ImmdExt, rs, rt, rd, Opcode, funct, shamt,pcbranch,
		  PCplus4_o,
		  RegDst_o,MemReg_o, RegW_o, MemW_o, Branch_o, ExtOp_o, ALUop_o,ALUsrc_o,
		  RegRead1_o, RegRead2_o, ImmdExt_o, rs_o, rt_o, rd_o, Opcode_o, funct_o, shamt_o, pcbranch_o);
	input clk, init, RegDst, MemReg, RegW, MemW, Branch, ExtOp;
	input [1:0] ALUop, ALUsrc;
	input [4:0] rs, rt, rd, shamt;
	input [5:0] Opcode, funct;
	input [31:0] RegRead1, RegRead2, ImmdExt, pcbranch,PCplus4;
	output RegDst_o, MemReg_o, RegW_o, MemW_o, Branch_o, ExtOp_o;
	output [1:0] ALUop_o, ALUsrc_o;
	output [4:0] rs_o, rt_o, rd_o , shamt_o;
	output [5:0] Opcode_o, funct_o;
	output [31:0] RegRead1_o, RegRead2_o, ImmdExt_o, pcbranch_o,PCplus4_o;


wire [201:0] data_to_write, write_final;
wire [201:0] reg_t, reg_r;

// concate data
assign data_to_write ={PCplus4, pcbranch, shamt,funct,RegDst, MemReg, RegW, MemW, Branch, ExtOp, ALUop,ALUsrc, RegRead1, RegRead2, ImmdExt, rs, rt, rd, Opcode};
mux_n #(.n(202)) mux_1 (.sel(init), .src0(data_to_write), .src1(202'h0), .z(write_final));

// save to temp variable
assign reg_t = reg_r;

// write to register triggered by clock
regNbit_write #(.n(202)) write_0 (.clk(clk), .writeEnable(1'b1), .din(write_final), .orgData(reg_t), .pos(reg_r));

// output current reg_r value
assign PCplus4_o = reg_r[201:170];
assign pcbranch_o = reg_r[169:138];
assign shamt_o = reg_r[137:133];
assign funct_o = reg_r[132:127];
assign RegDst_o = reg_r[126];
assign MemReg_o = reg_r[125];
assign RegW_o = reg_r[124];
assign MemW_o = reg_r[123];
assign Branch_o = reg_r[122];
assign ExtOp_o = reg_r[121];
assign ALUop_o = reg_r[120:119];
assign ALUsrc_o = reg_r[118:117];
assign RegRead1_o = reg_r[116:85];
assign RegRead2_o = reg_r[84:53];
assign ImmdExt_o = reg_r[52:21];
assign rs_o = reg_r[20:16];
assign rt_o = reg_r[15:11];
assign rd_o = reg_r[10:6];
assign Opcode_o = reg_r[5:0];


endmodule