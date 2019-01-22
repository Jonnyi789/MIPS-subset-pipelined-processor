module control (opc, func, RegDst, ALUsrc, MemReg, RegW, MemW, Branch, ExtOp, ALUop);
    input [5:0] opc, func;
    output RegDst, MemReg, RegW, MemW, Branch, ExtOp;
    output [1:0] ALUop;
	output [1:0] ALUsrc;
    
    wire [5:0] not_opc, not_func;
    not_gate_n abc(.x(opc), .z(not_opc));   /**/
	defparam abc.n = 6;
    not_gate_n bcd(.x(func), .z(not_func));
	defparam bcd.n = 6;
    
    wire addir,lwr,swr,beqr,bner,bgtzr,addr,addur,subr,subur,andr,orr,sllr,sltr,sltur;
    and_6 addif(.a(not_opc[5]), .b(not_opc[4]), .c(opc[3]), .d(not_opc[2]), .e(not_opc[1]), .f(not_opc[0]), .z(addir));
    and_6 lwf(.a(opc[5]), .b(not_opc[4]), .c(not_opc[3]), .d(not_opc[2]), .e(opc[1]), .f(opc[0]), .z(lwr));
    and_6 swf(.a(opc[5]), .b(not_opc[4]), .c(opc[3]), .d(not_opc[2]), .e(opc[1]), .f(opc[0]), .z(swr));
    and_6 beqf(.a(not_opc[5]), .b(not_opc[4]), .c(not_opc[3]), .d(opc[2]), .e(not_opc[1]), .f(not_opc[0]), .z(beqr));
    and_6 bnef(.a(not_opc[5]), .b(not_opc[4]), .c(not_opc[3]), .d(opc[2]), .e(not_opc[1]), .f(opc[0]), .z(bner));
    and_6 bgtzf(.a(not_opc[5]), .b(not_opc[4]), .c(not_opc[3]), .d(opc[2]), .e(opc[1]), .f(opc[0]), .z(bgtzr));
    
    wire addx,addux,subx,subux,andx,orx,sllx,sltx,sltux, rtype;
    and_6 rrr(.a(not_opc[5]), .b(not_opc[4]), .c(not_opc[3]), .d(not_opc[2]), .e(not_opc[1]), .f(not_opc[0]), .z(rtype));
    
    and_6 addt(.a(func[5]), .b(not_func[4]), .c(not_func[3]), .d(not_func[2]), .e(not_func[1]), .f(not_func[0]), .z(addx));
    and_gate addf(.x(addx), .y(rtype), .z(addr));
    and_6 addut(.a(func[5]), .b(not_func[4]), .c(not_func[3]), .d(not_func[2]), .e(not_func[1]), .f(func[0]), .z(addux));
    and_gate adduf(.x(addux), .y(rtype), .z(addur));
    and_6 subt(.a(func[5]), .b(not_func[4]), .c(not_func[3]), .d(not_func[2]), .e(func[1]), .f(not_func[0]), .z(subx));
    and_gate subf(.x(subx), .y(rtype), .z(subr));
    and_6 subut(.a(func[5]), .b(not_func[4]), .c(not_func[3]), .d(not_func[2]), .e(func[1]), .f(func[0]), .z(subux));
    and_gate subuf(.x(subux), .y(rtype), .z(subur));
    and_6 andt(.a(func[5]), .b(not_func[4]), .c(not_func[3]), .d(func[2]), .e(not_func[1]), .f(not_func[0]), .z(andx));
    and_gate andf(.x(andx), .y(rtype), .z(andr));
    and_6 ort(.a(func[5]), .b(not_func[4]), .c(not_func[3]), .d(func[2]), .e(not_func[1]), .f(func[0]), .z(orx));
    and_gate orf(.x(orx), .y(rtype), .z(orr));
    and_6 sllt(.a(not_func[5]), .b(not_func[4]), .c(not_func[3]), .d(not_func[2]), .e(not_func[1]), .f(not_func[0]), .z(sllx));
    and_gate sllf(.x(sllx), .y(rtype), .z(sllr));
    and_6 sltt(.a(func[5]), .b(not_func[4]), .c(func[3]), .d(not_func[2]), .e(func[1]), .f(not_func[0]), .z(sltx));
    and_gate sltf(.x(sltx), .y(rtype), .z(sltr));
    and_6 sltut(.a(func[5]), .b(not_func[4]), .c(func[3]), .d(not_func[2]), .e(func[1]), .f(func[0]), .z(sltux));
    and_gate sltuf(.x(sltux), .y(rtype), .z(sltur));
    
    assign RegDst = rtype;   /**/
    or_6 cde(.a(addir), .b(lwr), .c(swr), .d(1'b0), .e(1'b0), .f(1'b0), .z(ALUsrc[0]));
	assign ALUsrc[1]=sllr;
	/*sll ALUsrc=10 other cases, ALUsrc[1]=0*/
    assign MemReg = lwr;
    or_6 def(.a(addir), .b(lwr), .c(rtype), .d(1'b0), .e(1'b0), .f(1'b0), .z(RegW));
    assign MemW = swr;
    or_6 efg(.a(beqr), .b(bner), .c(bgtzr), .d(1'b0), .e(1'b0), .f(1'b0), .z(Branch));
    or_6 fgh(.a(addir), .b(lwr), .c(swr), .d(1'b0), .e(1'b0), .f(1'b0), .z(ExtOp));
    
    assign ALUop[1] = rtype;   /**/
    or_6 ghi(.a(beqr), .b(bner), .c(bgtzr), .d(1'b0), .e(1'b0), .f(1'b0), .z(ALUop[0]));
    /*for all R-type return 10; for I-type return 00 or 01 as add or sub*/
endmodule
