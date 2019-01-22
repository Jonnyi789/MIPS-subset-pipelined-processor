module ALU (A, B, Ctrl, Carryout, Overflow, Zero, Result);
  input [31:0] A;
  input [31:0] B;
  input [3:0] Ctrl;
  output Carryout;
  output Overflow;
  output Zero;
  output wire [31:0] Result;
  
  wire [31:0] Orzero;
  
  wire x01;
  wire x012;
  wire x0123;
  wire [31:0] Result1;
  wire [31:0] Result2;
  
  and_gate and_0 (.x(Ctrl[0]), .y(Ctrl[1]), .z(x01));
  and_gate and_1 (.x(x01), .y(Ctrl[2]), .z(x012));
  and_gate and_2 (.x(x012), .y(Ctrl[3]), .z(x0123));
  
  
  sll sll1 (.A(A), .B(B), .Ctrl(Ctrl), .Result(Result1));
  
  exsll exsll1 (.A(A), .B(B), .Ctrl(Ctrl), .Carryout(Carryout), .Overflow(Overflow), .Result(Result2));
  
  mux_32 mux_0 (.sel(x0123), .src0(Result2), .src1(Result1), .z(Result));
  /* mux mux_0 (.sel(x0123), .src0(Result2[0]), .src1(Result1[0]), .z(Result[0]));
  mux mux_1 (.sel(x0123), .src0(Result2[1]), .src1(Result1[1]), .z(Result[1]));
  mux mux_2 (.sel(x0123), .src0(Result2[2]), .src1(Result1[2]), .z(Result[2]));
  mux mux_3 (.sel(x0123), .src0(Result2[3]), .src1(Result1[3]), .z(Result[3]));
  mux mux_4 (.sel(x0123), .src0(Result2[4]), .src1(Result1[4]), .z(Result[4]));
  mux mux_5 (.sel(x0123), .src0(Result2[5]), .src1(Result1[5]), .z(Result[5]));
  mux mux_6 (.sel(x0123), .src0(Result2[6]), .src1(Result1[6]), .z(Result[6]));
  mux mux_7 (.sel(x0123), .src0(Result2[7]), .src1(Result1[7]), .z(Result[7]));
  mux mux_8 (.sel(x0123), .src0(Result2[8]), .src1(Result1[8]), .z(Result[8]));
  mux mux_9 (.sel(x0123), .src0(Result2[9]), .src1(Result1[9]), .z(Result[9]));
  mux mux_10 (.sel(x0123), .src0(Result2[10]), .src1(Result1[10]), .z(Result[10]));
  mux mux_11 (.sel(x0123), .src0(Result2[11]), .src1(Result1[11]), .z(Result[11]));
  mux mux_12 (.sel(x0123), .src0(Result2[12]), .src1(Result1[12]), .z(Result[12]));
  mux mux_13 (.sel(x0123), .src0(Result2[13]), .src1(Result1[13]), .z(Result[13]));
  mux mux_14 (.sel(x0123), .src0(Result2[14]), .src1(Result1[14]), .z(Result[14]));
  mux mux_15 (.sel(x0123), .src0(Result2[15]), .src1(Result1[15]), .z(Result[15]));
  mux mux_16 (.sel(x0123), .src0(Result2[16]), .src1(Result1[16]), .z(Result[16]));
  mux mux_17 (.sel(x0123), .src0(Result2[17]), .src1(Result1[17]), .z(Result[17]));
  mux mux_18 (.sel(x0123), .src0(Result2[18]), .src1(Result1[18]), .z(Result[18]));
  mux mux_19 (.sel(x0123), .src0(Result2[19]), .src1(Result1[19]), .z(Result[19]));
  mux mux_20 (.sel(x0123), .src0(Result2[20]), .src1(Result1[20]), .z(Result[20]));
  mux mux_21 (.sel(x0123), .src0(Result2[21]), .src1(Result1[21]), .z(Result[21]));
  mux mux_22 (.sel(x0123), .src0(Result2[22]), .src1(Result1[22]), .z(Result[22]));
  mux mux_23 (.sel(x0123), .src0(Result2[23]), .src1(Result1[23]), .z(Result[23]));
  mux mux_24 (.sel(x0123), .src0(Result2[24]), .src1(Result1[24]), .z(Result[24]));
  mux mux_25 (.sel(x0123), .src0(Result2[25]), .src1(Result1[25]), .z(Result[25]));
  mux mux_26 (.sel(x0123), .src0(Result2[26]), .src1(Result1[26]), .z(Result[26]));
  mux mux_27 (.sel(x0123), .src0(Result2[27]), .src1(Result1[27]), .z(Result[27]));
  mux mux_28 (.sel(x0123), .src0(Result2[28]), .src1(Result1[28]), .z(Result[28]));
  mux mux_29 (.sel(x0123), .src0(Result2[29]), .src1(Result1[29]), .z(Result[29]));
  mux mux_30 (.sel(x0123), .src0(Result2[30]), .src1(Result1[30]), .z(Result[30]));
  mux mux_31 (.sel(x0123), .src0(Result2[31]), .src1(Result1[31]), .z(Result[31])); */
  
  or_gate or_1 (.x(Result[0]), .y(Result[1]), .z(Orzero[1]));
  or_gate or_2 (.x(Orzero[1]), .y(Result[2]), .z(Orzero[2]));
  or_gate or_3 (.x(Orzero[2]), .y(Result[3]), .z(Orzero[3]));
  or_gate or_4 (.x(Orzero[3]), .y(Result[4]), .z(Orzero[4]));
  or_gate or_5 (.x(Orzero[4]), .y(Result[5]), .z(Orzero[5]));
  or_gate or_6 (.x(Orzero[5]), .y(Result[6]), .z(Orzero[6]));
  or_gate or_7 (.x(Orzero[6]), .y(Result[7]), .z(Orzero[7]));
  or_gate or_8 (.x(Orzero[7]), .y(Result[8]), .z(Orzero[8]));
  or_gate or_9 (.x(Orzero[8]), .y(Result[9]), .z(Orzero[9]));
  or_gate or_10 (.x(Orzero[9]), .y(Result[10]), .z(Orzero[10]));
  or_gate or_11 (.x(Orzero[10]), .y(Result[11]), .z(Orzero[11]));
  or_gate or_12 (.x(Orzero[11]), .y(Result[12]), .z(Orzero[12]));
  or_gate or_13 (.x(Orzero[12]), .y(Result[13]), .z(Orzero[13]));
  or_gate or_14 (.x(Orzero[13]), .y(Result[14]), .z(Orzero[14]));
  or_gate or_15 (.x(Orzero[14]), .y(Result[15]), .z(Orzero[15]));
  or_gate or_16 (.x(Orzero[15]), .y(Result[16]), .z(Orzero[16]));
  or_gate or_17 (.x(Orzero[16]), .y(Result[17]), .z(Orzero[17]));
  or_gate or_18 (.x(Orzero[17]), .y(Result[18]), .z(Orzero[18]));
  or_gate or_19 (.x(Orzero[18]), .y(Result[19]), .z(Orzero[19]));
  or_gate or_20 (.x(Orzero[19]), .y(Result[20]), .z(Orzero[20]));
  or_gate or_21 (.x(Orzero[20]), .y(Result[21]), .z(Orzero[21]));
  or_gate or_22 (.x(Orzero[21]), .y(Result[22]), .z(Orzero[22]));
  or_gate or_23 (.x(Orzero[22]), .y(Result[23]), .z(Orzero[23]));
  or_gate or_24 (.x(Orzero[23]), .y(Result[24]), .z(Orzero[24]));
  or_gate or_25 (.x(Orzero[24]), .y(Result[25]), .z(Orzero[25]));
  or_gate or_26 (.x(Orzero[25]), .y(Result[26]), .z(Orzero[26]));
  or_gate or_27 (.x(Orzero[26]), .y(Result[27]), .z(Orzero[27]));
  or_gate or_28 (.x(Orzero[27]), .y(Result[28]), .z(Orzero[28]));
  or_gate or_29 (.x(Orzero[28]), .y(Result[29]), .z(Orzero[29]));
  or_gate or_30 (.x(Orzero[29]), .y(Result[30]), .z(Orzero[30]));
  or_gate or_31 (.x(Orzero[30]), .y(Result[31]), .z(Orzero[31]));
  
  not_gate not_1 (.x(Orzero[31]), .z(Zero));
  
  
  
endmodule

