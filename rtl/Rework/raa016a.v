/* verilator lint_off LITENDIAN */
//`include "defs.v"

module raa016a
(
	output	[15:0]	z_out,
	output	z_oe,
	input						cs,
	input		[9:0]		a,
	input						sys_clk
);

parameter WARNING = 0;

wire [9:0]	a_r;
wire [15:0]	z_out_r;

assign a_r[9:0] = a[9:0];

assign z_out[15:0] = z_out_r[15:0];

// Values are in 32 bits, but only 16 are used

initial begin
	rom_blk['h0] <= 16'hC201;
	rom_blk['h1] <= 16'hC401;
	rom_blk['h2] <= 16'hC601;
	rom_blk['h3] <= 16'hC801;
	rom_blk['h4] <= 16'hCA01;
	rom_blk['h5] <= 16'hCC01;
	rom_blk['h6] <= 16'hCE01;
	rom_blk['h7] <= 16'hD001;
	rom_blk['h8] <= 16'hD201;
	rom_blk['h9] <= 16'hD401;
	rom_blk['hA] <= 16'hD601;
	rom_blk['hB] <= 16'hD801;
	rom_blk['hC] <= 16'hDA01;
	rom_blk['hD] <= 16'hDC01;
	rom_blk['hE] <= 16'hDE01;
	rom_blk['hF] <= 16'hE001;
	rom_blk['h10] <= 16'hE201;
	rom_blk['h11] <= 16'hE401;
	rom_blk['h12] <= 16'hE601;
	rom_blk['h13] <= 16'hE801;
	rom_blk['h14] <= 16'hEA01;
	rom_blk['h15] <= 16'hEC01;
	rom_blk['h16] <= 16'hEE01;
	rom_blk['h17] <= 16'hF001;
	rom_blk['h18] <= 16'hF201;
	rom_blk['h19] <= 16'hF401;
	rom_blk['h1A] <= 16'hF601;
	rom_blk['h1B] <= 16'hF801;
	rom_blk['h1C] <= 16'hFA01;
	rom_blk['h1D] <= 16'hFC01;
	rom_blk['h1E] <= 16'hFE01;
	rom_blk['h1F] <= 16'h0000;
	rom_blk['h20] <= 16'h01FF;
	rom_blk['h21] <= 16'h03FF;
	rom_blk['h22] <= 16'h05FF;
	rom_blk['h23] <= 16'h07FF;
	rom_blk['h24] <= 16'h09FF;
	rom_blk['h25] <= 16'h0BFF;
	rom_blk['h26] <= 16'h0DFF;
	rom_blk['h27] <= 16'h0FFF;
	rom_blk['h28] <= 16'h11FF;
	rom_blk['h29] <= 16'h13FF;
	rom_blk['h2A] <= 16'h15FF;
	rom_blk['h2B] <= 16'h17FF;
	rom_blk['h2C] <= 16'h19FF;
	rom_blk['h2D] <= 16'h1BFF;
	rom_blk['h2E] <= 16'h1DFF;
	rom_blk['h2F] <= 16'h1FFF;
	rom_blk['h30] <= 16'h21FF;
	rom_blk['h31] <= 16'h23FF;
	rom_blk['h32] <= 16'h25FF;
	rom_blk['h33] <= 16'h27FF;
	rom_blk['h34] <= 16'h29FF;
	rom_blk['h35] <= 16'h2BFF;
	rom_blk['h36] <= 16'h2DFF;
	rom_blk['h37] <= 16'h2FFF;
	rom_blk['h38] <= 16'h31FF;
	rom_blk['h39] <= 16'h33FF;
	rom_blk['h3A] <= 16'h35FF;
	rom_blk['h3B] <= 16'h37FF;
	rom_blk['h3C] <= 16'h39FF;
	rom_blk['h3D] <= 16'h3BFF;
	rom_blk['h3E] <= 16'h3DFF;
	rom_blk['h3F] <= 16'h3FFF;
	rom_blk['h40] <= 16'h3DFF;
	rom_blk['h41] <= 16'h3BFF;
	rom_blk['h42] <= 16'h39FF;
	rom_blk['h43] <= 16'h37FF;
	rom_blk['h44] <= 16'h35FF;
	rom_blk['h45] <= 16'h33FF;
	rom_blk['h46] <= 16'h31FF;
	rom_blk['h47] <= 16'h2FFF;
	rom_blk['h48] <= 16'h2DFF;
	rom_blk['h49] <= 16'h2BFF;
	rom_blk['h4A] <= 16'h29FF;
	rom_blk['h4B] <= 16'h27FF;
	rom_blk['h4C] <= 16'h25FF;
	rom_blk['h4D] <= 16'h23FF;
	rom_blk['h4E] <= 16'h21FF;
	rom_blk['h4F] <= 16'h1FFF;
	rom_blk['h50] <= 16'h1DFF;
	rom_blk['h51] <= 16'h1BFF;
	rom_blk['h52] <= 16'h19FF;
	rom_blk['h53] <= 16'h17FF;
	rom_blk['h54] <= 16'h15FF;
	rom_blk['h55] <= 16'h13FF;
	rom_blk['h56] <= 16'h11FF;
	rom_blk['h57] <= 16'h0FFF;
	rom_blk['h58] <= 16'h0DFF;
	rom_blk['h59] <= 16'h0BFF;
	rom_blk['h5A] <= 16'h09FF;
	rom_blk['h5B] <= 16'h07FF;
	rom_blk['h5C] <= 16'h05FF;
	rom_blk['h5D] <= 16'h03FF;
	rom_blk['h5E] <= 16'h01FF;
	rom_blk['h5F] <= 16'h0000;
	rom_blk['h60] <= 16'hFE01;
	rom_blk['h61] <= 16'hFC01;
	rom_blk['h62] <= 16'hFA01;
	rom_blk['h63] <= 16'hF801;
	rom_blk['h64] <= 16'hF601;
	rom_blk['h65] <= 16'hF401;
	rom_blk['h66] <= 16'hF201;
	rom_blk['h67] <= 16'hF001;
	rom_blk['h68] <= 16'hEE01;
	rom_blk['h69] <= 16'hEC01;
	rom_blk['h6A] <= 16'hEA01;
	rom_blk['h6B] <= 16'hE801;
	rom_blk['h6C] <= 16'hE601;
	rom_blk['h6D] <= 16'hE401;
	rom_blk['h6E] <= 16'hE201;
	rom_blk['h6F] <= 16'hE001;
	rom_blk['h70] <= 16'hDE01;
	rom_blk['h71] <= 16'hDC01;
	rom_blk['h72] <= 16'hDA01;
	rom_blk['h73] <= 16'hD801;
	rom_blk['h74] <= 16'hD601;
	rom_blk['h75] <= 16'hD401;
	rom_blk['h76] <= 16'hD201;
	rom_blk['h77] <= 16'hD001;
	rom_blk['h78] <= 16'hCE01;
	rom_blk['h79] <= 16'hCC01;
	rom_blk['h7A] <= 16'hCA01;
	rom_blk['h7B] <= 16'hC801;
	rom_blk['h7C] <= 16'hC601;
	rom_blk['h7D] <= 16'hC401;
	rom_blk['h7E] <= 16'hC201;
	rom_blk['h7F] <= 16'hC001;
	rom_blk['h80] <= 16'h0647;
	rom_blk['h81] <= 16'h0C8B;
	rom_blk['h82] <= 16'h12C7;
	rom_blk['h83] <= 16'h18F8;
	rom_blk['h84] <= 16'h1F19;
	rom_blk['h85] <= 16'h2527;
	rom_blk['h86] <= 16'h2B1E;
	rom_blk['h87] <= 16'h30FB;
	rom_blk['h88] <= 16'h36B9;
	rom_blk['h89] <= 16'h3C56;
	rom_blk['h8A] <= 16'h41CD;
	rom_blk['h8B] <= 16'h471C;
	rom_blk['h8C] <= 16'h4C3F;
	rom_blk['h8D] <= 16'h5133;
	rom_blk['h8E] <= 16'h55F4;
	rom_blk['h8F] <= 16'h5A81;
	rom_blk['h90] <= 16'h5ED6;
	rom_blk['h91] <= 16'h62F1;
	rom_blk['h92] <= 16'h66CE;
	rom_blk['h93] <= 16'h6A6C;
	rom_blk['h94] <= 16'h6DC9;
	rom_blk['h95] <= 16'h70E1;
	rom_blk['h96] <= 16'h73B5;
	rom_blk['h97] <= 16'h7640;
	rom_blk['h98] <= 16'h7883;
	rom_blk['h99] <= 16'h7A7C;
	rom_blk['h9A] <= 16'h7C29;
	rom_blk['h9B] <= 16'h7D89;
	rom_blk['h9C] <= 16'h7E9C;
	rom_blk['h9D] <= 16'h7F61;
	rom_blk['h9E] <= 16'h7FD7;
	rom_blk['h9F] <= 16'h7FFF;
	rom_blk['hA0] <= 16'h7FD7;
	rom_blk['hA1] <= 16'h7F61;
	rom_blk['hA2] <= 16'h7E9C;
	rom_blk['hA3] <= 16'h7D89;
	rom_blk['hA4] <= 16'h7C29;
	rom_blk['hA5] <= 16'h7A7C;
	rom_blk['hA6] <= 16'h7883;
	rom_blk['hA7] <= 16'h7640;
	rom_blk['hA8] <= 16'h73B5;
	rom_blk['hA9] <= 16'h70E1;
	rom_blk['hAA] <= 16'h6DC9;
	rom_blk['hAB] <= 16'h6A6C;
	rom_blk['hAC] <= 16'h66CE;
	rom_blk['hAD] <= 16'h62F1;
	rom_blk['hAE] <= 16'h5ED6;
	rom_blk['hAF] <= 16'h5A81;
	rom_blk['hB0] <= 16'h55F4;
	rom_blk['hB1] <= 16'h5133;
	rom_blk['hB2] <= 16'h4C3F;
	rom_blk['hB3] <= 16'h471C;
	rom_blk['hB4] <= 16'h41CD;
	rom_blk['hB5] <= 16'h3C56;
	rom_blk['hB6] <= 16'h36B9;
	rom_blk['hB7] <= 16'h30FB;
	rom_blk['hB8] <= 16'h2B1E;
	rom_blk['hB9] <= 16'h2527;
	rom_blk['hBA] <= 16'h1F19;
	rom_blk['hBB] <= 16'h18F8;
	rom_blk['hBC] <= 16'h12C7;
	rom_blk['hBD] <= 16'h0C8B;
	rom_blk['hBE] <= 16'h0647;
	rom_blk['hBF] <= 16'h0000;
	rom_blk['hC0] <= 16'hF9B9;
	rom_blk['hC1] <= 16'hF375;
	rom_blk['hC2] <= 16'hED39;
	rom_blk['hC3] <= 16'hE708;
	rom_blk['hC4] <= 16'hE0E7;
	rom_blk['hC5] <= 16'hDAD9;
	rom_blk['hC6] <= 16'hD4E2;
	rom_blk['hC7] <= 16'hCF05;
	rom_blk['hC8] <= 16'hC947;
	rom_blk['hC9] <= 16'hC3AA;
	rom_blk['hCA] <= 16'hBE33;
	rom_blk['hCB] <= 16'hB8E4;
	rom_blk['hCC] <= 16'hB3C1;
	rom_blk['hCD] <= 16'hAECD;
	rom_blk['hCE] <= 16'hAA0C;
	rom_blk['hCF] <= 16'hA57F;
	rom_blk['hD0] <= 16'hA12A;
	rom_blk['hD1] <= 16'h9D0F;
	rom_blk['hD2] <= 16'h9932;
	rom_blk['hD3] <= 16'h9594;
	rom_blk['hD4] <= 16'h9237;
	rom_blk['hD5] <= 16'h8F1F;
	rom_blk['hD6] <= 16'h8C4B;
	rom_blk['hD7] <= 16'h89C0;
	rom_blk['hD8] <= 16'h877D;
	rom_blk['hD9] <= 16'h8584;
	rom_blk['hDA] <= 16'h83D7;
	rom_blk['hDB] <= 16'h8277;
	rom_blk['hDC] <= 16'h8164;
	rom_blk['hDD] <= 16'h809F;
	rom_blk['hDE] <= 16'h8029;
	rom_blk['hDF] <= 16'h8001;
	rom_blk['hE0] <= 16'h8029;
	rom_blk['hE1] <= 16'h809F;
	rom_blk['hE2] <= 16'h8164;
	rom_blk['hE3] <= 16'h8277;
	rom_blk['hE4] <= 16'h83D7;
	rom_blk['hE5] <= 16'h8584;
	rom_blk['hE6] <= 16'h877D;
	rom_blk['hE7] <= 16'h89C0;
	rom_blk['hE8] <= 16'h8C4B;
	rom_blk['hE9] <= 16'h8F1F;
	rom_blk['hEA] <= 16'h9237;
	rom_blk['hEB] <= 16'h9594;
	rom_blk['hEC] <= 16'h9932;
	rom_blk['hED] <= 16'h9D0F;
	rom_blk['hEE] <= 16'hA12A;
	rom_blk['hEF] <= 16'hA57F;
	rom_blk['hF0] <= 16'hAA0C;
	rom_blk['hF1] <= 16'hAECD;
	rom_blk['hF2] <= 16'hB3C1;
	rom_blk['hF3] <= 16'hB8E4;
	rom_blk['hF4] <= 16'hBE33;
	rom_blk['hF5] <= 16'hC3AA;
	rom_blk['hF6] <= 16'hC947;
	rom_blk['hF7] <= 16'hCF05;
	rom_blk['hF8] <= 16'hD4E2;
	rom_blk['hF9] <= 16'hDAD9;
	rom_blk['hFA] <= 16'hE0E7;
	rom_blk['hFB] <= 16'hE708;
	rom_blk['hFC] <= 16'hED39;
	rom_blk['hFD] <= 16'hF375;
	rom_blk['hFE] <= 16'hF9B9;
	rom_blk['hFF] <= 16'h0000;
	rom_blk['h100] <= 16'h0010;
	rom_blk['h101] <= 16'h0040;
	rom_blk['h102] <= 16'h0090;
	rom_blk['h103] <= 16'h00FF;
	rom_blk['h104] <= 16'h018E;
	rom_blk['h105] <= 16'h023A;
	rom_blk['h106] <= 16'h0304;
	rom_blk['h107] <= 16'h03EB;
	rom_blk['h108] <= 16'h04EC;
	rom_blk['h109] <= 16'h0608;
	rom_blk['h10A] <= 16'h073D;
	rom_blk['h10B] <= 16'h0888;
	rom_blk['h10C] <= 16'h09E9;
	rom_blk['h10D] <= 16'h0B5E;
	rom_blk['h10E] <= 16'h0CE4;
	rom_blk['h10F] <= 16'h0E7B;
	rom_blk['h110] <= 16'h101F;
	rom_blk['h111] <= 16'h11CF;
	rom_blk['h112] <= 16'h1388;
	rom_blk['h113] <= 16'h1548;
	rom_blk['h114] <= 16'h170E;
	rom_blk['h115] <= 16'h18D5;
	rom_blk['h116] <= 16'h1A9C;
	rom_blk['h117] <= 16'h1C61;
	rom_blk['h118] <= 16'h1E20;
	rom_blk['h119] <= 16'h1FD8;
	rom_blk['h11A] <= 16'h2185;
	rom_blk['h11B] <= 16'h2326;
	rom_blk['h11C] <= 16'h24B7;
	rom_blk['h11D] <= 16'h2636;
	rom_blk['h11E] <= 16'h27A1;
	rom_blk['h11F] <= 16'h28F5;
	rom_blk['h120] <= 16'h2A30;
	rom_blk['h121] <= 16'h2B4F;
	rom_blk['h122] <= 16'h2C50;
	rom_blk['h123] <= 16'h2D31;
	rom_blk['h124] <= 16'h2DF0;
	rom_blk['h125] <= 16'h2E8B;
	rom_blk['h126] <= 16'h2F00;
	rom_blk['h127] <= 16'h2F4D;
	rom_blk['h128] <= 16'h2F70;
	rom_blk['h129] <= 16'h2F69;
	rom_blk['h12A] <= 16'h2F35;
	rom_blk['h12B] <= 16'h2ED3;
	rom_blk['h12C] <= 16'h2E43;
	rom_blk['h12D] <= 16'h2D83;
	rom_blk['h12E] <= 16'h2C93;
	rom_blk['h12F] <= 16'h2B71;
	rom_blk['h130] <= 16'h2A1E;
	rom_blk['h131] <= 16'h2899;
	rom_blk['h132] <= 16'h26E2;
	rom_blk['h133] <= 16'h24FA;
	rom_blk['h134] <= 16'h22E0;
	rom_blk['h135] <= 16'h2094;
	rom_blk['h136] <= 16'h1E19;
	rom_blk['h137] <= 16'h1B6E;
	rom_blk['h138] <= 16'h1894;
	rom_blk['h139] <= 16'h158C;
	rom_blk['h13A] <= 16'h1259;
	rom_blk['h13B] <= 16'h0EFB;
	rom_blk['h13C] <= 16'h0B74;
	rom_blk['h13D] <= 16'h07C7;
	rom_blk['h13E] <= 16'h03F4;
	rom_blk['h13F] <= 16'h0000;
	rom_blk['h140] <= 16'hFBEB;
	rom_blk['h141] <= 16'hF7B9;
	rom_blk['h142] <= 16'hF36B;
	rom_blk['h143] <= 16'hEF06;
	rom_blk['h144] <= 16'hEA8B;
	rom_blk['h145] <= 16'hE5FE;
	rom_blk['h146] <= 16'hE163;
	rom_blk['h147] <= 16'hDCBC;
	rom_blk['h148] <= 16'hD80D;
	rom_blk['h149] <= 16'hD35A;
	rom_blk['h14A] <= 16'hCEA6;
	rom_blk['h14B] <= 16'hC9F5;
	rom_blk['h14C] <= 16'hC54B;
	rom_blk['h14D] <= 16'hC0AB;
	rom_blk['h14E] <= 16'hBC19;
	rom_blk['h14F] <= 16'hB799;
	rom_blk['h150] <= 16'hB32F;
	rom_blk['h151] <= 16'hAEDF;
	rom_blk['h152] <= 16'hAAAC;
	rom_blk['h153] <= 16'hA69B;
	rom_blk['h154] <= 16'hA2AF;
	rom_blk['h155] <= 16'h9EEC;
	rom_blk['h156] <= 16'h9B56;
	rom_blk['h157] <= 16'h97F0;
	rom_blk['h158] <= 16'h94BF;
	rom_blk['h159] <= 16'h91C4;
	rom_blk['h15A] <= 16'h8F04;
	rom_blk['h15B] <= 16'h8C82;
	rom_blk['h15C] <= 16'h8A41;
	rom_blk['h15D] <= 16'h8844;
	rom_blk['h15E] <= 16'h868D;
	rom_blk['h15F] <= 16'h8520;
	rom_blk['h160] <= 16'h83FF;
	rom_blk['h161] <= 16'h832B;
	rom_blk['h162] <= 16'h82A8;
	rom_blk['h163] <= 16'h8277;
	rom_blk['h164] <= 16'h829A;
	rom_blk['h165] <= 16'h8311;
	rom_blk['h166] <= 16'h83DF;
	rom_blk['h167] <= 16'h8505;
	rom_blk['h168] <= 16'h8682;
	rom_blk['h169] <= 16'h8859;
	rom_blk['h16A] <= 16'h8A88;
	rom_blk['h16B] <= 16'h8D10;
	rom_blk['h16C] <= 16'h8FF1;
	rom_blk['h16D] <= 16'h932A;
	rom_blk['h16E] <= 16'h96BB;
	rom_blk['h16F] <= 16'h9AA2;
	rom_blk['h170] <= 16'h9EDF;
	rom_blk['h171] <= 16'hA36F;
	rom_blk['h172] <= 16'hA851;
	rom_blk['h173] <= 16'hAD83;
	rom_blk['h174] <= 16'hB303;
	rom_blk['h175] <= 16'hB8CE;
	rom_blk['h176] <= 16'hBEE1;
	rom_blk['h177] <= 16'hC539;
	rom_blk['h178] <= 16'hCBD3;
	rom_blk['h179] <= 16'hD2AC;
	rom_blk['h17A] <= 16'hD9C0;
	rom_blk['h17B] <= 16'hE10A;
	rom_blk['h17C] <= 16'hE887;
	rom_blk['h17D] <= 16'hF032;
	rom_blk['h17E] <= 16'hF807;
	rom_blk['h17F] <= 16'h0000;
	rom_blk['h180] <= 16'h0969;
	rom_blk['h181] <= 16'h12C2;
	rom_blk['h182] <= 16'h1BF7;
	rom_blk['h183] <= 16'h24F9;
	rom_blk['h184] <= 16'h2DB7;
	rom_blk['h185] <= 16'h3622;
	rom_blk['h186] <= 16'h3E29;
	rom_blk['h187] <= 16'h45BE;
	rom_blk['h188] <= 16'h4CD5;
	rom_blk['h189] <= 16'h5361;
	rom_blk['h18A] <= 16'h5957;
	rom_blk['h18B] <= 16'h5EAE;
	rom_blk['h18C] <= 16'h635D;
	rom_blk['h18D] <= 16'h675E;
	rom_blk['h18E] <= 16'h6AAB;
	rom_blk['h18F] <= 16'h6D40;
	rom_blk['h190] <= 16'h6F1B;
	rom_blk['h191] <= 16'h703D;
	rom_blk['h192] <= 16'h70A5;
	rom_blk['h193] <= 16'h7056;
	rom_blk['h194] <= 16'h6F55;
	rom_blk['h195] <= 16'h6DA7;
	rom_blk['h196] <= 16'h6B53;
	rom_blk['h197] <= 16'h6861;
	rom_blk['h198] <= 16'h64DB;
	rom_blk['h199] <= 16'h60CC;
	rom_blk['h19A] <= 16'h5C3F;
	rom_blk['h19B] <= 16'h5742;
	rom_blk['h19C] <= 16'h51E2;
	rom_blk['h19D] <= 16'h4C2C;
	rom_blk['h19E] <= 16'h4631;
	rom_blk['h19F] <= 16'h3FFF;
	rom_blk['h1A0] <= 16'h39A5;
	rom_blk['h1A1] <= 16'h3334;
	rom_blk['h1A2] <= 16'h2CBA;
	rom_blk['h1A3] <= 16'h2647;
	rom_blk['h1A4] <= 16'h1FE9;
	rom_blk['h1A5] <= 16'h19AF;
	rom_blk['h1A6] <= 16'h13A8;
	rom_blk['h1A7] <= 16'h0DDF;
	rom_blk['h1A8] <= 16'h0861;
	rom_blk['h1A9] <= 16'h033A;
	rom_blk['h1AA] <= 16'hFE74;
	rom_blk['h1AB] <= 16'hFA17;
	rom_blk['h1AC] <= 16'hF62A;
	rom_blk['h1AD] <= 16'hF2B4;
	rom_blk['h1AE] <= 16'hEFBB;
	rom_blk['h1AF] <= 16'hED42;
	rom_blk['h1B0] <= 16'hEB4A;
	rom_blk['h1B1] <= 16'hE9D5;
	rom_blk['h1B2] <= 16'hE8E2;
	rom_blk['h1B3] <= 16'hE86E;
	rom_blk['h1B4] <= 16'hE876;
	rom_blk['h1B5] <= 16'hE8F5;
	rom_blk['h1B6] <= 16'hE9E5;
	rom_blk['h1B7] <= 16'hEB3D;
	rom_blk['h1B8] <= 16'hECF6;
	rom_blk['h1B9] <= 16'hEF06;
	rom_blk['h1BA] <= 16'hF162;
	rom_blk['h1BB] <= 16'hF3FF;
	rom_blk['h1BC] <= 16'hF6D1;
	rom_blk['h1BD] <= 16'hF9CA;
	rom_blk['h1BE] <= 16'hFCDF;
	rom_blk['h1BF] <= 16'h0000;
	rom_blk['h1C0] <= 16'h0321;
	rom_blk['h1C1] <= 16'h0636;
	rom_blk['h1C2] <= 16'h092F;
	rom_blk['h1C3] <= 16'h0C01;
	rom_blk['h1C4] <= 16'h0E9E;
	rom_blk['h1C5] <= 16'h10FA;
	rom_blk['h1C6] <= 16'h130A;
	rom_blk['h1C7] <= 16'h14C3;
	rom_blk['h1C8] <= 16'h161B;
	rom_blk['h1C9] <= 16'h170B;
	rom_blk['h1CA] <= 16'h178A;
	rom_blk['h1CB] <= 16'h1792;
	rom_blk['h1CC] <= 16'h171E;
	rom_blk['h1CD] <= 16'h162B;
	rom_blk['h1CE] <= 16'h14B6;
	rom_blk['h1CF] <= 16'h12BE;
	rom_blk['h1D0] <= 16'h1045;
	rom_blk['h1D1] <= 16'h0D4C;
	rom_blk['h1D2] <= 16'h09D6;
	rom_blk['h1D3] <= 16'h05E9;
	rom_blk['h1D4] <= 16'h018C;
	rom_blk['h1D5] <= 16'hFCC6;
	rom_blk['h1D6] <= 16'hF79F;
	rom_blk['h1D7] <= 16'hF221;
	rom_blk['h1D8] <= 16'hEC58;
	rom_blk['h1D9] <= 16'hE651;
	rom_blk['h1DA] <= 16'hE017;
	rom_blk['h1DB] <= 16'hD9B9;
	rom_blk['h1DC] <= 16'hD346;
	rom_blk['h1DD] <= 16'hCCCC;
	rom_blk['h1DE] <= 16'hC65B;
	rom_blk['h1DF] <= 16'hC001;
	rom_blk['h1E0] <= 16'hB9CF;
	rom_blk['h1E1] <= 16'hB3D4;
	rom_blk['h1E2] <= 16'hAE1E;
	rom_blk['h1E3] <= 16'hA8BE;
	rom_blk['h1E4] <= 16'hA3C1;
	rom_blk['h1E5] <= 16'h9F34;
	rom_blk['h1E6] <= 16'h9B25;
	rom_blk['h1E7] <= 16'h979F;
	rom_blk['h1E8] <= 16'h94AD;
	rom_blk['h1E9] <= 16'h9259;
	rom_blk['h1EA] <= 16'h90AB;
	rom_blk['h1EB] <= 16'h8FAA;
	rom_blk['h1EC] <= 16'h8F5B;
	rom_blk['h1ED] <= 16'h8FC3;
	rom_blk['h1EE] <= 16'h90E5;
	rom_blk['h1EF] <= 16'h92C0;
	rom_blk['h1F0] <= 16'h9555;
	rom_blk['h1F1] <= 16'h98A2;
	rom_blk['h1F2] <= 16'h9CA3;
	rom_blk['h1F3] <= 16'hA152;
	rom_blk['h1F4] <= 16'hA6A9;
	rom_blk['h1F5] <= 16'hAC9F;
	rom_blk['h1F6] <= 16'hB32B;
	rom_blk['h1F7] <= 16'hBA42;
	rom_blk['h1F8] <= 16'hC1D7;
	rom_blk['h1F9] <= 16'hC9DE;
	rom_blk['h1FA] <= 16'hD249;
	rom_blk['h1FB] <= 16'hDB07;
	rom_blk['h1FC] <= 16'hE409;
	rom_blk['h1FD] <= 16'hED3E;
	rom_blk['h1FE] <= 16'hF697;
	rom_blk['h1FF] <= 16'h0000;
	rom_blk['h200] <= 16'h0704;
	rom_blk['h201] <= 16'h0F79;
	rom_blk['h202] <= 16'h194E;
	rom_blk['h203] <= 16'h2467;
	rom_blk['h204] <= 16'h3092;
	rom_blk['h205] <= 16'h3D8B;
	rom_blk['h206] <= 16'h4AF0;
	rom_blk['h207] <= 16'h5842;
	rom_blk['h208] <= 16'h64E0;
	rom_blk['h209] <= 16'h7009;
	rom_blk['h20A] <= 16'h78E3;
	rom_blk['h20B] <= 16'h7E7E;
	rom_blk['h20C] <= 16'h7FE5;
	rom_blk['h20D] <= 16'h7C35;
	rom_blk['h20E] <= 16'h72B3;
	rom_blk['h20F] <= 16'h62F1;
	rom_blk['h210] <= 16'h4CEA;
	rom_blk['h211] <= 16'h3129;
	rom_blk['h212] <= 16'h10E2;
	rom_blk['h213] <= 16'hEE00;
	rom_blk['h214] <= 16'hCB1A;
	rom_blk['h215] <= 16'hAB5D;
	rom_blk['h216] <= 16'h923E;
	rom_blk['h217] <= 16'h831E;
	rom_blk['h218] <= 16'h80C8;
	rom_blk['h219] <= 16'h8CE4;
	rom_blk['h21A] <= 16'hA76D;
	rom_blk['h21B] <= 16'hCE4C;
	rom_blk['h21C] <= 16'hFD34;
	rom_blk['h21D] <= 16'h2DE1;
	rom_blk['h21E] <= 16'h58CA;
	rom_blk['h21F] <= 16'h7640;
	rom_blk['h220] <= 16'h7FEF;
	rom_blk['h221] <= 16'h726A;
	rom_blk['h222] <= 16'h4E79;
	rom_blk['h223] <= 16'h19BD;
	rom_blk['h224] <= 16'hDE4A;
	rom_blk['h225] <= 16'hA908;
	rom_blk['h226] <= 16'h86FC;
	rom_blk['h227] <= 16'h81E4;
	rom_blk['h228] <= 16'h9D07;
	rom_blk['h229] <= 16'hD339;
	rom_blk['h22A] <= 16'h16FE;
	rom_blk['h22B] <= 16'h555F;
	rom_blk['h22C] <= 16'h7B06;
	rom_blk['h22D] <= 16'h7A8A;
	rom_blk['h22E] <= 16'h51D7;
	rom_blk['h22F] <= 16'h0C8B;
	rom_blk['h230] <= 16'hC1A4;
	rom_blk['h231] <= 16'h8C61;
	rom_blk['h232] <= 16'h823B;
	rom_blk['h233] <= 16'hA977;
	rom_blk['h234] <= 16'hF495;
	rom_blk['h235] <= 16'h45A2;
	rom_blk['h236] <= 16'h7985;
	rom_blk['h237] <= 16'h776B;
	rom_blk['h238] <= 16'h3DC2;
	rom_blk['h239] <= 16'hE5AF;
	rom_blk['h23A] <= 16'h9975;
	rom_blk['h23B] <= 16'h808C;
	rom_blk['h23C] <= 16'hAA4D;
	rom_blk['h23D] <= 16'h02F1;
	rom_blk['h23E] <= 16'h5B06;
	rom_blk['h23F] <= 16'h7FFF;
	rom_blk['h240] <= 16'h59FC;
	rom_blk['h241] <= 16'hFD0F;
	rom_blk['h242] <= 16'hA0EF;
	rom_blk['h243] <= 16'h808C;
	rom_blk['h244] <= 16'hB367;
	rom_blk['h245] <= 16'h1A51;
	rom_blk['h246] <= 16'h701C;
	rom_blk['h247] <= 16'h776B;
	rom_blk['h248] <= 16'h2832;
	rom_blk['h249] <= 16'hBA5E;
	rom_blk['h24A] <= 16'h8084;
	rom_blk['h24B] <= 16'hA977;
	rom_blk['h24C] <= 16'h17C4;
	rom_blk['h24D] <= 16'h739F;
	rom_blk['h24E] <= 16'h6FC6;
	rom_blk['h24F] <= 16'h0C8B;
	rom_blk['h250] <= 16'h9D97;
	rom_blk['h251] <= 16'h8576;
	rom_blk['h252] <= 16'hDCAF;
	rom_blk['h253] <= 16'h555F;
	rom_blk['h254] <= 16'h7DE9;
	rom_blk['h255] <= 16'h2CC7;
	rom_blk['h256] <= 16'hAED7;
	rom_blk['h257] <= 16'h81E4;
	rom_blk['h258] <= 16'hD651;
	rom_blk['h259] <= 16'h56F8;
	rom_blk['h25A] <= 16'h7B7A;
	rom_blk['h25B] <= 16'h19BD;
	rom_blk['h25C] <= 16'h9AE3;
	rom_blk['h25D] <= 16'h8D96;
	rom_blk['h25E] <= 16'h03E0;
	rom_blk['h25F] <= 16'h7640;
	rom_blk['h260] <= 16'h5C31;
	rom_blk['h261] <= 16'hD21F;
	rom_blk['h262] <= 16'h8009;
	rom_blk['h263] <= 16'hCE4C;
	rom_blk['h264] <= 16'h5C65;
	rom_blk['h265] <= 16'h731C;
	rom_blk['h266] <= 16'hF1F1;
	rom_blk['h267] <= 16'h831E;
	rom_blk['h268] <= 16'hBE28;
	rom_blk['h269] <= 16'h54A3;
	rom_blk['h26A] <= 16'h748D;
	rom_blk['h26B] <= 16'hEE00;
	rom_blk['h26C] <= 16'h8120;
	rom_blk['h26D] <= 16'hCED7;
	rom_blk['h26E] <= 16'h664E;
	rom_blk['h26F] <= 16'h62F1;
	rom_blk['h270] <= 16'hC733;
	rom_blk['h271] <= 16'h83CB;
	rom_blk['h272] <= 16'h050D;
	rom_blk['h273] <= 16'h7E7E;
	rom_blk['h274] <= 16'h2A0E;
	rom_blk['h275] <= 16'h8FF7;
	rom_blk['h276] <= 16'hB137;
	rom_blk['h277] <= 16'h5842;
	rom_blk['h278] <= 16'h67C3;
	rom_blk['h279] <= 16'hC275;
	rom_blk['h27A] <= 16'h8995;
	rom_blk['h27B] <= 16'h2467;
	rom_blk['h27C] <= 16'h7D78;
	rom_blk['h27D] <= 16'hF087;
	rom_blk['h27E] <= 16'h8033;
	rom_blk['h27F] <= 16'h0000;
	rom_blk['h280] <= 16'hC695;
	rom_blk['h281] <= 16'hCB25;
	rom_blk['h282] <= 16'hC9BC;
	rom_blk['h283] <= 16'hCD56;
	rom_blk['h284] <= 16'hCD2E;
	rom_blk['h285] <= 16'hCE03;
	rom_blk['h286] <= 16'hCEC0;
	rom_blk['h287] <= 16'hD1AC;
	rom_blk['h288] <= 16'hD681;
	rom_blk['h289] <= 16'hD7D8;
	rom_blk['h28A] <= 16'hD623;
	rom_blk['h28B] <= 16'hD9A3;
	rom_blk['h28C] <= 16'hD96F;
	rom_blk['h28D] <= 16'hDE63;
	rom_blk['h28E] <= 16'hE18B;
	rom_blk['h28F] <= 16'hE02F;
	rom_blk['h290] <= 16'hDE31;
	rom_blk['h291] <= 16'hE6BA;
	rom_blk['h292] <= 16'hED65;
	rom_blk['h293] <= 16'hEA39;
	rom_blk['h294] <= 16'hEBAB;
	rom_blk['h295] <= 16'hED8B;
	rom_blk['h296] <= 16'hF0BA;
	rom_blk['h297] <= 16'hF4C5;
	rom_blk['h298] <= 16'hF599;
	rom_blk['h299] <= 16'hF43B;
	rom_blk['h29A] <= 16'hF689;
	rom_blk['h29B] <= 16'hF8DF;
	rom_blk['h29C] <= 16'hF8AE;
	rom_blk['h29D] <= 16'hFE67;
	rom_blk['h29E] <= 16'hFE69;
	rom_blk['h29F] <= 16'h02F5;
	rom_blk['h2A0] <= 16'h0188;
	rom_blk['h2A1] <= 16'h06EF;
	rom_blk['h2A2] <= 16'h0217;
	rom_blk['h2A3] <= 16'h0B0F;
	rom_blk['h2A4] <= 16'h069D;
	rom_blk['h2A5] <= 16'h0967;
	rom_blk['h2A6] <= 16'h0D64;
	rom_blk['h2A7] <= 16'h0C6F;
	rom_blk['h2A8] <= 16'h11FC;
	rom_blk['h2A9] <= 16'h1409;
	rom_blk['h2AA] <= 16'h1768;
	rom_blk['h2AB] <= 16'h1607;
	rom_blk['h2AC] <= 16'h197E;
	rom_blk['h2AD] <= 16'h1B11;
	rom_blk['h2AE] <= 16'h1DD6;
	rom_blk['h2AF] <= 16'h1F99;
	rom_blk['h2B0] <= 16'h1E69;
	rom_blk['h2B1] <= 16'h258E;
	rom_blk['h2B2] <= 16'h235F;
	rom_blk['h2B3] <= 16'h2444;
	rom_blk['h2B4] <= 16'h2601;
	rom_blk['h2B5] <= 16'h2C11;
	rom_blk['h2B6] <= 16'h2B65;
	rom_blk['h2B7] <= 16'h32BC;
	rom_blk['h2B8] <= 16'h2F1F;
	rom_blk['h2B9] <= 16'h3121;
	rom_blk['h2BA] <= 16'h3414;
	rom_blk['h2BB] <= 16'h32F5;
	rom_blk['h2BC] <= 16'h3692;
	rom_blk['h2BD] <= 16'h35FE;
	rom_blk['h2BE] <= 16'h3CE4;
	rom_blk['h2BF] <= 16'h3D5F;
	rom_blk['h2C0] <= 16'h3891;
	rom_blk['h2C1] <= 16'h3921;
	rom_blk['h2C2] <= 16'h3658;
	rom_blk['h2C3] <= 16'h37D6;
	rom_blk['h2C4] <= 16'h35E4;
	rom_blk['h2C5] <= 16'h32A6;
	rom_blk['h2C6] <= 16'h306E;
	rom_blk['h2C7] <= 16'h2F1E;
	rom_blk['h2C8] <= 16'h2A3D;
	rom_blk['h2C9] <= 16'h2A7D;
	rom_blk['h2CA] <= 16'h2724;
	rom_blk['h2CB] <= 16'h27A4;
	rom_blk['h2CC] <= 16'h23C2;
	rom_blk['h2CD] <= 16'h25C2;
	rom_blk['h2CE] <= 16'h20A0;
	rom_blk['h2CF] <= 16'h20D0;
	rom_blk['h2D0] <= 16'h1C6E;
	rom_blk['h2D1] <= 16'h17BF;
	rom_blk['h2D2] <= 16'h1964;
	rom_blk['h2D3] <= 16'h166B;
	rom_blk['h2D4] <= 16'h1242;
	rom_blk['h2D5] <= 16'h136F;
	rom_blk['h2D6] <= 16'h119D;
	rom_blk['h2D7] <= 16'h0E80;
	rom_blk['h2D8] <= 16'h0FEA;
	rom_blk['h2D9] <= 16'h09E2;
	rom_blk['h2DA] <= 16'h07B8;
	rom_blk['h2DB] <= 16'h0798;
	rom_blk['h2DC] <= 16'h0673;
	rom_blk['h2DD] <= 16'h02D5;
	rom_blk['h2DE] <= 16'h0163;
	rom_blk['h2DF] <= 16'hFDF2;
	rom_blk['h2E0] <= 16'h01ED;
	rom_blk['h2E1] <= 16'hFFE5;
	rom_blk['h2E2] <= 16'hF769;
	rom_blk['h2E3] <= 16'hFC16;
	rom_blk['h2E4] <= 16'hF4CD;
	rom_blk['h2E5] <= 16'hF406;
	rom_blk['h2E6] <= 16'hF3C2;
	rom_blk['h2E7] <= 16'hF030;
	rom_blk['h2E8] <= 16'hF172;
	rom_blk['h2E9] <= 16'hEF53;
	rom_blk['h2EA] <= 16'hE812;
	rom_blk['h2EB] <= 16'hE72D;
	rom_blk['h2EC] <= 16'hE5DC;
	rom_blk['h2ED] <= 16'hE634;
	rom_blk['h2EE] <= 16'hE2AE;
	rom_blk['h2EF] <= 16'hE2F2;
	rom_blk['h2F0] <= 16'hE023;
	rom_blk['h2F1] <= 16'hDBDF;
	rom_blk['h2F2] <= 16'hDC2B;
	rom_blk['h2F3] <= 16'hD895;
	rom_blk['h2F4] <= 16'hD6E8;
	rom_blk['h2F5] <= 16'hD8DA;
	rom_blk['h2F6] <= 16'hD12C;
	rom_blk['h2F7] <= 16'hCE93;
	rom_blk['h2F8] <= 16'hD170;
	rom_blk['h2F9] <= 16'hCBA6;
	rom_blk['h2FA] <= 16'hCC70;
	rom_blk['h2FB] <= 16'hCB45;
	rom_blk['h2FC] <= 16'hC865;
	rom_blk['h2FD] <= 16'hC5EC;
	rom_blk['h2FE] <= 16'hC4BF;
	rom_blk['h2FF] <= 16'hC580;
	rom_blk['h300] <= 16'h0000;
	rom_blk['h301] <= 16'h0000;
	rom_blk['h302] <= 16'h0000;
	rom_blk['h303] <= 16'h0000;
	rom_blk['h304] <= 16'h0000;
	rom_blk['h305] <= 16'h0000;
	rom_blk['h306] <= 16'h0000;
	rom_blk['h307] <= 16'h0000;
	rom_blk['h308] <= 16'h0000;
	rom_blk['h309] <= 16'h0000;
	rom_blk['h30A] <= 16'h0000;
	rom_blk['h30B] <= 16'h0000;
	rom_blk['h30C] <= 16'h0000;
	rom_blk['h30D] <= 16'h0000;
	rom_blk['h30E] <= 16'h0000;
	rom_blk['h30F] <= 16'h0000;
	rom_blk['h310] <= 16'h0000;
	rom_blk['h311] <= 16'h0000;
	rom_blk['h312] <= 16'h0000;
	rom_blk['h313] <= 16'h0000;
	rom_blk['h314] <= 16'h0000;
	rom_blk['h315] <= 16'h0000;
	rom_blk['h316] <= 16'h0000;
	rom_blk['h317] <= 16'h0000;
	rom_blk['h318] <= 16'h0000;
	rom_blk['h319] <= 16'h0000;
	rom_blk['h31A] <= 16'h0000;
	rom_blk['h31B] <= 16'h0000;
	rom_blk['h31C] <= 16'h0000;
	rom_blk['h31D] <= 16'h0000;
	rom_blk['h31E] <= 16'h0000;
	rom_blk['h31F] <= 16'h0000;
	rom_blk['h320] <= 16'h0000;
	rom_blk['h321] <= 16'h0000;
	rom_blk['h322] <= 16'h0000;
	rom_blk['h323] <= 16'h0000;
	rom_blk['h324] <= 16'h0000;
	rom_blk['h325] <= 16'h0000;
	rom_blk['h326] <= 16'h0000;
	rom_blk['h327] <= 16'h0000;
	rom_blk['h328] <= 16'h0000;
	rom_blk['h329] <= 16'h0000;
	rom_blk['h32A] <= 16'h0000;
	rom_blk['h32B] <= 16'h0000;
	rom_blk['h32C] <= 16'h0000;
	rom_blk['h32D] <= 16'h0000;
	rom_blk['h32E] <= 16'h0000;
	rom_blk['h32F] <= 16'h0000;
	rom_blk['h330] <= 16'h0000;
	rom_blk['h331] <= 16'h0000;
	rom_blk['h332] <= 16'h0000;
	rom_blk['h333] <= 16'h0000;
	rom_blk['h334] <= 16'h0000;
	rom_blk['h335] <= 16'h0000;
	rom_blk['h336] <= 16'h0000;
	rom_blk['h337] <= 16'h0000;
	rom_blk['h338] <= 16'h0000;
	rom_blk['h339] <= 16'h0000;
	rom_blk['h33A] <= 16'h0000;
	rom_blk['h33B] <= 16'h0000;
	rom_blk['h33C] <= 16'h1FFF;
	rom_blk['h33D] <= 16'h3FFF;
	rom_blk['h33E] <= 16'h5FFF;
	rom_blk['h33F] <= 16'h7FFF;
	rom_blk['h340] <= 16'h5FFF;
	rom_blk['h341] <= 16'h3FFF;
	rom_blk['h342] <= 16'h1FFF;
	rom_blk['h343] <= 16'h0000;
	rom_blk['h344] <= 16'h0000;
	rom_blk['h345] <= 16'h0000;
	rom_blk['h346] <= 16'h0000;
	rom_blk['h347] <= 16'h0000;
	rom_blk['h348] <= 16'h0000;
	rom_blk['h349] <= 16'h0000;
	rom_blk['h34A] <= 16'h0000;
	rom_blk['h34B] <= 16'h0000;
	rom_blk['h34C] <= 16'h0000;
	rom_blk['h34D] <= 16'h0000;
	rom_blk['h34E] <= 16'h0000;
	rom_blk['h34F] <= 16'h0000;
	rom_blk['h350] <= 16'h0000;
	rom_blk['h351] <= 16'h0000;
	rom_blk['h352] <= 16'h0000;
	rom_blk['h353] <= 16'h0000;
	rom_blk['h354] <= 16'h0000;
	rom_blk['h355] <= 16'h0000;
	rom_blk['h356] <= 16'h0000;
	rom_blk['h357] <= 16'h0000;
	rom_blk['h358] <= 16'h0000;
	rom_blk['h359] <= 16'h0000;
	rom_blk['h35A] <= 16'h0000;
	rom_blk['h35B] <= 16'h0000;
	rom_blk['h35C] <= 16'h0000;
	rom_blk['h35D] <= 16'h0000;
	rom_blk['h35E] <= 16'h0000;
	rom_blk['h35F] <= 16'h0000;
	rom_blk['h360] <= 16'h0000;
	rom_blk['h361] <= 16'h0000;
	rom_blk['h362] <= 16'h0000;
	rom_blk['h363] <= 16'h0000;
	rom_blk['h364] <= 16'h0000;
	rom_blk['h365] <= 16'h0000;
	rom_blk['h366] <= 16'h0000;
	rom_blk['h367] <= 16'h0000;
	rom_blk['h368] <= 16'h0000;
	rom_blk['h369] <= 16'h0000;
	rom_blk['h36A] <= 16'h0000;
	rom_blk['h36B] <= 16'h0000;
	rom_blk['h36C] <= 16'h0000;
	rom_blk['h36D] <= 16'h0000;
	rom_blk['h36E] <= 16'h0000;
	rom_blk['h36F] <= 16'h0000;
	rom_blk['h370] <= 16'h0000;
	rom_blk['h371] <= 16'h0000;
	rom_blk['h372] <= 16'h0000;
	rom_blk['h373] <= 16'h0000;
	rom_blk['h374] <= 16'h0000;
	rom_blk['h375] <= 16'h0000;
	rom_blk['h376] <= 16'h0000;
	rom_blk['h377] <= 16'h0000;
	rom_blk['h378] <= 16'h0000;
	rom_blk['h379] <= 16'h0000;
	rom_blk['h37A] <= 16'h0000;
	rom_blk['h37B] <= 16'h0000;
	rom_blk['h37C] <= 16'h0000;
	rom_blk['h37D] <= 16'h0000;
	rom_blk['h37E] <= 16'h0000;
	rom_blk['h37F] <= 16'h0000;
	rom_blk['h380] <= 16'hEFA6;
	rom_blk['h381] <= 16'h0F80;
	rom_blk['h382] <= 16'hF004;
	rom_blk['h383] <= 16'h0EA6;
	rom_blk['h384] <= 16'hED75;
	rom_blk['h385] <= 16'h1E84;
	rom_blk['h386] <= 16'h04C7;
	rom_blk['h387] <= 16'h28D4;
	rom_blk['h388] <= 16'h0839;
	rom_blk['h389] <= 16'h1630;
	rom_blk['h38A] <= 16'h2111;
	rom_blk['h38B] <= 16'h0B1E;
	rom_blk['h38C] <= 16'hF61E;
	rom_blk['h38D] <= 16'hFD1F;
	rom_blk['h38E] <= 16'hE751;
	rom_blk['h38F] <= 16'hCB57;
	rom_blk['h390] <= 16'h03D6;
	rom_blk['h391] <= 16'h0DE0;
	rom_blk['h392] <= 16'h0683;
	rom_blk['h393] <= 16'hF823;
	rom_blk['h394] <= 16'hF553;
	rom_blk['h395] <= 16'h1D19;
	rom_blk['h396] <= 16'h0A04;
	rom_blk['h397] <= 16'h2917;
	rom_blk['h398] <= 16'h1524;
	rom_blk['h399] <= 16'h25A4;
	rom_blk['h39A] <= 16'hDCB4;
	rom_blk['h39B] <= 16'hF957;
	rom_blk['h39C] <= 16'h1977;
	rom_blk['h39D] <= 16'h2EF3;
	rom_blk['h39E] <= 16'hD413;
	rom_blk['h39F] <= 16'h0239;
	rom_blk['h3A0] <= 16'h3210;
	rom_blk['h3A1] <= 16'h0422;
	rom_blk['h3A2] <= 16'hEFE8;
	rom_blk['h3A3] <= 16'hDB2B;
	rom_blk['h3A4] <= 16'hFE4C;
	rom_blk['h3A5] <= 16'h098E;
	rom_blk['h3A6] <= 16'h0590;
	rom_blk['h3A7] <= 16'hFB68;
	rom_blk['h3A8] <= 16'h00A8;
	rom_blk['h3A9] <= 16'h106F;
	rom_blk['h3AA] <= 16'h17A1;
	rom_blk['h3AB] <= 16'hD831;
	rom_blk['h3AC] <= 16'h10FC;
	rom_blk['h3AD] <= 16'hF066;
	rom_blk['h3AE] <= 16'h0E78;
	rom_blk['h3AF] <= 16'hF05E;
	rom_blk['h3B0] <= 16'h1F83;
	rom_blk['h3B1] <= 16'h1974;
	rom_blk['h3B2] <= 16'hEB6F;
	rom_blk['h3B3] <= 16'hF0DE;
	rom_blk['h3B4] <= 16'h2B4D;
	rom_blk['h3B5] <= 16'h1867;
	rom_blk['h3B6] <= 16'hCE98;
	rom_blk['h3B7] <= 16'h0D20;
	rom_blk['h3B8] <= 16'h0A13;
	rom_blk['h3B9] <= 16'hE8D3;
	rom_blk['h3BA] <= 16'hDF60;
	rom_blk['h3BB] <= 16'h08DF;
	rom_blk['h3BC] <= 16'hE168;
	rom_blk['h3BD] <= 16'h1114;
	rom_blk['h3BE] <= 16'hFE44;
	rom_blk['h3BF] <= 16'hD392;
	rom_blk['h3C0] <= 16'h14A4;
	rom_blk['h3C1] <= 16'hE895;
	rom_blk['h3C2] <= 16'hF2D8;
	rom_blk['h3C3] <= 16'h308A;
	rom_blk['h3C4] <= 16'hF985;
	rom_blk['h3C5] <= 16'hFB89;
	rom_blk['h3C6] <= 16'h190E;
	rom_blk['h3C7] <= 16'h2102;
	rom_blk['h3C8] <= 16'hF26B;
	rom_blk['h3C9] <= 16'hEE43;
	rom_blk['h3CA] <= 16'hE9FE;
	rom_blk['h3CB] <= 16'h0D8A;
	rom_blk['h3CC] <= 16'hFA2B;
	rom_blk['h3CD] <= 16'h09A5;
	rom_blk['h3CE] <= 16'h1F45;
	rom_blk['h3CF] <= 16'h1C1D;
	rom_blk['h3D0] <= 16'hEA2A;
	rom_blk['h3D1] <= 16'hE8DB;
	rom_blk['h3D2] <= 16'h11E2;
	rom_blk['h3D3] <= 16'h0C5A;
	rom_blk['h3D4] <= 16'h14C7;
	rom_blk['h3D5] <= 16'h0864;
	rom_blk['h3D6] <= 16'hD761;
	rom_blk['h3D7] <= 16'hE86E;
	rom_blk['h3D8] <= 16'hF047;
	rom_blk['h3D9] <= 16'hF76F;
	rom_blk['h3DA] <= 16'h020E;
	rom_blk['h3DB] <= 16'hFEC9;
	rom_blk['h3DC] <= 16'hF044;
	rom_blk['h3DD] <= 16'h0627;
	rom_blk['h3DE] <= 16'h0333;
	rom_blk['h3DF] <= 16'hFA47;
	rom_blk['h3E0] <= 16'hF5FE;
	rom_blk['h3E1] <= 16'hDC9F;
	rom_blk['h3E2] <= 16'h1B8D;
	rom_blk['h3E3] <= 16'h207F;
	rom_blk['h3E4] <= 16'h0C79;
	rom_blk['h3E5] <= 16'hE785;
	rom_blk['h3E6] <= 16'h0B90;
	rom_blk['h3E7] <= 16'hDFE8;
	rom_blk['h3E8] <= 16'h0690;
	rom_blk['h3E9] <= 16'h0AC8;
	rom_blk['h3EA] <= 16'h1AAF;
	rom_blk['h3EB] <= 16'h1EF3;
	rom_blk['h3EC] <= 16'h13FD;
	rom_blk['h3ED] <= 16'hE1CC;
	rom_blk['h3EE] <= 16'h19A2;
	rom_blk['h3EF] <= 16'hE5C4;
	rom_blk['h3F0] <= 16'hE4F3;
	rom_blk['h3F1] <= 16'h49EC;
	rom_blk['h3F2] <= 16'hF926;
	rom_blk['h3F3] <= 16'hF37F;
	rom_blk['h3F4] <= 16'h0ABC;
	rom_blk['h3F5] <= 16'hECFD;
	rom_blk['h3F6] <= 16'h0EAA;
	rom_blk['h3F7] <= 16'hFC53;
	rom_blk['h3F8] <= 16'hFBFD;
	rom_blk['h3F9] <= 16'hF058;
	rom_blk['h3FA] <= 16'h0291;
	rom_blk['h3FB] <= 16'hE383;
	rom_blk['h3FC] <= 16'h1880;
	rom_blk['h3FD] <= 16'hF135;
	rom_blk['h3FE] <= 16'hF30C;
	rom_blk['h3FF] <= 16'hE6D6;
end

	reg [15:0]	r_z_out_r;
	// reg	[15:0]	r_z_out_r_dly;
	reg		r_z_oe = 1'b0;
	// reg	[0:15]	r_z_oe_dly = 16'h0000;

	reg	[15:0]	rom_blk [0:(1<<10)-1];

	// assign z_oe = r_z_oe_dly;
	assign z_out_r = r_z_out_r;
	assign z_oe = r_z_oe;
	
	always @(posedge sys_clk)
	begin
		// r_z_out_r_dly <= r_z_out_r;
		// r_z_oe_dly <= r_z_oe;	

		if (~cs) begin
			$display("SINEROM $%03x #%04x", a_r, r_z_out_r);
		end
		r_z_out_r <= rom_blk[a_r][15:0];
		r_z_oe <= (~cs) ? 1'b1 : 1'b0;

		if (WARNING) begin // dumb way to get rid of compiler warning
			rom_blk[10'h3ff][15:0] <= 16'hE6D6;
		end
	end

/*
`ifdef SIMULATION
	reg [15:0]	r_z_out_r;
	// reg	[15:0]	r_z_out_r_dly;
	reg	[0:15]	r_z_oe = 16'h0000;
	// reg	[0:15]	r_z_oe_dly = 16'h0000;

	reg	[15:0]	rom_blk [0:(1<<10)-1];

	// assign z_oe = r_z_oe_dly;
	assign z_out_r = r_z_out_r;
	assign z_oe = r_z_oe;

	initial
	begin
		$readmemh("sinerom.mem", rom_blk);
	end
	
	always @(posedge sys_clk)
	begin
		// r_z_out_r_dly <= r_z_out_r;
		// r_z_oe_dly <= r_z_oe;	

		if (~cs) begin
			$display("SINEROM $%03x #%04x", a_r, r_z_out_r);
		end
		r_z_out_r <= rom_blk[a_r][15:0];
		r_z_oe <= (~cs) ? 16'hffff : 16'h0000;
	end
`else

	reg	[0:15]	r_z_oe = 16'h0000;
	// reg	[0:15]	r_z_oe_dly = 16'h0000;
	
	assign z_oe = r_z_oe;
	
	always @(posedge sys_clk)
	begin
		// r_z_oe_dly <= r_z_oe;	
		r_z_oe <= (~cs) ? 16'hffff : 16'h0000;
	end

		altsyncram	altsyncram_component (
				.clock0 (sys_clk),
				.address_a (a_r),
				.q_a (z_out_r),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({16{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = "sinerom.mif",
		altsyncram_component.intended_device_family = "Cyclone II",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1024,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "CLOCK0",
		altsyncram_component.widthad_a = 10,
		altsyncram_component.width_a = 16,
		altsyncram_component.width_byteena_a = 1;

`endif
*/

endmodule
/* verilator lint_on LITENDIAN */
