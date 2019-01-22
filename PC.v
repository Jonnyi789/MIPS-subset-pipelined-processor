module PC (clk, initPC, PCwrite, Branch, Zero, Overflow, Opcode, ALUresult, CurrPC, PCplus4, PCbranch, NextPC, PCplus4_branch);
	input clk, initPC, PCwrite, Branch, Zero, Overflow;
	input [5:0] Opcode;
	input [31:0] ALUresult, CurrPC, PCplus4, PCbranch, PCplus4_branch;
	output [31:0] NextPC;


wire [31:0] immedExt, imOffset, PCplus4, PCbranch, PCbranch_final, outputPC, branchPC,finalPC_1, finalPC_2;
wire invZero, invMSB, valid_tmp1, valid_tmp2, valid_tmp3, valid, sel;

not_gate not_0 (.x(Zero),.z(invZero));
xnor_gate xnor_0 (.x(ALUresult[31]),.y(Overflow),.z(valid_tmp1));
xor_gate xor_1 (.x(Zero), .y(valid_tmp1), .z(valid_tmp2));

// generate final valid signal for branch;
mux mux_0 (.sel(Opcode[0]), .src0(Zero), .src1(invZero), .z(valid_tmp3));
mux mux_1 (.sel(Opcode[1]), .src0(valid_tmp3), .src1(valid_tmp2), .z(valid));

and_gate and_0 (.x(Branch), .y(valid), .z(sel));

// compute final PC value
mux_32 mux_2 (.sel(valid), .src0(PCplus4_branch), .src1(PCbranch), .z(branchPC));
mux_32 mux_3 (.sel(Branch), .src0(PCplus4), .src1(branchPC), .z(outputPC));
mux_32 mux_4 (.sel(initPC), .src0(outputPC), .src1(32'h00400020), .z(finalPC_1));
mux_32 mux_5 (.sel(PCwrite), .src0(CurrPC), .src1(finalPC_1), .z(finalPC_2));

// update PC triggered by clk
generate
genvar i;
for (i = 0; i < 32; i = i+1)
	begin
	dff dff_0 (.clk(clk), .d(finalPC_2[i]), .q(NextPC[i]));
	end
endgenerate

endmodule;