module RegFile(clk, arst, aload, busW, RegWr, RegDst, Rs, Rt, Rd, busA, busB, r2, r3, r4, r5, r6, r7);
    
    input clk;
    input arst;
    input aload;
    input [31:0] busW;
    input RegWr;
    input RegDst;
    input [4:0] Rs;
    input [4:0] Rt;
    input [4:0] Rd;
    output wire [31:0] busA;
    output wire [31:0] busB;
	output wire [31:0] r2;
	output wire [31:0] r3;
	output wire [31:0] r4;
	output wire [31:0] r5;
	output wire [31:0] r6;
	output wire [31:0] r7;
    
    wire [31:0] zero;
    wire [31:0] dec_out;
    wire [31:0] and_out;
    wire [4:0] Rw_in;
    
    wire [31:0] RWtempsignal [31:0];
    wire [31:0] RWtempsignal_tempA_1 [31:0];
    wire [31:0] RWtempsignal_tempA_2 [31:0];
    wire [31:0] RWtempsignal_tempA_3 [31:0];
    wire [31:0] RWtempsignal_tempA_4 [31:0];
    wire [31:0] RWA_1 [31:0];
    wire [31:0] RWA_2 [31:0];
    wire [31:0] RWA_3 [31:0];
    wire [31:0] RWA_4 [31:0];
    wire [31:0] RWtempsignal_tempB_1 [31:0];
    wire [31:0] RWtempsignal_tempB_2 [31:0];
    wire [31:0] RWtempsignal_tempB_3 [31:0];
    wire [31:0] RWtempsignal_tempB_4 [31:0];
    wire [31:0] RWB_1 [31:0];
    wire [31:0] RWB_2 [31:0];
    wire [31:0] RWB_3 [31:0];
    wire [31:0] RWB_4 [31:0];
    
    assign zero = 32'h00000000;
    assign RWtempsignal[0] = zero;
	
	assign r2=RWtempsignal [2];
	assign r3=RWtempsignal [3];
	assign r4=RWtempsignal [4];
	assign r5=RWtempsignal [5];
	assign r6=RWtempsignal [6];
	assign r7=RWtempsignal [7];
	
    
    mux_n #(.n(5)) mux_5bit(.sel(RegDst), .src0(Rt), .src1(Rd), .z(Rw_in));
    
    dec_n #(.n(5)) decmap(.src(Rw_in), .z(dec_out));
    
    genvar i;
    for (i=0;i<32;i=i+1) begin
        and_gate and0_map(.x(RegWr), .y(dec_out[i]), .z(and_out[i]));
    end
    
    for (i=1;i<32;i=i+1) begin
        dffr_a_32bit dffr_map(.clk(clk), .arst(arst), .aload(aload), .adata(zero), .d(busW), .enable(and_out[i]), .q(RWtempsignal[i]));
    end
    
    for (i=0;i<16;i=i+1) begin
        assign RWtempsignal_tempA_1[i] = RWtempsignal[i+16];
    end
    
    for (i=0;i<16;i=i+1) begin
        mux_32 mux_sel0(.sel(Rs[4]), .src0(RWtempsignal[i]), .src1(RWtempsignal_tempA_1[i]), .z(RWA_1[i]));
    end
    
    for (i=0;i<8;i=i+1) begin
        assign RWtempsignal_tempA_2[i] = RWA_1[i+8];
    end
   
    
    for (i=0;i<8;i=i+1) begin
        mux_32 mux_sel1(.sel(Rs[3]), .src0(RWA_1[i]), .src1(RWtempsignal_tempA_2[i]), .z(RWA_2[i]));
    end
    
    for (i=0;i<4;i=i+1) begin
        assign RWtempsignal_tempA_3[i] = RWA_2[i+4];
    end
    
    for (i=0;i<4;i=i+1) begin
        mux_32 mux_sel2(.sel(Rs[2]), .src0(RWA_2[i]), .src1(RWtempsignal_tempA_3[i]), .z(RWA_3[i]));
    end
    
    for (i=0;i<2;i=i+1) begin
        assign RWtempsignal_tempA_4[i] = RWA_3[i+2];
    end
    
    for (i=0;i<2;i=i+1) begin
        mux_32 mux_sel3(.sel(Rs[1]), .src0(RWA_3[i]), .src1(RWtempsignal_tempA_4[i]), .z(RWA_4[i]));
    end
    
    mux_32 mux_sel4(.sel(Rs[0]), .src0(RWA_4[0]), .src1(RWA_4[1]), .z(busA));
   
   // busB
   
    for (i=0;i<16;i=i+1) begin
        assign RWtempsignal_tempB_1[i] = RWtempsignal[i+16];
    end
   
   for (i=0;i<16;i=i+1) begin
       mux_32 mux_selB0(.sel(Rt[4]), .src0(RWtempsignal[i]), .src1(RWtempsignal_tempB_1[i]), .z(RWB_1[i]));
   end
   
   for (i=0;i<8;i=i+1) begin
       assign RWtempsignal_tempB_2[i] = RWB_1[i+8];
   end
   
   
   for (i=0;i<8;i=i+1) begin
       mux_32 mux_selB1(.sel(Rt[3]), .src0(RWB_1[i]), .src1(RWtempsignal_tempB_2[i]), .z(RWB_2[i]));
   end
   
   for (i=0;i<4;i=i+1) begin
       assign RWtempsignal_tempB_3[i] = RWB_2[i+4];
   end
   
   
   for (i=0;i<4;i=i+1) begin
       mux_32 mux_selB2(.sel(Rt[2]), .src0(RWB_2[i]), .src1(RWtempsignal_tempB_3[i]), .z(RWB_3[i]));
   end
   
   for (i=0;i<2;i=i+1) begin
       assign RWtempsignal_tempB_4[i] = RWB_3[i+2];
   end
   
   for (i=0;i<2;i=i+1) begin
       mux_32 mux_selB3(.sel(Rt[1]), .src0(RWB_3[i]), .src1(RWtempsignal_tempB_4[i]), .z(RWB_4[i]));
   end
   
   mux_32 mux_selB4(.sel(Rt[0]), .src0(RWB_4[0]), .src1(RWB_4[1]), .z(busB));
   
   
   // For debugging
   //always@(busA,busB) begin
   //    $display ("--REGISTER FILE--");
   //    $display("busA addr: %b", busA);
   //    $display("busB addr: %b", busB);
    //   $display ("----------------");
   //end
       
   
   endmodule
    
