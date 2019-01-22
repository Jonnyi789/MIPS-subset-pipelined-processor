module forward (initi, MW_RegWrite, MW_RegRd, EM_RegWrite, EM_RegRd, IE_RegRs, IE_RegRt, ForwardA, ForwardB);
    input MW_RegWrite, EM_RegWrite;
	input initi;
	input [4:0] MW_RegRd, EM_RegRd, IE_RegRs, IE_RegRt;
    output [1:0] ForwardA, ForwardB;
    wire EM_RegRd_0, EMIE_ds_0, EMIE_dt_0;
	wire MW_RegRd_0, MWIE_ds_0, MWIE_dt_0;
	wire nforA, nforB;
    wire [4:0] EMIE_ds, EMIE_dt;
	wire [4:0] MWIE_ds, MWIE_dt;
	wire not_initi;
	
	not_gate not000 (.x(initi), .z(not_initi));
	
	or_6 or1 (.a(EM_RegRd[0]),.b(EM_RegRd[1]),.c(EM_RegRd[2]),.d(EM_RegRd[3]),.e(EM_RegRd[4]),.f(1'b0), .z(EM_RegRd_0));
	or_6 or2 (.a(MW_RegRd[0]),.b(MW_RegRd[1]),.c(MW_RegRd[2]),.d(MW_RegRd[3]),.e(MW_RegRd[4]),.f(1'b0), .z(MW_RegRd_0));
	
	xnor_gate_n xnor1 (.x(EM_RegRd), .y(IE_RegRs), .z(EMIE_ds));
	defparam xnor1.n=5;
	xnor_gate_n xnor2 (.x(EM_RegRd), .y(IE_RegRt), .z(EMIE_dt));
	defparam xnor2.n=5;
	and_6 and1 (.a(EMIE_ds[0]),.b(EMIE_ds[1]),.c(EMIE_ds[2]),.d(EMIE_ds[3]),.e(EMIE_ds[4]),.f(1'b1), .z(EMIE_ds_0));
	and_6 and2 (.a(EMIE_dt[0]),.b(EMIE_dt[1]),.c(EMIE_dt[2]),.d(EMIE_dt[3]),.e(EMIE_dt[4]),.f(1'b1), .z(EMIE_dt_0));
	
	xnor_gate_n xnor3 (.x(MW_RegRd), .y(IE_RegRs), .z(MWIE_ds));
	defparam xnor3.n=5;
	xnor_gate_n xnor4 (.x(MW_RegRd), .y(IE_RegRt), .z(MWIE_dt));
	defparam xnor4.n=5;
	and_6 and3 (.a(MWIE_ds[0]),.b(MWIE_ds[1]),.c(MWIE_ds[2]),.d(MWIE_ds[3]),.e(MWIE_ds[4]),.f(1'b1), .z(MWIE_ds_0));
	and_6 and4 (.a(MWIE_dt[0]),.b(MWIE_dt[1]),.c(MWIE_dt[2]),.d(MWIE_dt[3]),.e(MWIE_dt[4]),.f(1'b1), .z(MWIE_dt_0));
	
	and_6 and5 (.a(EMIE_ds_0),.b(EM_RegRd_0),.c(EM_RegWrite),.d(not_initi),.e(1'b1),.f(1'b1), .z(ForwardA[1]));
	and_6 and6 (.a(EMIE_dt_0),.b(EM_RegRd_0),.c(EM_RegWrite),.d(not_initi),.e(1'b1),.f(1'b1), .z(ForwardB[1]));
	not_gate not1 (.x(ForwardA[1]), .z(nforA));
	not_gate not2 (.x(ForwardB[1]), .z(nforB));
	
	and_6 and7 (.a(MWIE_ds_0),.b(MW_RegRd_0),.c(MW_RegWrite),.d(nforA),.e(not_initi),.f(1'b1), .z(ForwardA[0]));
	and_6 and8 (.a(MWIE_dt_0),.b(MW_RegRd_0),.c(MW_RegWrite),.d(nforB),.e(not_initi),.f(1'b1), .z(ForwardB[0]));
    
endmodule
