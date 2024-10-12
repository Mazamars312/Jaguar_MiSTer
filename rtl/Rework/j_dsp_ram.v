/* verilator lint_off LITENDIAN */
//`include "defs.v"

module j_dsp_ram
(
	output [31:0] gpu_data_out,
	output [31:0] gpu_data_oe,
	input [31:0] gpu_data_in,
	input clk,
	input gpu_memw,
	input [11:2] ram_addr,
	input [1:0] ramen,
	input romen,
	input sys_clk // Generated
);
wire [1:0] ramwe;
wire [31:0] gpu_data_ram0_out;
wire [31:0] gpu_data_ram1_out;
wire [31:0] gpu_data_rom_out;
wire gpu_data_ram0_oe;
wire gpu_data_ram1_oe;
wire gpu_data_rom_oe;

// DSP_RAM.NET (33) - ramwe[0-1] : nd2p
assign ramwe[0] = ~(ramen[0] & gpu_memw);
assign ramwe[1] = ~(ramen[1] & gpu_memw);

// DSP_RAM.NET (37) - program[0] : gpuram
j_gpuram program_index_0_inst
(
	.gpu_data_out /* BUS */ (gpu_data_ram0_out[31:0]),
	.gpu_data_oe /* BUS */ (gpu_data_ram0_oe),
	.gpu_data_in /* BUS */ (gpu_data_in[31:0]),
	.clk /* IN */ (clk),
	.rama /* IN */ (ram_addr[11:2]),
	.ramen /* IN */ (ramen[0]),
	.ramwe /* IN */ (ramwe[0]),
	.sys_clk(sys_clk) // Generated
);

// DSP_RAM.NET (38) - program[1] : gpuram
j_gpuram program_index_1_inst
(
	.gpu_data_out /* BUS */ (gpu_data_ram1_out[31:0]),
	.gpu_data_oe /* BUS */ (gpu_data_ram1_oe),
	.gpu_data_in /* BUS */ (gpu_data_in[31:0]),
	.clk /* IN */ (clk),
	.rama /* IN */ (ram_addr[11:2]),
	.ramen /* IN */ (ramen[1]),
	.ramwe /* IN */ (ramwe[1]),
	.sys_clk(sys_clk) // Generated
);

// DSP_RAM.NET (40) - sinerom : sinerom
j_sinerom sinerom_inst
(
	.gpu_data_out /* BUS */ (gpu_data_rom_out[31:0]),
	.gpu_data_oe /* BUS */ (gpu_data_rom_oe),
	.gpu_data_in_15 /* BUS */ (gpu_data_in[15]),
	.clk /* IN */ (clk),
	.roma /* IN */ (ram_addr[11:2]),
	.romen /* IN */ (romen),
	.sys_clk(sys_clk) // Generated
);

// --- Compiler-generated PE for BUS gpu_data<0>
assign gpu_data_out[31:0] = (gpu_data_ram0_oe ? gpu_data_ram0_out[31:0] : 32'h0) | (gpu_data_ram1_oe ? gpu_data_ram1_out[31:0] : 32'h0) | (gpu_data_rom_oe ? gpu_data_rom_out[31:0] : 32'h0);
assign gpu_data_oe = gpu_data_ram0_oe | gpu_data_ram1_oe | gpu_data_rom_oe;
endmodule
