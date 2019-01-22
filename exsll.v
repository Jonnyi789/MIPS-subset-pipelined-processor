module exsll (A, B, Ctrl, Carryout, Overflow, Result);
  input [31:0] A;
  input [31:0] B;
  input [3:0] Ctrl;
  output Carryout;
  output Overflow;
  //output wire Zero;
  output [31:0] Result;
  wire [30:0] Carryout0;
  wire set0;
  
  sub0 sub_0 (.A(A[0]), .B(B[0]), .Ctrl(Ctrl), .Less(set0), .Carryout(Carryout0[0]), .Result(Result[0]));
  sub1 sub_1 (.A(A[1]), .B(B[1]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[0]), .Carryout(Carryout0[1]), .Result(Result[1]));
  sub1 sub_2 (.A(A[2]), .B(B[2]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[1]), .Carryout(Carryout0[2]), .Result(Result[2]));
  sub1 sub_3 (.A(A[3]), .B(B[3]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[2]), .Carryout(Carryout0[3]), .Result(Result[3]));
  sub1 sub_4 (.A(A[4]), .B(B[4]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[3]), .Carryout(Carryout0[4]), .Result(Result[4]));
  sub1 sub_5 (.A(A[5]), .B(B[5]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[4]), .Carryout(Carryout0[5]), .Result(Result[5]));
  sub1 sub_6 (.A(A[6]), .B(B[6]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[5]), .Carryout(Carryout0[6]), .Result(Result[6]));
  sub1 sub_7 (.A(A[7]), .B(B[7]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[6]), .Carryout(Carryout0[7]), .Result(Result[7]));
  sub1 sub_8 (.A(A[8]), .B(B[8]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[7]), .Carryout(Carryout0[8]), .Result(Result[8]));
  sub1 sub_9 (.A(A[9]), .B(B[9]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[8]), .Carryout(Carryout0[9]), .Result(Result[9]));
  sub1 sub_10 (.A(A[10]), .B(B[10]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[9]), .Carryout(Carryout0[10]), .Result(Result[10]));
  sub1 sub_11 (.A(A[11]), .B(B[11]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[10]), .Carryout(Carryout0[11]), .Result(Result[11]));
  sub1 sub_12 (.A(A[12]), .B(B[12]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[11]), .Carryout(Carryout0[12]), .Result(Result[12]));
  sub1 sub_13 (.A(A[13]), .B(B[13]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[12]), .Carryout(Carryout0[13]), .Result(Result[13]));
  sub1 sub_14 (.A(A[14]), .B(B[14]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[13]), .Carryout(Carryout0[14]), .Result(Result[14]));
  sub1 sub_15 (.A(A[15]), .B(B[15]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[14]), .Carryout(Carryout0[15]), .Result(Result[15]));
  sub1 sub_16 (.A(A[16]), .B(B[16]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[15]), .Carryout(Carryout0[16]), .Result(Result[16]));
  sub1 sub_17 (.A(A[17]), .B(B[17]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[16]), .Carryout(Carryout0[17]), .Result(Result[17]));
  sub1 sub_18 (.A(A[18]), .B(B[18]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[17]), .Carryout(Carryout0[18]), .Result(Result[18]));
  sub1 sub_19 (.A(A[19]), .B(B[19]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[18]), .Carryout(Carryout0[19]), .Result(Result[19]));
  sub1 sub_20 (.A(A[20]), .B(B[20]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[19]), .Carryout(Carryout0[20]), .Result(Result[20]));
  sub1 sub_21 (.A(A[21]), .B(B[21]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[20]), .Carryout(Carryout0[21]), .Result(Result[21]));
  sub1 sub_22 (.A(A[22]), .B(B[22]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[21]), .Carryout(Carryout0[22]), .Result(Result[22]));
  sub1 sub_23 (.A(A[23]), .B(B[23]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[22]), .Carryout(Carryout0[23]), .Result(Result[23]));
  sub1 sub_24 (.A(A[24]), .B(B[24]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[23]), .Carryout(Carryout0[24]), .Result(Result[24]));
  sub1 sub_25 (.A(A[25]), .B(B[25]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[24]), .Carryout(Carryout0[25]), .Result(Result[25]));
  sub1 sub_26 (.A(A[26]), .B(B[26]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[25]), .Carryout(Carryout0[26]), .Result(Result[26]));
  sub1 sub_27 (.A(A[27]), .B(B[27]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[26]), .Carryout(Carryout0[27]), .Result(Result[27]));
  sub1 sub_28 (.A(A[28]), .B(B[28]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[27]), .Carryout(Carryout0[28]), .Result(Result[28]));
  sub1 sub_29 (.A(A[29]), .B(B[29]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[28]), .Carryout(Carryout0[29]), .Result(Result[29]));
  sub1 sub_30 (.A(A[30]), .B(B[30]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[29]), .Carryout(Carryout0[30]), .Result(Result[30]));
  sub2 sub_31 (.A(A[31]), .B(B[31]), .Ctrl(Ctrl), .Less(1'b0), .Carryin(Carryout0[30]), .Carryout(Carryout), .Result(Result[31]), .set(set0), .Overflow(Overflow));
  
  //assign Zero = (~((Result[0])|(Result[1])|(Result[2])|(Result[3])|(Result[4])|(Result[5])|(Result[6])|(Result[7])|(Result[8])|(Result[9])|(Result[10])|(Result[11])|(Result[12])|(Result[13])|(Result[14])|(Result[15])|(Result[16])|(Result[17])|(Result[18])|(Result[19])|(Result[20])|(Result[21])|(Result[22])|(Result[23])|(Result[24])|(Result[25])|(Result[26])|(Result[27])|(Result[28])|(Result[29])|(Result[30])|(Result[31])));
  
  
endmodule

