module ex_mem_reg (clk, init,
		  MemReg, RegW,MemW, Branch, PCplus4,
		  Zero, overflow, ALUresult, RegRead2, RegDestination, Opcode,
		  pcbranch,
		  MemReg_o, RegW_o, MemW_o, Branch_o, PCplus4_o,
		  Zero_o, overflow_o, ALUresult_o,RegRead2_o, RegDestination_o, Opcode_o,
		  pcbranch_o);
	input clk, init, MemReg, RegW, MemW, Branch, Zero, overflow;
	input [4:0] RegDestination;
	input [5:0] Opcode;
	input [31:0]  RegRead2, ALUresult, pcbranch, PCplus4;
	output MemReg_o, RegW_o, MemW_o, Branch_o, Zero_o, overflow_o;
	output [4:0] RegDestination_o;
	output [5:0] Opcode_o;
	output [31:0]  RegRead2_o, ALUresult_o, pcbranch_o,PCplus4_o;


wire [144:0] data_to_write, write_final;
wire [144:0] reg_t, reg_r;

// concate data
assign data_to_write ={PCplus4, pcbranch, overflow, MemReg, RegW,MemW, Branch,Zero, ALUresult, RegRead2, RegDestination, Opcode};
mux_n #(.n(145)) mux_1 (.sel(init), .src0(data_to_write), .src1(145'h0), .z(write_final));
// save to temp variable
assign reg_t = reg_r;

// write to register triggered by clock
regNbit_write #(.n(145)) write_0 (.clk(clk), .writeEnable(1'b1), .din(write_final), .orgData(reg_t), .pos(reg_r));

// output current reg_r value
assign PCplus4_o = reg_r[144: 113];
assign pcbranch_o = reg_r[112:81];
assign overflow_o = reg_r[80];
assign MemReg_o = reg_r[79];
assign RegW_o = reg_r[78];
assign MemW_o = reg_r[77];
assign Branch_o = reg_r[76];
assign Zero_o = reg_r[75];
assign ALUresult_o = reg_r[74:43];
assign RegRead2_o = reg_r[42:11];
assign RegDestination_o = reg_r[10:6];
assign Opcode_o = reg_r[5:0];

endmodule
