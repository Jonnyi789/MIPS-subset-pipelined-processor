module stall (initi, IE_MemRead, IIBranch, IEBranch, EMBranch, IE_RegRt, II_RegRs, II_RegRt, PCWrite, IIWrite, ctrl0_final, flush);
   	input initi;
	input IE_MemRead;
	input IIBranch, IEBranch, EMBranch;
	input [4:0] IE_RegRt, II_RegRs, II_RegRt;
    	output PCWrite, IIWrite, ctrl0_final, flush;
	//stall means PCWrite=0, IIWrite=0, ctrl0=1, all control signal is 0
	// if branch, flush=1
    wire IEII_ts_0, IEII_tt_0, tstt, IIEB;
    wire [4:0] IEII_ts, IEII_tt;
	wire PCWrite_pre, IIWrite_pre, ctrl0;
	
	xnor_gate_n xnor1 (.x(IE_RegRt), .y(II_RegRs), .z(IEII_ts));
	defparam xnor1.n=5;
	xnor_gate_n xnor2 (.x(IE_RegRt), .y(II_RegRt), .z(IEII_tt));
	defparam xnor2.n=5;
	and_6 and1 (.a(IEII_ts[0]),.b(IEII_ts[1]),.c(IEII_ts[2]),.d(IEII_ts[3]),.e(IEII_ts[4]),.f(1'b1), .z(IEII_ts_0));
	and_6 and2 (.a(IEII_tt[0]),.b(IEII_tt[1]),.c(IEII_tt[2]),.d(IEII_tt[3]),.e(IEII_tt[4]),.f(1'b1), .z(IEII_tt_0));
	
	or_gate or1 (.x(IEII_ts_0), .y(IEII_tt_0), .z(tstt));
	and_gate and0 (.x(tstt), .y(IE_MemRead), .z(ctrl0));
	not_gate not0 (.x(ctrl0), .z(PCWrite_pre));
	not_gate not1 (.x(ctrl0), .z(IIWrite_pre));
	
	mux mux_0 (.sel(initi), .src0(PCWrite_pre), .src1(1'b1), .z(PCWrite));
	mux mux_1 (.sel(initi), .src0(IIWrite_pre), .src1(1'b1), .z(IIWrite));
	
	not_gate not3 (.x(PCWrite), .z(ctrl0_final));
	
	
	or_gate or2 (.x(IIBranch), .y(IEBranch), .z(IIEB));
	or_gate or3 (.x(IIEB), .y(EMBranch), .z(flush));
    
endmodule
