module mux32to1 (sel, r0,r1,r2,r3,r4,r5,r6,r7,r8,
		      r9,r10,r11,r12,r13,r14,r15,
		      r16,r17,r18,r19,r20,r21,r22,r23,
		      r24,r25,r26,r27,r28,r29,r30,r31,
		 dout);
	input [4:0] sel;
	input [31:0]  r0,r1,r2,r3,r4,r5,r6,r7,r8,
		      r9,r10,r11,r12,r13,r14,r15,
		      r16,r17,r18,r19,r20,r21,r22,r23,
		      r24,r25,r26,r27,r28,r29,r30,r31;
	output [31:0] dout;

wire [31:0] s0_0,s0_1,s0_2,s0_3,s0_4,s0_5,s0_6,s0_7,s0_8,s0_9,s0_10,s0_11,s0_12,s0_13,s0_14,s0_15;
wire [31:0] s1_0,s1_1,s1_2,s1_3,s1_4,s1_5,s1_6,s1_7;
wire [31:0] s2_0,s2_1,s2_2,s2_3;
wire [31:0] s3_0,s3_1;
wire [31:0] res;

//stage 0
mux_32 mux_0 (.sel(sel[0]), .src0(r0), .src1(r1), .z(s0_0));
mux_32 mux_1 (.sel(sel[0]), .src0(r2), .src1(r3), .z(s0_1));
mux_32 mux_2 (.sel(sel[0]), .src0(r4), .src1(r5), .z(s0_2));
mux_32 mux_3 (.sel(sel[0]), .src0(r6), .src1(r7), .z(s0_3));
mux_32 mux_4 (.sel(sel[0]), .src0(r8), .src1(r9), .z(s0_4));
mux_32 mux_5 (.sel(sel[0]), .src0(r10), .src1(r11), .z(s0_5));
mux_32 mux_6 (.sel(sel[0]), .src0(r12), .src1(r13), .z(s0_6));
mux_32 mux_7 (.sel(sel[0]), .src0(r14), .src1(r15), .z(s0_7));
mux_32 mux_8 (.sel(sel[0]), .src0(r16), .src1(r17), .z(s0_8));
mux_32 mux_9 (.sel(sel[0]), .src0(r18), .src1(r19), .z(s0_9));
mux_32 mux_10 (.sel(sel[0]), .src0(r20), .src1(r21), .z(s0_10));
mux_32 mux_11 (.sel(sel[0]), .src0(r22), .src1(r23), .z(s0_11));
mux_32 mux_12 (.sel(sel[0]), .src0(r24), .src1(r25), .z(s0_12));
mux_32 mux_13 (.sel(sel[0]), .src0(r26), .src1(r27), .z(s0_13));
mux_32 mux_14 (.sel(sel[0]), .src0(r28), .src1(r29), .z(s0_14));
mux_32 mux_15 (.sel(sel[0]), .src0(r30), .src1(r31), .z(s0_15));
//stage 1
mux_32 mux_1_0 (.sel(sel[1]), .src0(s0_0), .src1(s0_1), .z(s1_0));
mux_32 mux_1_1 (.sel(sel[1]), .src0(s0_2), .src1(s0_3), .z(s1_1));
mux_32 mux_1_2 (.sel(sel[1]), .src0(s0_4), .src1(s0_5), .z(s1_2));
mux_32 mux_1_3 (.sel(sel[1]), .src0(s0_6), .src1(s0_7), .z(s1_3));
mux_32 mux_1_4 (.sel(sel[1]), .src0(s0_8), .src1(s0_9), .z(s1_4));
mux_32 mux_1_5 (.sel(sel[1]), .src0(s0_10), .src1(s0_11), .z(s1_5));
mux_32 mux_1_6 (.sel(sel[1]), .src0(s0_12), .src1(s0_13), .z(s1_6));
mux_32 mux_1_7 (.sel(sel[1]), .src0(s0_14), .src1(s0_15), .z(s1_7));
//stage 2
mux_32 mux_2_0 (.sel(sel[2]), .src0(s1_0), .src1(s1_1), .z(s2_0));
mux_32 mux_2_1 (.sel(sel[2]), .src0(s1_2), .src1(s1_3), .z(s2_1));
mux_32 mux_2_2 (.sel(sel[2]), .src0(s1_4), .src1(s1_5), .z(s2_2));
mux_32 mux_2_3 (.sel(sel[2]), .src0(s1_6), .src1(s1_7), .z(s2_3));
//stage 3
mux_32 mux_3_0 (.sel(sel[3]), .src0(s2_0), .src1(s2_1), .z(s3_0));
mux_32 mux_3_1 (.sel(sel[3]), .src0(s2_2), .src1(s2_3), .z(s3_1));
//stage 4
mux_32 mux_4_0 (.sel(sel[4]), .src0(s3_0), .src1(s3_1), .z(dout));

endmodule

	