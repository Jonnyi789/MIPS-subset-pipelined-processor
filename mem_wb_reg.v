module mem_wb_reg (clk, init,
		  MemReg, RegW, 
		  dataRead, ALUresult, RegDestination,
		  MemReg_o, RegW_o, 
		  dataRead_o, ALUresult_o, RegDestination_o);
	input clk, init, MemReg, RegW;
	input [4:0] RegDestination;
	input [31:0] dataRead, ALUresult;
	output MemReg_o, RegW_o;
	output [4:0] RegDestination_o;
	output [31:0] dataRead_o, ALUresult_o;


wire [70:0] data_to_write, write_final;
wire [70:0] reg_t, reg_r;

// concate data
assign data_to_write ={MemReg, RegW, dataRead, ALUresult, RegDestination};
mux_n #(.n(71)) mux_1 (.sel(init), .src0(data_to_write), .src1(71'h0), .z(write_final));
// save to temp variable
assign reg_t = reg_r;

// write to register triggered by clock
regNbit_write #(.n(71)) write_0 (.clk(clk), .writeEnable(1'b1), .din(write_final), .orgData(reg_t), .pos(reg_r));

// output current reg_r value

assign MemReg_o = reg_r[70];
assign RegW_o = reg_r[69];
assign dataRead_o = reg_r[68:37];
assign ALUresult_o = reg_r[36:5];
assign RegDestination_o = reg_r[4:0];


endmodule
