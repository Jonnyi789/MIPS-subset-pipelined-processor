module sub0 (A, B, Ctrl, Less, Carryout, Result);
  input A;
  input B;
  input [3:0] Ctrl;
  input Less;
  output Carryout;
  output Result;
  wire Carryin;
  wire rst_and;
  wire rst_or;
  wire rst_add;
  wire rst_xor;
  wire rst_sub;
  wire Carryout_add;
  wire Carryout_sub;
  wire x1;  // A&(~B)
  wire x2;  // B&(~A)
  wire x3;  // (~B)&(~A)
  wire x4;  // A&(~B)&(~Carryin)
  wire x5;  // B&(~A)&(~Carryin)
  wire x6;  // Carryin&(~B)&(~A)
  wire x7;  // A&B&Carryin
  wire x8;  // A&Carryin
  wire x9;  // B&Carryin
  wire xa;  // (~B)&Carryin
  wire x89;
  wire x8a;
  wire x4s;
  wire x5s;
  wire x6s;
  wire x7s;
  
  wire x45;
  wire x456;
  wire x45s;
  wire x456s;
  
  wire xx1;
  wire xx2;
  wire xx3;
  wire xx4;
  wire xx5;
  
  wire y1;  // ~A
  wire y2;  // ~B
  wire y3;  // ~Carryin
  not_gate not_A (.x(A), .z(y1));
  not_gate not_B (.x(B), .z(y2));
  not_gate not_C (.x(Carryin), .z(y3));
  
  
  and_gate and_0 (.x(Ctrl[3]), .y(1'b1), .z(Carryin));
  and_gate and_1 (.x(A), .y(B), .z(rst_and));
  or_gate or_1 (.x(A), .y(B), .z(rst_or));
  xor_gate xor_1 (.x(A), .y(B), .z(rst_xor));
  
  and_gate and_2 (.x(A), .y(y2), .z(x1));
  and_gate and_3 (.x(y1), .y(B), .z(x2));
  and_gate and_4 (.x(y1), .y(y2), .z(x3));
  and_gate and_5 (.x(x1), .y(y3), .z(x4));
  and_gate and_6 (.x(x2), .y(y3), .z(x5));
  and_gate and_7 (.x(x3), .y(Carryin), .z(x6));
  and_gate and_8 (.x(rst_and), .y(Carryin), .z(x7));
  and_gate and_9 (.x(A), .y(Carryin), .z(x8));
  and_gate and_10 (.x(B), .y(Carryin), .z(x9));
  and_gate and_11 (.x(y2), .y(Carryin), .z(xa));
  
  and_gate and_5s (.x(rst_and), .y(y3), .z(x4s));
  and_gate and_6s (.x(x3), .y(y3), .z(x5s));
  and_gate and_7s (.x(x1), .y(Carryin), .z(x6s));
  and_gate and_8s (.x(x2), .y(Carryin), .z(x7s));
  
  or_gate or_2 (.x(x4), .y(x5), .z(x45));
  or_gate or_3 (.x(x45), .y(x6), .z(x456));
  or_gate or_4 (.x(x456), .y(x7), .z(rst_add));
  
  or_gate or_2s (.x(x4s), .y(x5s), .z(x45s));
  or_gate or_3s (.x(x45s), .y(x6s), .z(x456s));
  or_gate or_4s (.x(x456s), .y(x7s), .z(rst_sub));
  
  or_gate or_5 (.x(x8), .y(x9), .z(x89));
  or_gate or_6 (.x(x89), .y(rst_and), .z(Carryout_add));
  
  or_gate or_7 (.x(x8), .y(xa), .z(x8a));
  or_gate or_8 (.x(x8a), .y(x1), .z(Carryout_sub));
  
  
  // assign Carryin = Ctrl[3];
  //assign rst_add = ((A&(~B)&(~Carryin))|(B&(~A)&(~Carryin))|(Carryin&(~B)&(~A))|(A&B&Carryin)) ;
  //assign rst_sub = ((A&B&(~Carryin))|((~B)&(~A)&(~Carryin))|(Carryin&B&(~A))|(A&(~B)&Carryin)) ;
  //assign Carryout_add = ((B&Carryin)|(A&Carryin)|(A&B)) ;
  //assign Carryout_sub = (((~B)&Carryin)|(A&Carryin)|(A&(~B))) ;
  mux mux_1 (.sel(Ctrl[3]), .src0(xx1), .src1(xx2), .z(Result));
  mux mux_2 (.sel(Ctrl[1]), .src0(xx3), .src1(xx4), .z(xx1));
  mux mux_3 (.sel(Ctrl[0]), .src0(rst_and), .src1(rst_or), .z(xx3));
  mux mux_4 (.sel(Ctrl[0]), .src0(rst_add), .src1(rst_xor), .z(xx4));
  mux mux_2s (.sel(Ctrl[2]), .src0(xx5), .src1(Less), .z(xx2));
  mux mux_3s (.sel(Ctrl[0]), .src0(rst_sub), .src1(Less), .z(xx5));
  
  mux mux_5 (.sel(Ctrl[3]), .src0(Carryout_add), .src1(Carryout_sub), .z(Carryout));
  
/*   always @(A, B, Ctrl, Less, Carryin) begin
    case (Ctrl)
	  0: Result <= rst_and;
	  1: Result <= rst_or;
	  2: Result <= rst_add;
	  3: Result <= rst_xor;
	  10: Result <= rst_sub;
	  11: Result <= Less;
	  12: Result <= Less;
	  default: Result <= 0;
    endcase
    case (Ctrl)
	  2: Carryout <= Carryout_add;
	  10: Carryout <= Carryout_sub;
	  11: Carryout <= Carryout_sub;
	  12: Carryout <= Carryout_sub;
	  default: Carryout <= 0;
    endcase
	
  end */
  
endmodule

