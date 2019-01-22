module ALUctrl (aluop, func, aluctrl);
  input [1:0] aluop;
  input [5:0] func;
  output [3:0] aluctrl;
  
  wire nop1;
  wire nop0;
  wire nfuc5;
  wire nfuc4;
  wire nfuc3;
  wire nfuc2;
  wire nfuc1;
  wire nfuc0;
  wire c4_1;
  wire c4_2;
  wire c4_3;
  wire c4_4;
  wire c4_5;
  wire c4_6;
  wire c4_7;
  wire c4_8;
  wire c3_1;
  wire c3_2;
  wire c3_3;
  wire c3_4;
  wire c3_5;
  wire c2_1;
  wire c2_2;
  wire c2_3;
  wire c2_4;
  wire c1_1;
  wire c1_2;
  wire c1_3;
  wire c1_4;
  
  
  not_gate not_1 (.x(aluop[1]), .z(nop1));
  not_gate not_2 (.x(aluop[0]), .z(nop0));
  not_gate not_3 (.x(func[0]), .z(nfuc0));
  not_gate not_4 (.x(func[1]), .z(nfuc1));
  not_gate not_5 (.x(func[2]), .z(nfuc2));
  not_gate not_6 (.x(func[3]), .z(nfuc3));
  not_gate not_7 (.x(func[4]), .z(nfuc4));
  not_gate not_8 (.x(func[5]), .z(nfuc5));
  
  and_gate and_0 (.x(nop1), .y(aluop[0]), .z(c4_1)); //op=01
  and_gate and0 (.x(nop0), .y(aluop[1]), .z(c4_6)); //op=10
  and_gate and_1 (.x(func[5]), .y(nfuc4), .z(c4_4));
  and_gate and_2 (.x(func[1]), .y(nfuc2), .z(c4_5));
  and_gate and_3 (.x(c4_4), .y(c4_5), .z(c4_2));
  and_gate and_4 (.x(c4_2), .y(c4_6), .z(c4_7));
  and_gate and_5 (.x(c4_3), .y(c4_6), .z(c4_8)); //10_000000
  
  and_6 and_60 (.a(nfuc0),.b(nfuc1),.c(nfuc2),.d(nfuc3),.e(nfuc4),.f(nfuc5), .z(c4_3)); //000000
  or_6 or_63 (.a(c4_1),.b(c4_7),.c(c4_8),.d(1'b0),.e(1'b0),.f(1'b0), .z(aluctrl[3])); 
  
  and_6 and_61 (.a(func[0]),.b(nfuc1),.c(nfuc2),.d(nfuc3),.e(nfuc4),.f(func[5]), .z(c3_4)); //100001
  and_6 and_62 (.a(func[0]),.b(func[1]),.c(nfuc2),.d(func[3]),.e(nfuc4),.f(func[5]), .z(c3_5)); //101011
  and_gate and_6 (.x(c3_4), .y(c4_6), .z(c3_1)); //10_100001
  and_gate and_7 (.x(c3_5), .y(c4_6), .z(c3_2)); //10_101011
  or_6 or_62 (.a(c3_1),.b(c3_2),.c(c4_8),.d(1'b0),.e(1'b0),.f(1'b0), .z(aluctrl[2]));

  and_6 and_63 (.a(1'b1),.b(nfuc1),.c(nfuc2),.d(nfuc3),.e(nfuc4),.f(func[5]), .z(c2_1));
  and_6 and_64 (.a(nfuc0),.b(func[1]),.c(nfuc2),.d(1'b1),.e(nfuc4),.f(func[5]), .z(c2_2));
  and_gate and_8 (.x(c2_1), .y(c4_6), .z(c2_3));
  and_gate and_9 (.x(c2_2), .y(c4_6), .z(c2_4));
  or_6 or_61 (.a(c2_3),.b(c2_4),.c(c4_8),.d(nop1),.e(1'b0),.f(1'b0), .z(aluctrl[1]));
  
  and_6 and_65 (.a(func[0]),.b(nfuc1),.c(func[2]),.d(nfuc3),.e(nfuc4),.f(func[5]), .z(c1_1));
  and_6 and_66 (.a(nfuc0),.b(func[1]),.c(nfuc2),.d(func[3]),.e(nfuc4),.f(func[5]), .z(c1_2));
  and_gate and_10 (.x(c1_1), .y(c4_6), .z(c1_3));
  and_gate and_11 (.x(c1_2), .y(c4_6), .z(c1_4));
  or_6 or_60 (.a(c1_3),.b(c1_4),.c(c4_8),.d(1'b0),.e(1'b0),.f(1'b0), .z(aluctrl[0]));
  
  
endmodule

