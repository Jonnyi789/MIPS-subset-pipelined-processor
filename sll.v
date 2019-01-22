module sll (A, B, Ctrl, Result);
  input [31:0] A;
  input [31:0] B;
  input [3:0] Ctrl;
  //output wire Carryout;
  //output wire Overflow;
  //output wire Zero;
  output wire [31:0] Result;
  wire [31:0] Orzero;
  wire [31:0] A_1_out;
  wire [31:0] A_2_out;
  wire [31:0] A_3_out;
  wire [31:0] A_4_out;
  wire [31:0] A_5_out;
/*   wire [31:0] A_6_out;
  wire [31:0] A_7_out;
  wire [31:0] A_8_out;
  wire [31:0] A_9_out;
  wire [31:0] A_10_out;
  wire [31:0] A_11_out;
  wire [31:0] A_12_out;
  wire [31:0] A_13_out;
  wire [31:0] A_14_out;
  wire [31:0] A_15_out;
  wire [31:0] A_16_out;
  wire [31:0] A_17_out;
  wire [31:0] A_18_out;
  wire [31:0] A_19_out;
  wire [31:0] A_20_out;
  wire [31:0] A_21_out;
  wire [31:0] A_22_out;
  wire [31:0] A_23_out;
  wire [31:0] A_24_out;
  wire [31:0] A_25_out;
  wire [31:0] A_26_out;
  wire [31:0] A_27_out;
  wire [31:0] A_28_out;
  wire [31:0] A_29_out;
  wire [31:0] A_30_out;
  wire [31:0] A_31_out; */
  
  mux mux10 (.sel(B[0]), .src0(A[0]), .src1(1'b0), .z(A_1_out[0]));
  mux mux11 (.sel(B[0]), .src0(A[1]), .src1(A[0]), .z(A_1_out[1]));
  mux mux12 (.sel(B[0]), .src0(A[2]), .src1(A[1]), .z(A_1_out[2]));
  mux mux13 (.sel(B[0]), .src0(A[3]), .src1(A[2]), .z(A_1_out[3]));
  mux mux14 (.sel(B[0]), .src0(A[4]), .src1(A[3]), .z(A_1_out[4]));
  mux mux15 (.sel(B[0]), .src0(A[5]), .src1(A[4]), .z(A_1_out[5]));
  mux mux16 (.sel(B[0]), .src0(A[6]), .src1(A[5]), .z(A_1_out[6]));
  mux mux17 (.sel(B[0]), .src0(A[7]), .src1(A[6]), .z(A_1_out[7]));
  mux mux18 (.sel(B[0]), .src0(A[8]), .src1(A[7]), .z(A_1_out[8]));
  mux mux19 (.sel(B[0]), .src0(A[9]), .src1(A[8]), .z(A_1_out[9]));
  mux mux110 (.sel(B[0]), .src0(A[10]), .src1(A[9]), .z(A_1_out[10]));
  mux mux111 (.sel(B[0]), .src0(A[11]), .src1(A[10]), .z(A_1_out[11]));
  mux mux112 (.sel(B[0]), .src0(A[12]), .src1(A[11]), .z(A_1_out[12]));
  mux mux113 (.sel(B[0]), .src0(A[13]), .src1(A[12]), .z(A_1_out[13]));
  mux mux114 (.sel(B[0]), .src0(A[14]), .src1(A[13]), .z(A_1_out[14]));
  mux mux115 (.sel(B[0]), .src0(A[15]), .src1(A[14]), .z(A_1_out[15]));
  mux mux116 (.sel(B[0]), .src0(A[16]), .src1(A[15]), .z(A_1_out[16]));
  mux mux117 (.sel(B[0]), .src0(A[17]), .src1(A[16]), .z(A_1_out[17]));
  mux mux118 (.sel(B[0]), .src0(A[18]), .src1(A[17]), .z(A_1_out[18]));
  mux mux119 (.sel(B[0]), .src0(A[19]), .src1(A[18]), .z(A_1_out[19]));
  mux mux120 (.sel(B[0]), .src0(A[20]), .src1(A[19]), .z(A_1_out[20]));
  mux mux121 (.sel(B[0]), .src0(A[21]), .src1(A[20]), .z(A_1_out[21]));
  mux mux122 (.sel(B[0]), .src0(A[22]), .src1(A[21]), .z(A_1_out[22]));
  mux mux123 (.sel(B[0]), .src0(A[23]), .src1(A[22]), .z(A_1_out[23]));
  mux mux124 (.sel(B[0]), .src0(A[24]), .src1(A[23]), .z(A_1_out[24]));
  mux mux125 (.sel(B[0]), .src0(A[25]), .src1(A[24]), .z(A_1_out[25]));
  mux mux126 (.sel(B[0]), .src0(A[26]), .src1(A[25]), .z(A_1_out[26]));
  mux mux127 (.sel(B[0]), .src0(A[27]), .src1(A[26]), .z(A_1_out[27]));
  mux mux128 (.sel(B[0]), .src0(A[28]), .src1(A[27]), .z(A_1_out[28]));
  mux mux129 (.sel(B[0]), .src0(A[29]), .src1(A[28]), .z(A_1_out[29]));
  mux mux130 (.sel(B[0]), .src0(A[30]), .src1(A[29]), .z(A_1_out[30]));
  mux mux131 (.sel(B[0]), .src0(A[31]), .src1(A[30]), .z(A_1_out[31]));
  
  mux mux20 (.sel(B[1]), .src0(A_1_out[0]), .src1(1'b0), .z(A_2_out[0]));
  mux mux21 (.sel(B[1]), .src0(A_1_out[1]), .src1(1'b0), .z(A_2_out[1]));
  mux mux22 (.sel(B[1]), .src0(A_1_out[2]), .src1(A_1_out[0]), .z(A_2_out[2]));
  mux mux23 (.sel(B[1]), .src0(A_1_out[3]), .src1(A_1_out[1]), .z(A_2_out[3]));
  mux mux24 (.sel(B[1]), .src0(A_1_out[4]), .src1(A_1_out[2]), .z(A_2_out[4]));
  mux mux25 (.sel(B[1]), .src0(A_1_out[5]), .src1(A_1_out[3]), .z(A_2_out[5]));
  mux mux26 (.sel(B[1]), .src0(A_1_out[6]), .src1(A_1_out[4]), .z(A_2_out[6]));
  mux mux27 (.sel(B[1]), .src0(A_1_out[7]), .src1(A_1_out[5]), .z(A_2_out[7]));
  mux mux28 (.sel(B[1]), .src0(A_1_out[8]), .src1(A_1_out[6]), .z(A_2_out[8]));
  mux mux29 (.sel(B[1]), .src0(A_1_out[9]), .src1(A_1_out[7]), .z(A_2_out[9]));
  mux mux210 (.sel(B[1]), .src0(A_1_out[10]), .src1(A_1_out[8]), .z(A_2_out[10]));
  mux mux211 (.sel(B[1]), .src0(A_1_out[11]), .src1(A_1_out[9]), .z(A_2_out[11]));
  mux mux212 (.sel(B[1]), .src0(A_1_out[12]), .src1(A_1_out[10]), .z(A_2_out[12]));
  mux mux213 (.sel(B[1]), .src0(A_1_out[13]), .src1(A_1_out[11]), .z(A_2_out[13]));
  mux mux214 (.sel(B[1]), .src0(A_1_out[14]), .src1(A_1_out[12]), .z(A_2_out[14]));
  mux mux215 (.sel(B[1]), .src0(A_1_out[15]), .src1(A_1_out[13]), .z(A_2_out[15]));
  mux mux216 (.sel(B[1]), .src0(A_1_out[16]), .src1(A_1_out[14]), .z(A_2_out[16]));
  mux mux217 (.sel(B[1]), .src0(A_1_out[17]), .src1(A_1_out[15]), .z(A_2_out[17]));
  mux mux218 (.sel(B[1]), .src0(A_1_out[18]), .src1(A_1_out[16]), .z(A_2_out[18]));
  mux mux219 (.sel(B[1]), .src0(A_1_out[19]), .src1(A_1_out[17]), .z(A_2_out[19]));
  mux mux220 (.sel(B[1]), .src0(A_1_out[20]), .src1(A_1_out[18]), .z(A_2_out[20]));
  mux mux221 (.sel(B[1]), .src0(A_1_out[21]), .src1(A_1_out[19]), .z(A_2_out[21]));
  mux mux222 (.sel(B[1]), .src0(A_1_out[22]), .src1(A_1_out[20]), .z(A_2_out[22]));
  mux mux223 (.sel(B[1]), .src0(A_1_out[23]), .src1(A_1_out[21]), .z(A_2_out[23]));
  mux mux224 (.sel(B[1]), .src0(A_1_out[24]), .src1(A_1_out[22]), .z(A_2_out[24]));
  mux mux225 (.sel(B[1]), .src0(A_1_out[25]), .src1(A_1_out[23]), .z(A_2_out[25]));
  mux mux226 (.sel(B[1]), .src0(A_1_out[26]), .src1(A_1_out[24]), .z(A_2_out[26]));
  mux mux227 (.sel(B[1]), .src0(A_1_out[27]), .src1(A_1_out[25]), .z(A_2_out[27]));
  mux mux228 (.sel(B[1]), .src0(A_1_out[28]), .src1(A_1_out[26]), .z(A_2_out[28]));
  mux mux229 (.sel(B[1]), .src0(A_1_out[29]), .src1(A_1_out[27]), .z(A_2_out[29]));
  mux mux230 (.sel(B[1]), .src0(A_1_out[30]), .src1(A_1_out[28]), .z(A_2_out[30]));
  mux mux231 (.sel(B[1]), .src0(A_1_out[31]), .src1(A_1_out[29]), .z(A_2_out[31]));

  mux mux30 (.sel(B[2]), .src0(A_2_out[0]), .src1(1'b0), .z(A_3_out[0]));
  mux mux31 (.sel(B[2]), .src0(A_2_out[1]), .src1(1'b0), .z(A_3_out[1]));
  mux mux32 (.sel(B[2]), .src0(A_2_out[2]), .src1(1'b0), .z(A_3_out[2]));
  mux mux33 (.sel(B[2]), .src0(A_2_out[3]), .src1(1'b0), .z(A_3_out[3]));
  mux mux34 (.sel(B[2]), .src0(A_2_out[4]), .src1(A_2_out[0]), .z(A_3_out[4]));
  mux mux35 (.sel(B[2]), .src0(A_2_out[5]), .src1(A_2_out[1]), .z(A_3_out[5]));
  mux mux36 (.sel(B[2]), .src0(A_2_out[6]), .src1(A_2_out[2]), .z(A_3_out[6]));
  mux mux37 (.sel(B[2]), .src0(A_2_out[7]), .src1(A_2_out[3]), .z(A_3_out[7]));
  mux mux38 (.sel(B[2]), .src0(A_2_out[8]), .src1(A_2_out[4]), .z(A_3_out[8]));
  mux mux39 (.sel(B[2]), .src0(A_2_out[9]), .src1(A_2_out[5]), .z(A_3_out[9]));
  mux mux310 (.sel(B[2]), .src0(A_2_out[10]), .src1(A_2_out[6]), .z(A_3_out[10]));
  mux mux311 (.sel(B[2]), .src0(A_2_out[11]), .src1(A_2_out[7]), .z(A_3_out[11]));
  mux mux312 (.sel(B[2]), .src0(A_2_out[12]), .src1(A_2_out[8]), .z(A_3_out[12]));
  mux mux313 (.sel(B[2]), .src0(A_2_out[13]), .src1(A_2_out[9]), .z(A_3_out[13]));
  mux mux314 (.sel(B[2]), .src0(A_2_out[14]), .src1(A_2_out[10]), .z(A_3_out[14]));
  mux mux315 (.sel(B[2]), .src0(A_2_out[15]), .src1(A_2_out[11]), .z(A_3_out[15]));
  mux mux316 (.sel(B[2]), .src0(A_2_out[16]), .src1(A_2_out[12]), .z(A_3_out[16]));
  mux mux317 (.sel(B[2]), .src0(A_2_out[17]), .src1(A_2_out[13]), .z(A_3_out[17]));
  mux mux318 (.sel(B[2]), .src0(A_2_out[18]), .src1(A_2_out[14]), .z(A_3_out[18]));
  mux mux319 (.sel(B[2]), .src0(A_2_out[19]), .src1(A_2_out[15]), .z(A_3_out[19]));
  mux mux320 (.sel(B[2]), .src0(A_2_out[20]), .src1(A_2_out[16]), .z(A_3_out[20]));
  mux mux321 (.sel(B[2]), .src0(A_2_out[21]), .src1(A_2_out[17]), .z(A_3_out[21]));
  mux mux322 (.sel(B[2]), .src0(A_2_out[22]), .src1(A_2_out[18]), .z(A_3_out[22]));
  mux mux323 (.sel(B[2]), .src0(A_2_out[23]), .src1(A_2_out[19]), .z(A_3_out[23]));
  mux mux324 (.sel(B[2]), .src0(A_2_out[24]), .src1(A_2_out[20]), .z(A_3_out[24]));
  mux mux325 (.sel(B[2]), .src0(A_2_out[25]), .src1(A_2_out[21]), .z(A_3_out[25]));
  mux mux326 (.sel(B[2]), .src0(A_2_out[26]), .src1(A_2_out[22]), .z(A_3_out[26]));
  mux mux327 (.sel(B[2]), .src0(A_2_out[27]), .src1(A_2_out[23]), .z(A_3_out[27]));
  mux mux328 (.sel(B[2]), .src0(A_2_out[28]), .src1(A_2_out[24]), .z(A_3_out[28]));
  mux mux329 (.sel(B[2]), .src0(A_2_out[29]), .src1(A_2_out[25]), .z(A_3_out[29]));
  mux mux330 (.sel(B[2]), .src0(A_2_out[30]), .src1(A_2_out[26]), .z(A_3_out[30]));
  mux mux331 (.sel(B[2]), .src0(A_2_out[31]), .src1(A_2_out[27]), .z(A_3_out[31]));
  
  mux mux40 (.sel(B[3]), .src0(A_3_out[0]), .src1(1'b0), .z(A_4_out[0]));
  mux mux41 (.sel(B[3]), .src0(A_3_out[1]), .src1(1'b0), .z(A_4_out[1]));
  mux mux42 (.sel(B[3]), .src0(A_3_out[2]), .src1(1'b0), .z(A_4_out[2]));
  mux mux43 (.sel(B[3]), .src0(A_3_out[3]), .src1(1'b0), .z(A_4_out[3]));
  mux mux44 (.sel(B[3]), .src0(A_3_out[4]), .src1(1'b0), .z(A_4_out[4]));
  mux mux45 (.sel(B[3]), .src0(A_3_out[5]), .src1(1'b0), .z(A_4_out[5]));
  mux mux46 (.sel(B[3]), .src0(A_3_out[6]), .src1(1'b0), .z(A_4_out[6]));
  mux mux47 (.sel(B[3]), .src0(A_3_out[7]), .src1(1'b0), .z(A_4_out[7]));
  mux mux48 (.sel(B[3]), .src0(A_3_out[8]), .src1(A_3_out[0]), .z(A_4_out[8]));
  mux mux49 (.sel(B[3]), .src0(A_3_out[9]), .src1(A_3_out[1]), .z(A_4_out[9]));
  mux mux410 (.sel(B[3]), .src0(A_3_out[10]), .src1(A_3_out[2]), .z(A_4_out[10]));
  mux mux411 (.sel(B[3]), .src0(A_3_out[11]), .src1(A_3_out[3]), .z(A_4_out[11]));
  mux mux412 (.sel(B[3]), .src0(A_3_out[12]), .src1(A_3_out[4]), .z(A_4_out[12]));
  mux mux413 (.sel(B[3]), .src0(A_3_out[13]), .src1(A_3_out[5]), .z(A_4_out[13]));
  mux mux414 (.sel(B[3]), .src0(A_3_out[14]), .src1(A_3_out[6]), .z(A_4_out[14]));
  mux mux415 (.sel(B[3]), .src0(A_3_out[15]), .src1(A_3_out[7]), .z(A_4_out[15]));
  mux mux416 (.sel(B[3]), .src0(A_3_out[16]), .src1(A_3_out[8]), .z(A_4_out[16]));
  mux mux417 (.sel(B[3]), .src0(A_3_out[17]), .src1(A_3_out[9]), .z(A_4_out[17]));
  mux mux418 (.sel(B[3]), .src0(A_3_out[18]), .src1(A_3_out[10]), .z(A_4_out[18]));
  mux mux419 (.sel(B[3]), .src0(A_3_out[19]), .src1(A_3_out[11]), .z(A_4_out[19]));
  mux mux420 (.sel(B[3]), .src0(A_3_out[20]), .src1(A_3_out[12]), .z(A_4_out[20]));
  mux mux421 (.sel(B[3]), .src0(A_3_out[21]), .src1(A_3_out[13]), .z(A_4_out[21]));
  mux mux422 (.sel(B[3]), .src0(A_3_out[22]), .src1(A_3_out[14]), .z(A_4_out[22]));
  mux mux423 (.sel(B[3]), .src0(A_3_out[23]), .src1(A_3_out[15]), .z(A_4_out[23]));
  mux mux424 (.sel(B[3]), .src0(A_3_out[24]), .src1(A_3_out[16]), .z(A_4_out[24]));
  mux mux425 (.sel(B[3]), .src0(A_3_out[25]), .src1(A_3_out[17]), .z(A_4_out[25]));
  mux mux426 (.sel(B[3]), .src0(A_3_out[26]), .src1(A_3_out[18]), .z(A_4_out[26]));
  mux mux427 (.sel(B[3]), .src0(A_3_out[27]), .src1(A_3_out[19]), .z(A_4_out[27]));
  mux mux428 (.sel(B[3]), .src0(A_3_out[28]), .src1(A_3_out[20]), .z(A_4_out[28]));
  mux mux429 (.sel(B[3]), .src0(A_3_out[29]), .src1(A_3_out[21]), .z(A_4_out[29]));
  mux mux430 (.sel(B[3]), .src0(A_3_out[30]), .src1(A_3_out[22]), .z(A_4_out[30]));
  mux mux431 (.sel(B[3]), .src0(A_3_out[31]), .src1(A_3_out[23]), .z(A_4_out[31]));
  
  mux mux50 (.sel(B[4]), .src0(A_4_out[0]), .src1(1'b0), .z(A_5_out[0]));
  mux mux51 (.sel(B[4]), .src0(A_4_out[1]), .src1(1'b0), .z(A_5_out[1]));
  mux mux52 (.sel(B[4]), .src0(A_4_out[2]), .src1(1'b0), .z(A_5_out[2]));
  mux mux53 (.sel(B[4]), .src0(A_4_out[3]), .src1(1'b0), .z(A_5_out[3]));
  mux mux54 (.sel(B[4]), .src0(A_4_out[4]), .src1(1'b0), .z(A_5_out[4]));
  mux mux55 (.sel(B[4]), .src0(A_4_out[5]), .src1(1'b0), .z(A_5_out[5]));
  mux mux56 (.sel(B[4]), .src0(A_4_out[6]), .src1(1'b0), .z(A_5_out[6]));
  mux mux57 (.sel(B[4]), .src0(A_4_out[7]), .src1(1'b0), .z(A_5_out[7]));
  mux mux58 (.sel(B[4]), .src0(A_4_out[8]), .src1(1'b0), .z(A_5_out[8]));
  mux mux59 (.sel(B[4]), .src0(A_4_out[9]), .src1(1'b0), .z(A_5_out[9]));
  mux mux510 (.sel(B[4]), .src0(A_4_out[10]), .src1(1'b0), .z(A_5_out[10]));
  mux mux511 (.sel(B[4]), .src0(A_4_out[11]), .src1(1'b0), .z(A_5_out[11]));
  mux mux512 (.sel(B[4]), .src0(A_4_out[12]), .src1(1'b0), .z(A_5_out[12]));
  mux mux513 (.sel(B[4]), .src0(A_4_out[13]), .src1(1'b0), .z(A_5_out[13]));
  mux mux514 (.sel(B[4]), .src0(A_4_out[14]), .src1(1'b0), .z(A_5_out[14]));
  mux mux515 (.sel(B[4]), .src0(A_4_out[15]), .src1(1'b0), .z(A_5_out[15]));
  mux mux516 (.sel(B[4]), .src0(A_4_out[16]), .src1(A_4_out[0]), .z(A_5_out[16]));
  mux mux517 (.sel(B[4]), .src0(A_4_out[17]), .src1(A_4_out[1]), .z(A_5_out[17]));
  mux mux518 (.sel(B[4]), .src0(A_4_out[18]), .src1(A_4_out[2]), .z(A_5_out[18]));
  mux mux519 (.sel(B[4]), .src0(A_4_out[19]), .src1(A_4_out[3]), .z(A_5_out[19]));
  mux mux520 (.sel(B[4]), .src0(A_4_out[20]), .src1(A_4_out[4]), .z(A_5_out[20]));
  mux mux521 (.sel(B[4]), .src0(A_4_out[21]), .src1(A_4_out[5]), .z(A_5_out[21]));
  mux mux522 (.sel(B[4]), .src0(A_4_out[22]), .src1(A_4_out[6]), .z(A_5_out[22]));
  mux mux523 (.sel(B[4]), .src0(A_4_out[23]), .src1(A_4_out[7]), .z(A_5_out[23]));
  mux mux524 (.sel(B[4]), .src0(A_4_out[24]), .src1(A_4_out[8]), .z(A_5_out[24]));
  mux mux525 (.sel(B[4]), .src0(A_4_out[25]), .src1(A_4_out[9]), .z(A_5_out[25]));
  mux mux526 (.sel(B[4]), .src0(A_4_out[26]), .src1(A_4_out[10]), .z(A_5_out[26]));
  mux mux527 (.sel(B[4]), .src0(A_4_out[27]), .src1(A_4_out[11]), .z(A_5_out[27]));
  mux mux528 (.sel(B[4]), .src0(A_4_out[28]), .src1(A_4_out[12]), .z(A_5_out[28]));
  mux mux529 (.sel(B[4]), .src0(A_4_out[29]), .src1(A_4_out[13]), .z(A_5_out[29]));
  mux mux530 (.sel(B[4]), .src0(A_4_out[30]), .src1(A_4_out[14]), .z(A_5_out[30]));
  mux mux531 (.sel(B[4]), .src0(A_4_out[31]), .src1(A_4_out[15]), .z(A_5_out[31]));
  
  //assign Result = A_5_out;
  
  or_gate or_6 (.x(B[5]), .y(B[6]), .z(Orzero[6]));
  or_gate or_7 (.x(Orzero[6]), .y(B[7]), .z(Orzero[7]));
  or_gate or_8 (.x(Orzero[7]), .y(B[8]), .z(Orzero[8]));
  or_gate or_9 (.x(Orzero[8]), .y(B[9]), .z(Orzero[9]));
  or_gate or_10 (.x(Orzero[9]), .y(B[10]), .z(Orzero[10]));
  or_gate or_11 (.x(Orzero[10]), .y(B[11]), .z(Orzero[11]));
  or_gate or_12 (.x(Orzero[11]), .y(B[12]), .z(Orzero[12]));
  or_gate or_13 (.x(Orzero[12]), .y(B[13]), .z(Orzero[13]));
  or_gate or_14 (.x(Orzero[13]), .y(B[14]), .z(Orzero[14]));
  or_gate or_15 (.x(Orzero[14]), .y(B[15]), .z(Orzero[15]));
  or_gate or_16 (.x(Orzero[15]), .y(B[16]), .z(Orzero[16]));
  or_gate or_17 (.x(Orzero[16]), .y(B[17]), .z(Orzero[17]));
  or_gate or_18 (.x(Orzero[17]), .y(B[18]), .z(Orzero[18]));
  or_gate or_19 (.x(Orzero[18]), .y(B[19]), .z(Orzero[19]));
  or_gate or_20 (.x(Orzero[19]), .y(B[20]), .z(Orzero[20]));
  or_gate or_21 (.x(Orzero[20]), .y(B[21]), .z(Orzero[21]));
  or_gate or_22 (.x(Orzero[21]), .y(B[22]), .z(Orzero[22]));
  or_gate or_23 (.x(Orzero[22]), .y(B[23]), .z(Orzero[23]));
  or_gate or_24 (.x(Orzero[23]), .y(B[24]), .z(Orzero[24]));
  or_gate or_25 (.x(Orzero[24]), .y(B[25]), .z(Orzero[25]));
  or_gate or_26 (.x(Orzero[25]), .y(B[26]), .z(Orzero[26]));
  or_gate or_27 (.x(Orzero[26]), .y(B[27]), .z(Orzero[27]));
  or_gate or_28 (.x(Orzero[27]), .y(B[28]), .z(Orzero[28]));
  or_gate or_29 (.x(Orzero[28]), .y(B[29]), .z(Orzero[29]));
  or_gate or_30 (.x(Orzero[29]), .y(B[30]), .z(Orzero[30]));
  or_gate or_31 (.x(Orzero[30]), .y(B[31]), .z(Orzero[31]));
  
  mux mux60 (.sel(Orzero[31]), .src0(A_5_out[0]), .src1(1'b0), .z(Result[0]));
  mux mux61 (.sel(Orzero[31]), .src0(A_5_out[1]), .src1(1'b0), .z(Result[1]));
  mux mux62 (.sel(Orzero[31]), .src0(A_5_out[2]), .src1(1'b0), .z(Result[2]));
  mux mux63 (.sel(Orzero[31]), .src0(A_5_out[3]), .src1(1'b0), .z(Result[3]));
  mux mux64 (.sel(Orzero[31]), .src0(A_5_out[4]), .src1(1'b0), .z(Result[4]));
  mux mux65 (.sel(Orzero[31]), .src0(A_5_out[5]), .src1(1'b0), .z(Result[5]));
  mux mux66 (.sel(Orzero[31]), .src0(A_5_out[6]), .src1(1'b0), .z(Result[6]));
  mux mux67 (.sel(Orzero[31]), .src0(A_5_out[7]), .src1(1'b0), .z(Result[7]));
  mux mux68 (.sel(Orzero[31]), .src0(A_5_out[8]), .src1(1'b0), .z(Result[8]));
  mux mux69 (.sel(Orzero[31]), .src0(A_5_out[9]), .src1(1'b0), .z(Result[9]));
  mux mux610 (.sel(Orzero[31]), .src0(A_5_out[10]), .src1(1'b0), .z(Result[10]));
  mux mux611 (.sel(Orzero[31]), .src0(A_5_out[11]), .src1(1'b0), .z(Result[11]));
  mux mux612 (.sel(Orzero[31]), .src0(A_5_out[12]), .src1(1'b0), .z(Result[12]));
  mux mux613 (.sel(Orzero[31]), .src0(A_5_out[13]), .src1(1'b0), .z(Result[13]));
  mux mux614 (.sel(Orzero[31]), .src0(A_5_out[14]), .src1(1'b0), .z(Result[14]));
  mux mux615 (.sel(Orzero[31]), .src0(A_5_out[15]), .src1(1'b0), .z(Result[15]));
  mux mux616 (.sel(Orzero[31]), .src0(A_5_out[16]), .src1(1'b0), .z(Result[16]));
  mux mux617 (.sel(Orzero[31]), .src0(A_5_out[17]), .src1(1'b0), .z(Result[17]));
  mux mux618 (.sel(Orzero[31]), .src0(A_5_out[18]), .src1(1'b0), .z(Result[18]));
  mux mux619 (.sel(Orzero[31]), .src0(A_5_out[19]), .src1(1'b0), .z(Result[19]));
  mux mux620 (.sel(Orzero[31]), .src0(A_5_out[20]), .src1(1'b0), .z(Result[20]));
  mux mux621 (.sel(Orzero[31]), .src0(A_5_out[21]), .src1(1'b0), .z(Result[21]));
  mux mux622 (.sel(Orzero[31]), .src0(A_5_out[22]), .src1(1'b0), .z(Result[22]));
  mux mux623 (.sel(Orzero[31]), .src0(A_5_out[23]), .src1(1'b0), .z(Result[23]));
  mux mux624 (.sel(Orzero[31]), .src0(A_5_out[24]), .src1(1'b0), .z(Result[24]));
  mux mux625 (.sel(Orzero[31]), .src0(A_5_out[25]), .src1(1'b0), .z(Result[25]));
  mux mux626 (.sel(Orzero[31]), .src0(A_5_out[26]), .src1(1'b0), .z(Result[26]));
  mux mux627 (.sel(Orzero[31]), .src0(A_5_out[27]), .src1(1'b0), .z(Result[27]));
  mux mux628 (.sel(Orzero[31]), .src0(A_5_out[28]), .src1(1'b0), .z(Result[28]));
  mux mux629 (.sel(Orzero[31]), .src0(A_5_out[29]), .src1(1'b0), .z(Result[29]));
  mux mux630 (.sel(Orzero[31]), .src0(A_5_out[30]), .src1(1'b0), .z(Result[30]));
  mux mux631 (.sel(Orzero[31]), .src0(A_5_out[31]), .src1(1'b0), .z(Result[31]));
  
  
  //assign Zero = (~((Result[0])|(Result[1])|(Result[2])|(Result[3])|(Result[4])|(Result[5])|(Result[6])|(Result[7])|(Result[8])|(Result[9])|(Result[10])|(Result[11])|(Result[12])|(Result[13])|(Result[14])|(Result[15])|(Result[16])|(Result[17])|(Result[18])|(Result[19])|(Result[20])|(Result[21])|(Result[22])|(Result[23])|(Result[24])|(Result[25])|(Result[26])|(Result[27])|(Result[28])|(Result[29])|(Result[30])|(Result[31])));
  
  
  
  
  
  // assign flag=((B[5])|(B[6])|(B[7])|(B[8])|(B[9])|(B[10])|(B[11])|(B[12])|(B[13])|(B[14])|(B[15])|(B[16])|(B[17])|(B[18])|(B[19])|(B[20])|(B[21])|(B[22])|(B[23])|(B[24])|(B[25])|(B[26])|(B[27])|(B[28])|(B[29])|(B[30])|(B[31]));
  
  
  
  
  
  //assign Carryout=1'b0;
  //assign Overflow=1'b0;
  
/*   always @(A, B, Ctrl, Result)
      begin
        if (flag == 1'b0) Result <= A_5_out;
        else Result <= 32'b0;
		      end */
   
endmodule