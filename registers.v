module registers(clk,init, writeEnable, readReg1, readReg2, writeReg,writeData, readData1, readData2, r2, r3, r4, r5, r6, r7);
	input writeEnable, clk,init;
	input [4:0] readReg1, readReg2, writeReg;
	input [31:0] writeData;
	output [31:0] readData1, readData2;
	output [31:0] r2;
	output [31:0] r3;
	output [31:0] r4;
	output [31:0] r5;
	output [31:0] r6;
	output [31:0] r7;
// define container for 32 32-bit registers. 
wire [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,
	r9,r10,r11,r12,r13,r14,r15,
	r16,r17,r18,r19,r20,r21,r22,r23,
	r24,r25,r26,r27,r28,r29,r30,r31;
wire [31:0] t0,t1,t2,t3,t4,t5,t6,t7,t8,
	t9,t10,t11,t12,t13,t14,t15,
	t16,t17,t18,t19,t20,t21,t22,t23,
	t24,t25,t26,t27,t28,t29,t30,t31;
	
	wire [4:0] readReg1x, readReg2x;
	mux_32 mux_read1 (.sel(clk), .src0(5'b0), .src1(readReg1), .z(readReg1x));
	mux_32 mux_read2 (.sel(clk), .src0(5'b0), .src1(readReg2), .z(readReg2x));

wire [31:0] write_sel;
wire [31:0] tmp_write;
wire [31:0] tmp_read1;
//wire [31:0] tmp_read2;
wire [31:0] we;

//initialization
mux_32 mux_0 (.sel(init), .src0(r0), .src1(32'h00000000), .z(t0));
mux_32 mux_1 (.sel(init), .src0(r1), .src1(32'h00000000), .z(t1));
mux_32 mux_2 (.sel(init), .src0(r2), .src1(32'h00000000), .z(t2));
mux_32 mux_3 (.sel(init), .src0(r3), .src1(32'h00000000), .z(t3));
mux_32 mux_4 (.sel(init), .src0(r4), .src1(32'h00000000), .z(t4));
mux_32 mux_5 (.sel(init), .src0(r5), .src1(32'h00000000), .z(t5));
mux_32 mux_6 (.sel(init), .src0(r6), .src1(32'h00000000), .z(t6));
mux_32 mux_7 (.sel(init), .src0(r7), .src1(32'h00000000), .z(t7));
mux_32 mux_8 (.sel(init), .src0(r8), .src1(32'h00000000), .z(t8));
mux_32 mux_9 (.sel(init), .src0(r9), .src1(32'h00000000), .z(t9));
mux_32 mux_10 (.sel(init), .src0(r10), .src1(32'h00000000), .z(t10));
mux_32 mux_11 (.sel(init), .src0(r11), .src1(32'h00000000), .z(t11));
mux_32 mux_12 (.sel(init), .src0(r12), .src1(32'h00000000), .z(t12));
mux_32 mux_13 (.sel(init), .src0(r13), .src1(32'h00000000), .z(t13));
mux_32 mux_14 (.sel(init), .src0(r14), .src1(32'h00000000), .z(t14));
mux_32 mux_15 (.sel(init), .src0(r15), .src1(32'h00000000), .z(t15));
mux_32 mux_16 (.sel(init), .src0(r16), .src1(32'h00000000), .z(t16));
mux_32 mux_17 (.sel(init), .src0(r17), .src1(32'h00000000), .z(t17));
mux_32 mux_18 (.sel(init), .src0(r18), .src1(32'h00000000), .z(t18));
mux_32 mux_19 (.sel(init), .src0(r19), .src1(32'h00000000), .z(t19));
mux_32 mux_20 (.sel(init), .src0(r20), .src1(32'h00000000), .z(t20));
mux_32 mux_21 (.sel(init), .src0(r21), .src1(32'h00000000), .z(t21));
mux_32 mux_22 (.sel(init), .src0(r22), .src1(32'h00000000), .z(t22));
mux_32 mux_23 (.sel(init), .src0(r23), .src1(32'h00000000), .z(t23));
mux_32 mux_24 (.sel(init), .src0(r24), .src1(32'h00000000), .z(t24));
mux_32 mux_25 (.sel(init), .src0(r25), .src1(32'h00000000), .z(t25));
mux_32 mux_26 (.sel(init), .src0(r26), .src1(32'h00000000), .z(t26));
mux_32 mux_27 (.sel(init), .src0(r27), .src1(32'h00000000), .z(t27));
mux_32 mux_28 (.sel(init), .src0(r28), .src1(32'h00000000), .z(t28));
mux_32 mux_29 (.sel(init), .src0(r29), .src1(32'h00000000), .z(t29));
mux_32 mux_30 (.sel(init), .src0(r30), .src1(32'h00000000), .z(t30));
mux_32 mux_31 (.sel(init), .src0(r31), .src1(32'h00000000), .z(t31));


dec_n #(.n(5)) decode_0 (.src(writeReg), .z(write_sel));


and_gate and_0 (.x(write_sel[0]), .y(writeEnable), .z(we[0]));
reg32bit_write write_0 (.clk(clk), .writeEnable(we[0]), .din(writeData), .orgData(t0), .pos(r0));
//assign t0 = r0;
and_gate and_1 (.x(write_sel[1]), .y(writeEnable), .z(we[1]));
reg32bit_write write_1 (.clk(clk), .writeEnable(we[1]), .din(writeData), .orgData(r1), .pos(r1));
//assign t1 = r1;
and_gate and_2 (.x(write_sel[2]), .y(writeEnable), .z(we[2]));
reg32bit_write write_2 (.clk(clk), .writeEnable(we[2]), .din(writeData), .orgData(r2), .pos(r2));
//assign t2 = r2;
and_gate and_3 (.x(write_sel[3]), .y(writeEnable), .z(we[3]));
reg32bit_write write_3 (.clk(clk), .writeEnable(we[3]), .din(writeData), .orgData(r3), .pos(r3));
//assign t3 = r3;
and_gate and_4 (.x(write_sel[4]), .y(writeEnable), .z(we[4]));
reg32bit_write write_4 (.clk(clk), .writeEnable(we[4]), .din(writeData), .orgData(r4), .pos(r4));
//assign t4 = r4;
and_gate and_5 (.x(write_sel[5]), .y(writeEnable), .z(we[5]));
reg32bit_write write_5 (.clk(clk), .writeEnable(we[5]), .din(writeData), .orgData(r5), .pos(r5));
//assign t5 = r5;
and_gate and_6 (.x(write_sel[6]), .y(writeEnable), .z(we[6]));
reg32bit_write write_6 (.clk(clk), .writeEnable(we[6]), .din(writeData), .orgData(r6), .pos(r6));
//assign t6 = r6;
and_gate and_7 (.x(write_sel[7]), .y(writeEnable), .z(we[7]));
reg32bit_write write_7 (.clk(clk), .writeEnable(we[7]), .din(writeData), .orgData(r7), .pos(r7));
//assign t7 = r7;
and_gate and_8 (.x(write_sel[8]), .y(writeEnable), .z(we[8]));
reg32bit_write write_8 (.clk(clk), .writeEnable(we[8]), .din(writeData), .orgData(r8), .pos(r8));
//assign t8 = r8;
and_gate and_9 (.x(write_sel[9]), .y(writeEnable), .z(we[9]));
reg32bit_write write_9 (.clk(clk), .writeEnable(we[9]), .din(writeData), .orgData(r9), .pos(r9));
//assign t9 = r9;
and_gate and_10 (.x(write_sel[10]), .y(writeEnable), .z(we[10]));
reg32bit_write write_10 (.clk(clk), .writeEnable(we[10]), .din(writeData), .orgData(r10), .pos(r10));
//assign t10 = r10;
and_gate and_11 (.x(write_sel[11]), .y(writeEnable), .z(we[11]));
reg32bit_write write_11 (.clk(clk), .writeEnable(we[11]), .din(writeData), .orgData(r11), .pos(r11));
///assign t11 = r11;
and_gate and_12 (.x(write_sel[12]), .y(writeEnable), .z(we[12]));
reg32bit_write write_12 (.clk(clk), .writeEnable(we[12]), .din(writeData), .orgData(r12), .pos(r12));
//assign t12 = r12;
and_gate and_13 (.x(write_sel[13]), .y(writeEnable), .z(we[13]));
reg32bit_write write_13 (.clk(clk), .writeEnable(we[13]), .din(writeData), .orgData(r13), .pos(r13));
//assign t13 = r13;
and_gate and_14 (.x(write_sel[14]), .y(writeEnable), .z(we[14]));
reg32bit_write write_14 (.clk(clk), .writeEnable(we[14]), .din(writeData), .orgData(r14), .pos(r14));
//assign t14 = r14;
and_gate and_15 (.x(write_sel[15]), .y(writeEnable), .z(we[15]));
reg32bit_write write_15 (.clk(clk), .writeEnable(we[15]), .din(writeData), .orgData(r15), .pos(r15));
//assign t15 = r15;
and_gate and_16 (.x(write_sel[16]), .y(writeEnable), .z(we[16]));
reg32bit_write write_16 (.clk(clk), .writeEnable(we[16]), .din(writeData), .orgData(r16), .pos(r16));
//assign t16 = r16;
and_gate and_17 (.x(write_sel[17]), .y(writeEnable), .z(we[17]));
reg32bit_write write_17 (.clk(clk), .writeEnable(we[17]), .din(writeData), .orgData(r17), .pos(r17));
//assign t17 = r17;
and_gate and_18 (.x(write_sel[18]), .y(writeEnable), .z(we[18]));
reg32bit_write write_18 (.clk(clk), .writeEnable(we[18]), .din(writeData), .orgData(r18), .pos(r18));
//assign t18 = r18;
and_gate and_19 (.x(write_sel[19]), .y(writeEnable), .z(we[19]));
reg32bit_write write_19 (.clk(clk), .writeEnable(we[19]), .din(writeData), .orgData(r19), .pos(r19));
//assign t19 = r19;
and_gate and_20 (.x(write_sel[20]), .y(writeEnable), .z(we[20]));
reg32bit_write write_20 (.clk(clk), .writeEnable(we[20]), .din(writeData), .orgData(r20), .pos(r20));
//assign t20 = r20;
and_gate and_21 (.x(write_sel[21]), .y(writeEnable), .z(we[21]));
reg32bit_write write_21 (.clk(clk), .writeEnable(we[21]), .din(writeData), .orgData(r21), .pos(r21));
//assign t21 = r21;
and_gate and_22 (.x(write_sel[22]), .y(writeEnable), .z(we[22]));
reg32bit_write write_22 (.clk(clk), .writeEnable(we[22]), .din(writeData), .orgData(r22), .pos(r22));
//assign t22 = r22;
and_gate and_23 (.x(write_sel[23]), .y(writeEnable), .z(we[23]));
reg32bit_write write_23 (.clk(clk), .writeEnable(we[23]), .din(writeData), .orgData(r23), .pos(r23));
//assign t23 = r23;
and_gate and_24 (.x(write_sel[24]), .y(writeEnable), .z(we[24]));
reg32bit_write write_24 (.clk(clk), .writeEnable(we[24]), .din(writeData), .orgData(r24), .pos(r24));
//assign t24 = r24;
and_gate and_25 (.x(write_sel[25]), .y(writeEnable), .z(we[25]));
reg32bit_write write_25 (.clk(clk), .writeEnable(we[25]), .din(writeData), .orgData(r25), .pos(r25));
//assign t25 = r25;
and_gate and_26 (.x(write_sel[26]), .y(writeEnable), .z(we[26]));
reg32bit_write write_26 (.clk(clk), .writeEnable(we[26]), .din(writeData), .orgData(r26), .pos(r26));
//assign t26 = r26;
and_gate and_27 (.x(write_sel[27]), .y(writeEnable), .z(we[27]));
reg32bit_write write_27 (.clk(clk), .writeEnable(we[27]), .din(writeData), .orgData(r27), .pos(r27));
//assign t27 = r27;
and_gate and_28 (.x(write_sel[28]), .y(writeEnable), .z(we[28]));
reg32bit_write write_28 (.clk(clk), .writeEnable(we[28]), .din(writeData), .orgData(r28), .pos(r28));
//assign t28 = r28;
and_gate and_29 (.x(write_sel[29]), .y(writeEnable), .z(we[29]));
reg32bit_write write_29 (.clk(clk), .writeEnable(we[29]), .din(writeData), .orgData(r29), .pos(r29));
//assign t29 = r29;
and_gate and_30 (.x(write_sel[30]), .y(writeEnable), .z(we[30]));
reg32bit_write write_30 (.clk(clk), .writeEnable(we[30]), .din(writeData), .orgData(r30), .pos(r30));
//assign t30 = r30;
and_gate and_31 (.x(write_sel[31]), .y(writeEnable), .z(we[31]));
reg32bit_write write_31 (.clk(clk), .writeEnable(we[31]), .din(writeData), .orgData(r31), .pos(r31));
//assign t31 = r31;

mux32to1 mux32_0 (.sel(readReg1x), 
	.r0(r0),.r1(r1),.r2(r2),.r3(r3),
	.r4(r4),.r5(r5),.r6(r6),.r7(r7),
	.r8(r8),.r9(r9),.r10(r10),.r11(r11),
	.r12(r12),.r13(r13),.r14(r14),.r15(r15),
	.r16(r16),.r17(r17),.r18(r18),.r19(r19),
	.r20(r20),.r21(r21),.r22(r22),.r23(r23),
	.r24(r24),.r25(r25),.r26(r26),.r27(r27),
	.r28(r28),.r29(r29),.r30(r30),.r31(r31),
	.dout(readData1));


mux32to1 mux32_1 (.sel(readReg2x), 
	.r0(r0),.r1(r1),.r2(r2),.r3(r3),
	.r4(r4),.r5(r5),.r6(r6),.r7(r7),
	.r8(r8),.r9(r9),.r10(r10),.r11(r11),
	.r12(r12),.r13(r13),.r14(r14),.r15(r15),
	.r16(r16),.r17(r17),.r18(r18),.r19(r19),
	.r20(r20),.r21(r21),.r22(r22),.r23(r23),
	.r24(r24),.r25(r25),.r26(r26),.r27(r27),
	.r28(r28),.r29(r29),.r30(r30),.r31(r31),
	.dout(readData2));


endmodule

