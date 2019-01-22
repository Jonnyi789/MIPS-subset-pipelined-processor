module instrfetch (PC, inst);
	parameter inst_mem;
    	input [31:0] PC;
	output [31:0] inst;
	
	sram sram_ut(.cs(1'b1) , .oe(1'b1) , .we(1'b0) , .addr(PC) , .din(32'b0) , .dout(inst));
	defparam sram_ut.mem_file = inst_mem;
	
	
endmodule
