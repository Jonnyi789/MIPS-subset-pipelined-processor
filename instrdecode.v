module instrdecode(inst, opcode, rs, rt, rd, shamt, funct, immed);
	input [31:0] inst;
	output [5:0] opcode;
	output [4:0] rs;
	output [4:0] rt;
	output [4:0] rd;
	output [4:0] shamt;
	output [5:0] funct;
	output [15:0] immed;

assign opcode=inst[31:26];
assign rs=inst[25:21];
assign rt=inst[20:16];
assign rd=inst[15:11];
assign shamt=inst[10:6];
assign funct=inst[5:0];
assign immed=inst[15:0];


endmodule
