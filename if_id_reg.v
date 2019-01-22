module if_id_reg (clk,init, writeEnable, ifFlush, pc_in, inst_in, pc_out, inst_out);
	input clk, init, writeEnable, ifFlush;
	input [31:0] pc_in, inst_in;
	output [31:0] pc_out, inst_out;

wire [31:0] write_inst;
wire [63:0] data_to_write, write_final;
wire [63:0] reg_t, reg_r;

// concate data
//mux_32 mux_0 (.sel(1'h0), .src0(inst_in), .src1(32'h00000000), .z(write_inst));
mux_32 mux_0 (.sel(ifFlush), .src0(inst_in), .src1(32'h00000000), .z(write_inst));
assign data_to_write ={pc_in, write_inst};
mux_n #(.n(64)) mux_1 (.sel(init), .src0(data_to_write), .src1(64'h0), .z(write_final));

// save to temp variable
assign reg_t = reg_r;

// write to register triggered by clock
regNbit_write #(.n(64)) write_0 (.clk(clk), .writeEnable(writeEnable), .din(write_final), .orgData(reg_t), .pos(reg_r));

// output current reg_r value
assign pc_out = reg_r[63:32];
assign inst_out = reg_r[31:0];


endmodule
