module blit
(
	output [0:23] blit_addr_out,
	output blit_addr_oe,
	input [0:23] blit_addr_in,
	output wdata_0_out,
	output wdata_0_oe,
	input wdata_0_in,
	output wdata_1_out,
	output wdata_1_oe,
	input wdata_1_in,
	output wdata_2_out,
	output wdata_2_oe,
	input wdata_2_in,
	output wdata_3_out,
	output wdata_3_oe,
	input wdata_3_in,
	output wdata_4_out,
	output wdata_4_oe,
	input wdata_4_in,
	output wdata_5_out,
	output wdata_5_oe,
	input wdata_5_in,
	output wdata_6_out,
	output wdata_6_oe,
	input wdata_6_in,
	output wdata_7_out,
	output wdata_7_oe,
	input wdata_7_in,
	output wdata_8_out,
	output wdata_8_oe,
	input wdata_8_in,
	output wdata_9_out,
	output wdata_9_oe,
	input wdata_9_in,
	output wdata_10_out,
	output wdata_10_oe,
	input wdata_10_in,
	output wdata_11_out,
	output wdata_11_oe,
	input wdata_11_in,
	output wdata_12_out,
	output wdata_12_oe,
	input wdata_12_in,
	output wdata_13_out,
	output wdata_13_oe,
	input wdata_13_in,
	output wdata_14_out,
	output wdata_14_oe,
	input wdata_14_in,
	output wdata_15_out,
	output wdata_15_oe,
	input wdata_15_in,
	output wdata_16_out,
	output wdata_16_oe,
	input wdata_16_in,
	output wdata_17_out,
	output wdata_17_oe,
	input wdata_17_in,
	output wdata_18_out,
	output wdata_18_oe,
	input wdata_18_in,
	output wdata_19_out,
	output wdata_19_oe,
	input wdata_19_in,
	output wdata_20_out,
	output wdata_20_oe,
	input wdata_20_in,
	output wdata_21_out,
	output wdata_21_oe,
	input wdata_21_in,
	output wdata_22_out,
	output wdata_22_oe,
	input wdata_22_in,
	output wdata_23_out,
	output wdata_23_oe,
	input wdata_23_in,
	output wdata_24_out,
	output wdata_24_oe,
	input wdata_24_in,
	output wdata_25_out,
	output wdata_25_oe,
	input wdata_25_in,
	output wdata_26_out,
	output wdata_26_oe,
	input wdata_26_in,
	output wdata_27_out,
	output wdata_27_oe,
	input wdata_27_in,
	output wdata_28_out,
	output wdata_28_oe,
	input wdata_28_in,
	output wdata_29_out,
	output wdata_29_oe,
	input wdata_29_in,
	output wdata_30_out,
	output wdata_30_oe,
	input wdata_30_in,
	output wdata_31_out,
	output wdata_31_oe,
	input wdata_31_in,
	output wdata_32_out,
	output wdata_32_oe,
	input wdata_32_in,
	output wdata_33_out,
	output wdata_33_oe,
	input wdata_33_in,
	output wdata_34_out,
	output wdata_34_oe,
	input wdata_34_in,
	output wdata_35_out,
	output wdata_35_oe,
	input wdata_35_in,
	output wdata_36_out,
	output wdata_36_oe,
	input wdata_36_in,
	output wdata_37_out,
	output wdata_37_oe,
	input wdata_37_in,
	output wdata_38_out,
	output wdata_38_oe,
	input wdata_38_in,
	output wdata_39_out,
	output wdata_39_oe,
	input wdata_39_in,
	output wdata_40_out,
	output wdata_40_oe,
	input wdata_40_in,
	output wdata_41_out,
	output wdata_41_oe,
	input wdata_41_in,
	output wdata_42_out,
	output wdata_42_oe,
	input wdata_42_in,
	output wdata_43_out,
	output wdata_43_oe,
	input wdata_43_in,
	output wdata_44_out,
	output wdata_44_oe,
	input wdata_44_in,
	output wdata_45_out,
	output wdata_45_oe,
	input wdata_45_in,
	output wdata_46_out,
	output wdata_46_oe,
	input wdata_46_in,
	output wdata_47_out,
	output wdata_47_oe,
	input wdata_47_in,
	output wdata_48_out,
	output wdata_48_oe,
	input wdata_48_in,
	output wdata_49_out,
	output wdata_49_oe,
	input wdata_49_in,
	output wdata_50_out,
	output wdata_50_oe,
	input wdata_50_in,
	output wdata_51_out,
	output wdata_51_oe,
	input wdata_51_in,
	output wdata_52_out,
	output wdata_52_oe,
	input wdata_52_in,
	output wdata_53_out,
	output wdata_53_oe,
	input wdata_53_in,
	output wdata_54_out,
	output wdata_54_oe,
	input wdata_54_in,
	output wdata_55_out,
	output wdata_55_oe,
	input wdata_55_in,
	output wdata_56_out,
	output wdata_56_oe,
	input wdata_56_in,
	output wdata_57_out,
	output wdata_57_oe,
	input wdata_57_in,
	output wdata_58_out,
	output wdata_58_oe,
	input wdata_58_in,
	output wdata_59_out,
	output wdata_59_oe,
	input wdata_59_in,
	output wdata_60_out,
	output wdata_60_oe,
	input wdata_60_in,
	output wdata_61_out,
	output wdata_61_oe,
	input wdata_61_in,
	output wdata_62_out,
	output wdata_62_oe,
	input wdata_62_in,
	output wdata_63_out,
	output wdata_63_oe,
	input wdata_63_in,
	output justify_out,
	output justify_oe,
	input justify_in,
	output mreq_out,
	output mreq_oe,
	input mreq_in,
	output read_out,
	output read_oe,
	input read_in,
	output width_0_out,
	output width_0_oe,
	input width_0_in,
	output width_1_out,
	output width_1_oe,
	input width_1_in,
	output width_2_out,
	output width_2_oe,
	input width_2_in,
	output width_3_out,
	output width_3_oe,
	input width_3_in,
	output gpu_dout_0_out,
	output gpu_dout_0_oe,
	input gpu_dout_0_in,
	output gpu_dout_1_out,
	output gpu_dout_1_oe,
	input gpu_dout_1_in,
	output gpu_dout_2_out,
	output gpu_dout_2_oe,
	input gpu_dout_2_in,
	output gpu_dout_3_out,
	output gpu_dout_3_oe,
	input gpu_dout_3_in,
	output gpu_dout_4_out,
	output gpu_dout_4_oe,
	input gpu_dout_4_in,
	output gpu_dout_5_out,
	output gpu_dout_5_oe,
	input gpu_dout_5_in,
	output gpu_dout_6_out,
	output gpu_dout_6_oe,
	input gpu_dout_6_in,
	output gpu_dout_7_out,
	output gpu_dout_7_oe,
	input gpu_dout_7_in,
	output gpu_dout_8_out,
	output gpu_dout_8_oe,
	input gpu_dout_8_in,
	output gpu_dout_9_out,
	output gpu_dout_9_oe,
	input gpu_dout_9_in,
	output gpu_dout_10_out,
	output gpu_dout_10_oe,
	input gpu_dout_10_in,
	output gpu_dout_11_out,
	output gpu_dout_11_oe,
	input gpu_dout_11_in,
	output gpu_dout_12_out,
	output gpu_dout_12_oe,
	input gpu_dout_12_in,
	output gpu_dout_13_out,
	output gpu_dout_13_oe,
	input gpu_dout_13_in,
	output gpu_dout_14_out,
	output gpu_dout_14_oe,
	input gpu_dout_14_in,
	output gpu_dout_15_out,
	output gpu_dout_15_oe,
	input gpu_dout_15_in,
	output gpu_dout_16_out,
	output gpu_dout_16_oe,
	input gpu_dout_16_in,
	output gpu_dout_17_out,
	output gpu_dout_17_oe,
	input gpu_dout_17_in,
	output gpu_dout_18_out,
	output gpu_dout_18_oe,
	input gpu_dout_18_in,
	output gpu_dout_19_out,
	output gpu_dout_19_oe,
	input gpu_dout_19_in,
	output gpu_dout_20_out,
	output gpu_dout_20_oe,
	input gpu_dout_20_in,
	output gpu_dout_21_out,
	output gpu_dout_21_oe,
	input gpu_dout_21_in,
	output gpu_dout_22_out,
	output gpu_dout_22_oe,
	input gpu_dout_22_in,
	output gpu_dout_23_out,
	output gpu_dout_23_oe,
	input gpu_dout_23_in,
	output gpu_dout_24_out,
	output gpu_dout_24_oe,
	input gpu_dout_24_in,
	output gpu_dout_25_out,
	output gpu_dout_25_oe,
	input gpu_dout_25_in,
	output gpu_dout_26_out,
	output gpu_dout_26_oe,
	input gpu_dout_26_in,
	output gpu_dout_27_out,
	output gpu_dout_27_oe,
	input gpu_dout_27_in,
	output gpu_dout_28_out,
	output gpu_dout_28_oe,
	input gpu_dout_28_in,
	output gpu_dout_29_out,
	output gpu_dout_29_oe,
	input gpu_dout_29_in,
	output gpu_dout_30_out,
	output gpu_dout_30_oe,
	input gpu_dout_30_in,
	output gpu_dout_31_out,
	output gpu_dout_31_oe,
	input gpu_dout_31_in,
	output blit_breq_0,
	output blit_breq_1,
	output blit_int,
	input ack,
	input big_pix,
	input blit_back,
	input bliten,
	input clk,
	input tlw,
	input data_0,
	input data_1,
	input data_2,
	input data_3,
	input data_4,
	input data_5,
	input data_6,
	input data_7,
	input data_8,
	input data_9,
	input data_10,
	input data_11,
	input data_12,
	input data_13,
	input data_14,
	input data_15,
	input data_16,
	input data_17,
	input data_18,
	input data_19,
	input data_20,
	input data_21,
	input data_22,
	input data_23,
	input data_24,
	input data_25,
	input data_26,
	input data_27,
	input data_28,
	input data_29,
	input data_30,
	input data_31,
	input data_32,
	input data_33,
	input data_34,
	input data_35,
	input data_36,
	input data_37,
	input data_38,
	input data_39,
	input data_40,
	input data_41,
	input data_42,
	input data_43,
	input data_44,
	input data_45,
	input data_46,
	input data_47,
	input data_48,
	input data_49,
	input data_50,
	input data_51,
	input data_52,
	input data_53,
	input data_54,
	input data_55,
	input data_56,
	input data_57,
	input data_58,
	input data_59,
	input data_60,
	input data_61,
	input data_62,
	input data_63,
	input [0:23] gpu_addr,
	input [0:31] gpu_din,
	input gpu_memw,
	input xreset_n,
	input sys_clk // Generated
);
wire [23:0] blit_addr_out_;
assign {blit_addr_out[23],blit_addr_out[22],blit_addr_out[21],blit_addr_out[20],
blit_addr_out[19],blit_addr_out[18],blit_addr_out[17],blit_addr_out[16],blit_addr_out[15],blit_addr_out[14],blit_addr_out[13],blit_addr_out[12],blit_addr_out[11],blit_addr_out[10],
blit_addr_out[9],blit_addr_out[8],blit_addr_out[7],blit_addr_out[6],blit_addr_out[5],blit_addr_out[4],blit_addr_out[3],blit_addr_out[2],blit_addr_out[1],blit_addr_out[0]} = blit_addr_out_[23:0];
wire [63:0] wdata_out;
assign {wdata_63_out,wdata_62_out,wdata_61_out,wdata_60_out,
wdata_59_out,wdata_58_out,wdata_57_out,wdata_56_out,wdata_55_out,wdata_54_out,wdata_53_out,wdata_52_out,wdata_51_out,wdata_50_out,
wdata_49_out,wdata_48_out,wdata_47_out,wdata_46_out,wdata_45_out,wdata_44_out,wdata_43_out,wdata_42_out,wdata_41_out,wdata_40_out,
wdata_39_out,wdata_38_out,wdata_37_out,wdata_36_out,wdata_35_out,wdata_34_out,wdata_33_out,wdata_32_out,wdata_31_out,wdata_30_out,
wdata_29_out,wdata_28_out,wdata_27_out,wdata_26_out,wdata_25_out,wdata_24_out,wdata_23_out,wdata_22_out,wdata_21_out,wdata_20_out,
wdata_19_out,wdata_18_out,wdata_17_out,wdata_16_out,wdata_15_out,wdata_14_out,wdata_13_out,wdata_12_out,wdata_11_out,wdata_10_out,
wdata_9_out,wdata_8_out,wdata_7_out,wdata_6_out,wdata_5_out,wdata_4_out,wdata_3_out,wdata_2_out,wdata_1_out,wdata_0_out} = wdata_out[63:0];
assign {wdata_63_oe,wdata_62_oe,wdata_61_oe,wdata_60_oe,
wdata_59_oe,wdata_58_oe,wdata_57_oe,wdata_56_oe,wdata_55_oe,wdata_54_oe,wdata_53_oe,wdata_52_oe,wdata_51_oe,wdata_50_oe,
wdata_49_oe,wdata_48_oe,wdata_47_oe,wdata_46_oe,wdata_45_oe,wdata_44_oe,wdata_43_oe,wdata_42_oe,wdata_41_oe,wdata_40_oe,
wdata_39_oe,wdata_38_oe,wdata_37_oe,wdata_36_oe,wdata_35_oe,wdata_34_oe,wdata_33_oe,wdata_32_oe,wdata_31_oe,wdata_30_oe,
wdata_29_oe,wdata_28_oe,wdata_27_oe,wdata_26_oe,wdata_25_oe,wdata_24_oe,wdata_23_oe,wdata_22_oe,wdata_21_oe,wdata_20_oe,
wdata_19_oe,wdata_18_oe,wdata_17_oe,wdata_16_oe,wdata_15_oe,wdata_14_oe,wdata_13_oe,wdata_12_oe,wdata_11_oe,wdata_10_oe,
wdata_9_oe,wdata_8_oe,wdata_7_oe,wdata_6_oe,wdata_5_oe,wdata_4_oe,wdata_3_oe,wdata_2_oe,wdata_1_oe} = {63{wdata_0_oe}};
wire [3:0] width_out;
assign {width_3_out,width_2_out,width_1_out,width_0_out} = width_out[3:0];
assign {width_3_oe,width_2_oe,width_1_oe} = {3{width_0_oe}};
wire [31:0] gpu_dout_out;
assign {gpu_dout_31_out,gpu_dout_30_out,
gpu_dout_29_out,gpu_dout_28_out,gpu_dout_27_out,gpu_dout_26_out,gpu_dout_25_out,gpu_dout_24_out,gpu_dout_23_out,gpu_dout_22_out,gpu_dout_21_out,gpu_dout_20_out,
gpu_dout_19_out,gpu_dout_18_out,gpu_dout_17_out,gpu_dout_16_out,gpu_dout_15_out,gpu_dout_14_out,gpu_dout_13_out,gpu_dout_12_out,gpu_dout_11_out,gpu_dout_10_out,
gpu_dout_9_out,gpu_dout_8_out,gpu_dout_7_out,gpu_dout_6_out,gpu_dout_5_out,gpu_dout_4_out,gpu_dout_3_out,gpu_dout_2_out,gpu_dout_1_out,gpu_dout_0_out} = gpu_dout_out[31:0];
assign {gpu_dout_31_oe,gpu_dout_30_oe,
gpu_dout_29_oe,gpu_dout_28_oe,gpu_dout_27_oe,gpu_dout_26_oe,gpu_dout_25_oe,gpu_dout_24_oe,gpu_dout_23_oe,gpu_dout_22_oe,gpu_dout_21_oe,gpu_dout_20_oe,
gpu_dout_19_oe,gpu_dout_18_oe,gpu_dout_17_oe,gpu_dout_16_oe,gpu_dout_15_oe,gpu_dout_14_oe,gpu_dout_13_oe,gpu_dout_12_oe,gpu_dout_11_oe,gpu_dout_10_oe,
gpu_dout_9_oe,gpu_dout_8_oe,gpu_dout_7_oe,gpu_dout_6_oe,gpu_dout_5_oe,gpu_dout_4_oe,gpu_dout_3_oe,gpu_dout_2_oe,gpu_dout_1_oe} = {31{gpu_dout_0_oe}};
wire [1:0] blit_breq;
assign {blit_breq_1,blit_breq_0} = blit_breq[1:0];
wire [63:0] data = {data_63,data_62,data_61,data_60,
data_59,data_58,data_57,data_56,data_55,data_54,data_53,data_52,data_51,data_50,
data_49,data_48,data_47,data_46,data_45,data_44,data_43,data_42,data_41,data_40,
data_39,data_38,data_37,data_36,data_35,data_34,data_33,data_32,data_31,data_30,
data_29,data_28,data_27,data_26,data_25,data_24,data_23,data_22,data_21,data_20,
data_19,data_18,data_17,data_16,data_15,data_14,data_13,data_12,data_11,data_10,
data_9,data_8,data_7,data_6,data_5,data_4,data_3,data_2,data_1,data_0};
wire [23:0] gpu_addr_ = {gpu_addr[23],gpu_addr[22],gpu_addr[21],gpu_addr[20],
gpu_addr[19],gpu_addr[18],gpu_addr[17],gpu_addr[16],gpu_addr[15],gpu_addr[14],gpu_addr[13],gpu_addr[12],gpu_addr[11],gpu_addr[10],
gpu_addr[9],gpu_addr[8],gpu_addr[7],gpu_addr[6],gpu_addr[5],gpu_addr[4],gpu_addr[3],gpu_addr[2],gpu_addr[1],gpu_addr[0]};
wire [31:0] gpu_din_ = {gpu_din[31],gpu_din[30],
gpu_din[29],gpu_din[28],gpu_din[27],gpu_din[26],gpu_din[25],gpu_din[24],gpu_din[23],gpu_din[22],gpu_din[21],gpu_din[20],
gpu_din[19],gpu_din[18],gpu_din[17],gpu_din[16],gpu_din[15],gpu_din[14],gpu_din[13],gpu_din[12],gpu_din[11],gpu_din[10],
gpu_din[9],gpu_din[8],gpu_din[7],gpu_din[6],gpu_din[5],gpu_din[4],gpu_din[3],gpu_din[2],gpu_din[1],gpu_din[0]};
_blit blit_inst
(
	.blit_addr_out /* BUS */ (blit_addr_out_[23:0]),
	.blit_addr_oe /* BUS */ (blit_addr_oe),
	.wdata_out /* BUS */ (wdata_out[63:0]),
	.wdata_oe /* BUS */ (wdata_0_oe),
	.justify_out /* BUS */ (justify_out),
	.justify_oe /* BUS */ (justify_oe),
	.justify_in /* BUS */ (justify_in),
	.mreq_out /* BUS */ (mreq_out),
	.mreq_oe /* BUS */ (mreq_oe),
	.mreq_in /* BUS */ (mreq_in),
	.read_out /* BUS */ (read_out),
	.read_oe /* BUS */ (read_oe),
	.read_in /* BUS */ (read_in),
	.width_out /* BUS */ (width_out[3:0]),
	.width_oe /* BUS */ (width_0_oe),
	.gpu_dout_out /* BUS */ (gpu_dout_out[31:0]),
	.gpu_dout_oe /* BUS */ (gpu_dout_0_oe),
	.blit_breq /* OUT */ (blit_breq[1:0]),
	.blit_int /* OUT */ (blit_int),
	.ack /* IN */ (ack),
	.big_pix /* IN */ (big_pix),
	.blit_back /* IN */ (blit_back),
	.bliten /* IN */ (bliten),
	.clk /* IN */ (clk),
	.tlw /* IN */ (tlw),
	.data /* IN */ (data[63:0]),
	.gpu_addr /* IN */ (gpu_addr_[23:0]),
	.gpu_din /* IN */ (gpu_din_[31:0]),
	.gpu_memw /* IN */ (gpu_memw),
	.xreset_n /* IN */ (xreset_n),
	.sys_clk(sys_clk) // Generated
);
endmodule
