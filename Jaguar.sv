//============================================================================
// 
//  Port to MiSTer.
//  Copyright (C) 2018 Sorgelig
//
//  Jaguar core code.
//  Copyright (C) 2018 Gregory Estrade (Torlus).
//
//  Port of Jaguar core to MiSTer (ElectronAsh / OzOnE).
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
//============================================================================

module emu
(
	//Master input clock
	input         CLK_50M,

	//Async reset from top-level module.
	//Can be used as initial reset.
	input         RESET,					// Active-HIGH! Meaning "Low for RUNNING".
	
	input			  BTN_USER,
	input			  BTN_OSD,

	//Must be passed to hps_io module
	inout  [44:0] HPS_BUS,

	//Base video clock. Usually equals to CLK_SYS.
	output        CLK_VIDEO,

	//Multiple resolutions are supported using different CE_PIXEL rates.
	//Must be based on CLK_VIDEO
	output        CE_PIXEL,

	//Video aspect ratio for HDMI. Most retro systems have ratio 4:3.
	output  [7:0] VIDEO_ARX,
	output  [7:0] VIDEO_ARY,

	output  [7:0] VGA_R,
	output  [7:0] VGA_G,
	output  [7:0] VGA_B,
	output        VGA_HS,
	output        VGA_VS,
	output        VGA_DE,    // = ~(VBlank | HBlank)

	output        LED_USER,  // 1 - ON, 0 - OFF.

	// b[1]: 0 - LED status is system status OR'd with b[0]
	//       1 - LED status is controled solely by b[0]
	// hint: supply 2'b00 to let the system control the LED.
	output  [1:0] LED_POWER,
	output  [1:0] LED_DISK,

	output [15:0] AUDIO_L,
	output [15:0] AUDIO_R,
	output        AUDIO_S,   // 1 - signed audio samples, 0 - unsigned
	output  [1:0] AUDIO_MIX, // 0 - no mix, 1 - 25%, 2 - 50%, 3 - 100% (mono)
	input         TAPE_IN,

	// SD-SPI
	output        SD_SCK,
	output        SD_MOSI,
	input         SD_MISO,
	output        SD_CS,
	input         SD_CD,

`ifdef VERILATOR
	output	[16:0]	os_rom_a,
	output					os_rom_ce_n,
	output					os_rom_oe_n,
	input		[7:0]		os_rom_q,
	input						os_rom_oe,
	
	input wire        ioctl_download,
	input wire        ioctl_wr,
	//input wire [24:0] ioctl_addr,
	input wire [15:0] ioctl_data,
	input wire  [7:0] ioctl_index,
	output reg         ioctl_wait,
	
	(*noprune*)output reg [31:0] loader_addr,
	
	output wire [23:0] cart_a,
	
	output wire [31:0] cart_q,
	
	output wire [1:0] cart_oe,
`endif
	
	//High latency DDR3 RAM interface
	//Use for non-critical time purposes
	output        DDRAM_CLK,
	input         DDRAM_BUSY,
	output  [7:0] DDRAM_BURSTCNT,
	output [28:0] DDRAM_ADDR,
	input  [63:0] DDRAM_DOUT,
	input         DDRAM_DOUT_READY,
	output        DDRAM_RD,
	output [63:0] DDRAM_DIN,
	output  [7:0] DDRAM_BE,
	output        DDRAM_WE,

	//SDRAM interface with lower latency
	output        SDRAM_CLK,
	output        SDRAM_CKE,
	output [12:0] SDRAM_A,
	output  [1:0] SDRAM_BA,
	inout  [15:0] SDRAM_DQ,
	output        SDRAM_DQML,
	output        SDRAM_DQMH,
	output        SDRAM_nCS,
	output        SDRAM_nCAS,
	output        SDRAM_nRAS,
	output        SDRAM_nWE,
	
	input	  [6:0] USER_IN,
	output  [6:0] USER_OUT
);

assign {SD_SCK, SD_MOSI, SD_CS} = 'Z;
//assign {SDRAM_DQ, SDRAM_A, SDRAM_BA, SDRAM_CLK, SDRAM_CKE, SDRAM_DQML, SDRAM_DQMH, SDRAM_nWE, SDRAM_nCAS, SDRAM_nRAS, SDRAM_nCS} = 'Z;
//assign {DDRAM_CLK, DDRAM_BURSTCNT, DDRAM_ADDR, DDRAM_DIN, DDRAM_BE, DDRAM_RD, DDRAM_WE} = 0;

//assign LED_USER  = ioctl_download;
assign LED_DISK  = 0;
assign LED_POWER = 0;


wire clk_78m;

wire pll_locked;
pll pll
(
	.refclk(CLK_50M),
	.rst(0),
	.outclk_0(clk_78m),
	.locked(pll_locked)
);


(*keep*)wire clk_sys = clk_78m;


wire [1:0] scale = status[3:2];

assign VIDEO_ARX = status[1] ? 8'd16 : 8'd4;
assign VIDEO_ARY = status[1] ? 8'd9  : 8'd3; 

// Status Bit Map:
//             Uppercase O                    Lowercase o
// 0         1         2         3          4         5         6   
// 01234567890123456789012345678901 23456789012345678901234567890123
// 0123456789ABCDEFGHIJKLMNOPQRSTUV 0123456789ABCDEFGHIJKLMNOPQRSTUV
// XXXXXXXXXXXX XXXXXXXXXXXXXXXXXXX XXXXX 


// 	"O24,Scandoubler Fx,None,HQ2x,CRT 25%,CRT 50%,CRT 75%;",

`include "build_id.v"
localparam CONF_STR = {
	"Jaguar;;",
	"-;",
	"F,JAG;",
	"O4,Region Setting,PAL,NTSC;",
	"O2,BIOS Checksum Patch,Off,On;",
	"-;",
	"O1,Aspect ratio,4:3,16:9;",
	"-;",
	"O3,CPU Speed,Normal,Turbo;",
	"-;",
	"R0,Reset;",
	"J1,A,B,C,Option,Pause,1,2,3,4,5,6,7,8,9,0,Star,Hash;",
	"J2,A,B,C,Option,Pause,1,2,3,4,5,6,7,8,9,0,Star,Hash;",
	"-;",
	"-;",
	"V,v1.51.",`BUILD_DATE
};


wire [63:0] status;
wire  [1:0] buttons;
wire [15:0] joystick_0;
wire [15:0] joystick_1;
wire        ioctl_download;
wire        ioctl_wr;
wire [24:0] ioctl_addr;
wire [15:0] ioctl_data;
wire  [7:0] ioctl_index;
reg         ioctl_wait;
wire        forced_scandoubler;
wire [10:0] ps2_key;
wire [21:0] gamma_bus;

hps_io #(.STRLEN($size(CONF_STR)>>3), .PS2DIV(1000), .WIDE(0)) hps_io
(
	.clk_sys(clk_sys),
	.HPS_BUS(HPS_BUS),

	.conf_str(CONF_STR),
	.joystick_0(joystick_0),
	.joystick_1(joystick_1),
	.buttons(buttons),
	.forced_scandoubler(forced_scandoubler),

	.status(status),
	.status_in({status[31:8],region_req,status[5:0]}),
	.status_set(region_set),

	.ioctl_download(ioctl_download),
	.ioctl_index(ioctl_index),
	.ioctl_wr(ioctl_wr),
	.ioctl_addr(ioctl_addr),
	.ioctl_dout(ioctl_data),
	.ioctl_wait(ioctl_wait),

	.ps2_key(ps2_key),
	
	.gamma_bus(gamma_bus)
);



`ifndef VERILATOR
reg [31:0] loader_addr;
`endif

//reg [15:0] loader_data;
(*keep*)wire [15:0] loader_data = ioctl_data;

reg        loader_wr;
reg        loader_en;
reg        loader_reset = 0;

//reg [7:0] loader_be;
wire [7:0] loader_be = (loader_en && loader_addr[2:0]==0) ? 8'b11000000 :
							  (loader_en && loader_addr[2:0]==2) ? 8'b00110000 :
							  (loader_en && loader_addr[2:0]==4) ? 8'b00001100 :
							  (loader_en && loader_addr[2:0]==6) ? 8'b00000011 : 8'b11111111;

reg [7:0] cnt = 0;
reg [1:0] status_reg = 0;
reg       old_download;
integer   timeout = 0;


always @(posedge clk_sys or posedge reset)
if (reset) begin
	ioctl_wait <= 0;
	cnt <= 0;
	status_reg <= 0;
	old_download <= 0;
	timeout <= 0;
	loader_wr <= 0;
	loader_en <= 0;
	//loader_addr <= 32'h0080_0000;
	loader_addr <= 32'h0000_0000;
end
else begin
	old_download <= ioctl_download;
	
	loader_reset <= 0;// Default!
	loader_wr <= 0;	// Default!
	
	if (~old_download && ioctl_download && ioctl_index) begin
		//loader_addr <= 32'h0080_0000;								// Force the cart ROM to load at 0x00800000 in DDR for Jag core. (byte address!)
																				// (The ROM actually gets written at 0x30800000 in DDR, which is done when load_addr gets assigned to DDRAM_ADDR below).
		loader_addr <= 32'h0000_0000;
		
		loader_en <= 1;
		status_reg <= 0;
		loader_reset <= 1;
		ioctl_wait <= 0;
		timeout <= 3000000;
		cnt <= 0;
	end

	if (loader_wr) loader_addr <= loader_addr + 2;				// Writing a 16-bit WORD at a time!

	if (ioctl_wr && ioctl_index) begin
		loader_wr <= 1;
		ioctl_wait <= 1;
	end
	else if (rom_wrack) ioctl_wait <= 1'b0;
	
	//if (loader_en && DDRAM_BUSY) ioctl_wait <= 1;
	//else ioctl_wait <= 0;

/*
	if(ioctl_wait && !loader_wr) begin
		if(cnt) begin
			cnt <= cnt - 1'd1;
			loader_wr <= 1;
		end
		else if(timeout) timeout <= timeout - 1;
		else {status_reg,ioctl_wait} <= 0;
	end
*/

	if(old_download & ~ioctl_download) begin
		loader_en <= 0;
		ioctl_wait <= 0;
	end
	if (RESET) ioctl_wait <= 0;
end

`ifndef VERILATOR
wire reset = RESET | status[0] | buttons[1];
`else
wire reset = RESET;
`endif


/*
wire [22:1] rom_addr;
wire [15:0] rom_data;
wire rom_rd, rom_rdack;

ddram ddram_inst
(
	.DDRAM_CLK(DDRAM_CLK) ,	// input  DDRAM_CLK
	.DDRAM_BUSY(DDRAM_BUSY) ,	// input  DDRAM_BUSY
	.DDRAM_BURSTCNT(DDRAM_BURSTCNT) ,	// output [7:0] DDRAM_BURSTCNT
	.DDRAM_ADDR(DDRAM_ADDR) ,	// output [28:0] DDRAM_ADDR
	.DDRAM_DOUT(DDRAM_DOUT) ,	// input [63:0] DDRAM_DOUT
	.DDRAM_DOUT_READY(DDRAM_DOUT_READY) ,	// input  DDRAM_DOUT_READY
	.DDRAM_RD(DDRAM_RD) ,	// output  DDRAM_RD
	.DDRAM_DIN(DDRAM_DIN) ,	// output [63:0] DDRAM_DIN
	.DDRAM_BE(DDRAM_BE) ,	// output [7:0] DDRAM_BE
	.DDRAM_WE(DDRAM_WE) ,	// output  DDRAM_WE

   .wraddr(ioctl_addr),		// input [27:0] wraddr
   .din({ioctl_data[7:0],ioctl_data[15:8]}),	// input [15:0] din
   .we_req(rom_wr),			// input  we_req
   .we_ack(rom_wrack),		// output  we_ack

   .rdaddr(rom_addr),		// input [27:1] rdaddr
   .dout(rom_data),			// output [15:0] dout
   .rd_req(rom_rd),			// input  rd_req
   .rd_ack(rom_rdack) 		// output  rd_ack
);


reg  rom_wr;
wire rom_wrack;

always @(posedge clk_sys) begin
	reg old_download, old_reset;
	old_download <= ioctl_download;
	old_reset <= reset;

	if(~old_reset && reset) ioctl_wait <= 0;
	if(~old_download && ioctl_download) rom_wr <= 0;
	else begin
		if(ioctl_wr) begin
			ioctl_wait <= 1;
			rom_wr <= ~rom_wr;
		end else if(ioctl_wait && (rom_wr == rom_wrack)) begin
			ioctl_wait <= 0;
		end
	end
end
*/

//wire xresetl = !(reset | loader_reset | loader_en);
wire xresetl = !(reset | ioctl_download);


/* verilator lint_off PINMISSING */
jaguar jaguar_inst
(
	.xresetl( xresetl ) ,		// input  xresetl
	
	.sys_clk( clk_sys ) ,		// input  clk_sys
	
	.dram_a( dram_a ) ,			// output [0:9] dram_a
	.dram_ras_n( dram_ras_n ) ,// output  dram_ras_n
	.dram_cas_n( dram_cas_n ) ,// output  dram_cas_n
	.dram_oe_n( dram_oe_n ) ,	// output [0:3] dram_oe_n
	.dram_uw_n( dram_uw_n ) ,	// output [0:3] dram_uw_n
	.dram_lw_n( dram_lw_n ) ,	// output [0:3] dram_lw_n
	.dram_d( dram_d ) ,			// output [0:63] dram_d
	.dram_q( dram_q ) ,			// input [0:63] dram_q
	.dram_oe( dram_oe ) ,		// input [0:3] dram_oe
	
	.ram_rdy( ram_rdy ) ,		// input  ram_rdy
/*
	.DBG_CPU_RDEN( DBG_CPU_RDEN ) ,	// output  DBG_CPU_RDEN
	.DBG_CPU_WREN( DBG_CPU_WREN ) ,	// output  DBG_CPU_WREN
	.DBG_CPU_DTACK( DBG_CPU_DTACK ) ,// output  DBG_CPU_DTACK
	.DBG_CPU_BENA( DBG_CPU_BENA ) ,	// output [1:0] DBG_CPU_BENA
	.DBG_CPU_ADDR( DBG_CPU_ADDR ) ,	// output [31:0] DBG_CPU_ADDR
	.DBG_CPU_RDATA( DBG_CPU_RDATA ) ,// output [15:0] DBG_CPU_RDATA
	.DBG_CPU_WDATA( DBG_CPU_WDATA ) ,// output [15:0] DBG_CPU_WDATA
	.DBG_REG_ADDR( DBG_REG_ADDR ) ,	// output [3:0] DBG_REG_ADDR
	.DBG_REG_WREN( DBG_REG_WREN ) ,	// output [3:0] DBG_REG_WREN
	.DBG_REG_DATA( DBG_REG_DATA ) ,	// output [15:0] DBG_REG_DATA
	.DBG_SR_REG( DBG_SR_REG ) ,		// output [15:0] DBG_SR_REG
	.DBG_PC_REG( DBG_PC_REG ) ,		// output [31:0] DBG_PC_REG
	.DBG_USP_REG( DBG_USP_REG ) ,		// output [31:0] DBG_USP_REG
	.DBG_SSP_REG( DBG_SSP_REG ) ,		// output [31:0] DBG_SSP_REG
	.DBG_CYCLES( DBG_CYCLES ) ,		// output [31:0] DBG_CYCLES
	.DBG_IFETCH( DBG_IFETCH ) ,		// output  DBG_IFETCH
*/
	.os_rom_a( os_rom_a ) ,			// output [16:0] os_rom_a
	.os_rom_ce_n( os_rom_ce_n ) ,	// output  os_rom_ce_n
	.os_rom_oe_n( os_rom_oe_n ) ,	// output  os_rom_oe_n
	.os_rom_q( os_rom_q ) ,			// input [7:0] os_rom_q
	.os_rom_oe( os_rom_oe ) ,		// input  os_rom_oe
	
	.cart_a( cart_a ) ,			// output [23:0] cart_a
	.cart_ce_n( cart_ce_n ) ,	// output  cart_ce_n
	.cart_oe_n( cart_oe_n ) ,	// output [1:0] cart_oe_n
	.cart_q( cart_q ) ,			// input [31:0] cart_q
	.cart_oe( cart_oe ) ,		// input [1:0] cart_oe
	
	.fdram( fdram ) ,			// output  fdram
	
	.vga_bl( vga_bl ) ,		// output  vga_bl
	.vga_vs_n( vga_vs_n ) ,	// output  vga_vs_n
	.vga_hs_n( vga_hs_n ) ,	// output  vga_hs_n
	.vga_r( vga_r ) ,			// output [7:0] vga_r
	.vga_g( vga_g ) ,			// output [7:0] vga_g
	.vga_b( vga_b ) ,			// output [7:0] vga_b
	
	.hblank( hblank ) ,
	.vblank( vblank ) ,
	
//	.aud_l_pwm( aud_l_pwm ) ,	// output  aud_l_pwm
//	.aud_r_pwm( aud_r_pwm ) , 	// output  aud_r_pwm
	
	.aud_16_l( aud_16_l ) ,		// output  [15:0] aud_16_l
	.aud_16_r( aud_16_r ) ,		// output  [15:0] aud_16_r
	
	.xwaitl( xwaitl ) ,
	
	.vid_ce( vid_ce ) ,
	
	.dtack_n_out( dtack_n_out ) ,
	
	.joystick_0( joystick_0 ) ,
	
	.startcas( startcas ) ,
	
	.turbo( status[3] ) ,
	
	.ntsc( status[4] )
);

//wire [1:0] romwidth = status[5:4];
wire [1:0] romwidth = 2'd2;

reg xwaitl;

wire vid_ce;

wire dtack_n_out;

wire startcas;

/* verilator lint_on PINMISSING */

//wire DBG_CPU_RDEN/*synthesis keep*/;
//wire DBG_CPU_WREN/*synthesis keep*/;
//wire DBG_CPU_DTACK/*synthesis keep*/;
//wire [1:0] DBG_CPU_BENA/*synthesis keep*/;
//wire [31:0] DBG_CPU_ADDR/*synthesis keep*/;
//wire [15:0] DBG_CPU_RDATA/*synthesis keep*/;
//wire [15:0] DBG_CPU_WDATA/*synthesis keep*/;
//wire [3:0] DBG_REG_ADDR/*synthesis keep*/;
//wire [3:0] DBG_REG_WREN/*synthesis keep*/;
//wire [15:0] DBG_REG_DATA/*synthesis keep*/;
//wire [15:0] DBG_SR_REG/*synthesis keep*/;
//wire [31:0] DBG_PC_REG/*synthesis keep*/;
//wire [31:0] DBG_USP_REG/*synthesis keep*/;
//wire [31:0] DBG_SSP_REG/*synthesis keep*/;
//wire [31:0] DBG_CYCLES/*synthesis keep*/;
//wire DBG_IFETCH/*synthesis keep*/;

wire fdram;

`ifndef VERILATOR
wire os_rom_ce_n;
wire os_rom_oe_n;
wire os_rom_oe = (~os_rom_ce_n & ~os_rom_oe_n);	// os_rom_oe has to feed back TO the core, to enable the internal drivers.

wire [16:0] os_rom_a;	// Address from the core.

wire [16:0] os_rom_addr = (ioctl_download && ioctl_index==0) ? ioctl_addr[16:0] : os_rom_a;
wire os_rom_wren = ioctl_download && ioctl_index==0 && ioctl_wr;

os_rom_bram	os_rom_bram_inst (
	.clock ( clk_sys ),

	.address ( os_rom_addr ),
	.data ( ioctl_data[7:0] ),
	.wren ( os_rom_wren ),

	.q ( os_rom_dout )
);
wire [7:0] os_rom_dout;

wire [7:0] os_rom_q = (os_rom_a==17'h0136E && status[2]) ? 8'h60 :	// Patch the BEQ instruction to a BRA, to skip the cart checksum fail.
													os_rom_dout;

`endif


wire vga_bl;
wire vga_hs_n;
wire vga_vs_n;

wire [7:0] vga_r;
wire [7:0] vga_g;
wire [7:0] vga_b;


//assign VGA_DE = !vga_bl;
//assign VGA_HS = !vga_hs_n;
//assign VGA_VS = !vga_vs_n;

assign VGA_HS = vga_hs_n ^ vga_vs_n;
assign VGA_VS = vga_vs_n;

assign VGA_R = vga_r;
assign VGA_G = vga_g;
assign VGA_B = vga_b;


assign CLK_VIDEO = clk_sys;
assign CE_PIX = vid_ce;


//assign VGA_SL = {~interlace,~interlace} & sl[1:0];

video_mixer #(.LINE_LENGTH(640), .HALF_DEPTH(0)) video_mixer
(
	.clk_vid(CLK_VIDEO),					// input clk_sys
	.ce_pix( CE_PIX ),					// input ce_pix
	
	.ce_pix_out(CE_PIXEL),				// output ce_pix_out

	.scanlines(0),							// input [1:0] scanlines
	//.scandoubler(~interlace && (scale || forced_scandoubler)),
	
	.scandoubler(1'b0),
	
	.hq2x(scale==1),

	.mono(0),				// input mono
	
	.gamma_bus(gamma_bus),

	.R(vga_r),				// Input [DW:0] R (set by HALF_DEPTH. is [7:0] here).
	.G(vga_g),				// Input [DW:0] G (set by HALF_DEPTH. is [7:0] here).
	.B(vga_b),				// Input [DW:0] B (set by HALF_DEPTH. is [7:0] here).

	// Positive pulses.
	.HSync(vga_hs_n),		// input HSync
	.VSync(vga_vs_n),		// input VSync
	.HBlank(hblank),		// input HBlank
	.VBlank(vblank),		// input VBlank
	
//	.VGA_R( VGA_R ),		// output [7:0] VGA_R
//	.VGA_G( VGA_G ),		// output [7:0] VGA_G
//	.VGA_B( VGA_B ),		// output [7:0] VGA_B
//	.VGA_VS( VGA_VS ),	// output VGA_VS
//	.VGA_HS( VGA_HS ),	// output VGA_HS
	.VGA_DE( VGA_DE )		// output VGA_DE
);



wire aud_l_pwm;
wire aud_r_pwm;

wire [15:0] aud_16_l;
wire [15:0] aud_16_r;

assign AUDIO_S = 1;
assign AUDIO_MIX = 0;
assign AUDIO_L = aud_16_l;
assign AUDIO_R = aud_16_r;


wire [0:9] dram_a;
wire dram_ras_n;
wire dram_cas_n;
wire [0:3] dram_oe_n;
wire [0:3] dram_uw_n;
wire [0:3] dram_lw_n;
wire [0:63] dram_d;

//wire [0:63] dram_q = DDRAM_DOUT;
wire [0:63] dram_q = /*(!cart_ce_n) ? {sdram_dout,sdram_dout,sdram_dout,sdram_dout} :*/
							{DDRAM_DOUT[0], DDRAM_DOUT[1], DDRAM_DOUT[2], DDRAM_DOUT[3], DDRAM_DOUT[4], DDRAM_DOUT[5], DDRAM_DOUT[6], DDRAM_DOUT[7],
							 DDRAM_DOUT[8], DDRAM_DOUT[9], DDRAM_DOUT[10], DDRAM_DOUT[11], DDRAM_DOUT[12], DDRAM_DOUT[13], DDRAM_DOUT[14], DDRAM_DOUT[15],
							 DDRAM_DOUT[16], DDRAM_DOUT[17], DDRAM_DOUT[18], DDRAM_DOUT[19], DDRAM_DOUT[20], DDRAM_DOUT[21], DDRAM_DOUT[22], DDRAM_DOUT[23],
							 DDRAM_DOUT[24], DDRAM_DOUT[25], DDRAM_DOUT[26], DDRAM_DOUT[27], DDRAM_DOUT[28], DDRAM_DOUT[29], DDRAM_DOUT[30], DDRAM_DOUT[31],
							 DDRAM_DOUT[32], DDRAM_DOUT[33], DDRAM_DOUT[34], DDRAM_DOUT[35], DDRAM_DOUT[36], DDRAM_DOUT[37], DDRAM_DOUT[38], DDRAM_DOUT[39],
							 DDRAM_DOUT[40], DDRAM_DOUT[41], DDRAM_DOUT[42], DDRAM_DOUT[43], DDRAM_DOUT[44], DDRAM_DOUT[45], DDRAM_DOUT[46], DDRAM_DOUT[47],
							 DDRAM_DOUT[48], DDRAM_DOUT[49], DDRAM_DOUT[50], DDRAM_DOUT[51], DDRAM_DOUT[52], DDRAM_DOUT[53], DDRAM_DOUT[54], DDRAM_DOUT[55],
							 DDRAM_DOUT[56], DDRAM_DOUT[57], DDRAM_DOUT[58], DDRAM_DOUT[59], DDRAM_DOUT[60], DDRAM_DOUT[61], DDRAM_DOUT[62], DDRAM_DOUT[63]};

wire [0:3] dram_oe = (~dram_cas_n) ? ~dram_oe_n : 4'b0000;

/*
	input         DDRAM_BUSY,
	
	output  [7:0] DDRAM_BURSTCNT,
	output [28:0] DDRAM_ADDR,
	input  [63:0] DDRAM_DOUT,
	input         DDRAM_DOUT_READY,
	output        DDRAM_RD,
	output [63:0] DDRAM_DIN,
	output  [7:0] DDRAM_BE,
	output        DDRAM_WE,
*/
assign DDRAM_CLK = clk_sys;
assign DDRAM_BURSTCNT = 1;


// Jag DRAM is now mapped at 0x30000000 in DDR on MiSTer, hence the setting of the upper bits here.
// The cart ROM is loaded at 0x30800000, as the Jag normally expects the cart to be mapped at offset 0x800000.

assign DDRAM_ADDR = /*(loader_en)  ? {8'b0110000, loader_addr[23:3]} :	// */
						                 {8'b0110000, cart_a[23:3]};		// DRAM address is using "cart_a" here (byte address, so three LSB bits are ignored!)
																						// so the MSB bit will be set by the Jag core when reading that.

assign DDRAM_RD = /*(loader_en) ? 1'b0 :*/
										  DDR_RD_REQ;

assign DDRAM_WE = /*(loader_en) ? loader_wr :*/
										  DDR_WR_REQ;

// Byteswap...
//
// Needs this when loading the ROM on MiSTer, at least under Verilator simulation. ElectronAsh. 
//
wire [15:0] loader_data_bs = {loader_data[7:0], loader_data[15:8]};

//assign DDRAM_DIN = dram_d;
/*
assign DDRAM_DIN = (loader_en) ? {loader_data_bs, loader_data_bs, loader_data_bs, loader_data_bs} :
								//{loader_data, loader_data, loader_data, loader_data} :
								{r_dram_d[63], r_dram_d[62], r_dram_d[61], r_dram_d[60], r_dram_d[59], r_dram_d[58], r_dram_d[57], r_dram_d[56], 
								 r_dram_d[55], r_dram_d[54], r_dram_d[53], r_dram_d[52], r_dram_d[51], r_dram_d[50], r_dram_d[49], r_dram_d[48], 
								 r_dram_d[47], r_dram_d[46], r_dram_d[45], r_dram_d[44], r_dram_d[43], r_dram_d[42], r_dram_d[41], r_dram_d[40], 
								 r_dram_d[39], r_dram_d[38], r_dram_d[37], r_dram_d[36], r_dram_d[35], r_dram_d[34], r_dram_d[33], r_dram_d[32],
								 r_dram_d[31], r_dram_d[30], r_dram_d[29], r_dram_d[28], r_dram_d[27], r_dram_d[26], r_dram_d[25], r_dram_d[24], 
								 r_dram_d[23], r_dram_d[22], r_dram_d[21], r_dram_d[20], r_dram_d[19], r_dram_d[18], r_dram_d[17], r_dram_d[16], 
								 r_dram_d[15], r_dram_d[14], r_dram_d[13], r_dram_d[12], r_dram_d[11], r_dram_d[10], r_dram_d[9], r_dram_d[8], 
								 r_dram_d[7], r_dram_d[6], r_dram_d[5], r_dram_d[4], r_dram_d[3], r_dram_d[2], r_dram_d[1], r_dram_d[0]};


assign DDRAM_BE = (loader_en) ? loader_be :
						(!cart_ce_n) ? 8'b11111111 :
											DDRAM_BE_REG;
*/
reg [7:0] DDRAM_BE_REG;

assign DDRAM_DIN = {r_dram_d[63], r_dram_d[62], r_dram_d[61], r_dram_d[60], r_dram_d[59], r_dram_d[58], r_dram_d[57], r_dram_d[56], 
						  r_dram_d[55], r_dram_d[54], r_dram_d[53], r_dram_d[52], r_dram_d[51], r_dram_d[50], r_dram_d[49], r_dram_d[48], 
						  r_dram_d[47], r_dram_d[46], r_dram_d[45], r_dram_d[44], r_dram_d[43], r_dram_d[42], r_dram_d[41], r_dram_d[40], 
						  r_dram_d[39], r_dram_d[38], r_dram_d[37], r_dram_d[36], r_dram_d[35], r_dram_d[34], r_dram_d[33], r_dram_d[32],
						  r_dram_d[31], r_dram_d[30], r_dram_d[29], r_dram_d[28], r_dram_d[27], r_dram_d[26], r_dram_d[25], r_dram_d[24], 
						  r_dram_d[23], r_dram_d[22], r_dram_d[21], r_dram_d[20], r_dram_d[19], r_dram_d[18], r_dram_d[17], r_dram_d[16], 
						  r_dram_d[15], r_dram_d[14], r_dram_d[13], r_dram_d[12], r_dram_d[11], r_dram_d[10], r_dram_d[9], r_dram_d[8], 
						  r_dram_d[7], r_dram_d[6], r_dram_d[5], r_dram_d[4], r_dram_d[3], r_dram_d[2], r_dram_d[1], r_dram_d[0]};
						  
assign DDRAM_BE = /*(!cart_ce_n) ? 8'b11111111 :*/
											DDRAM_BE_REG;


`ifndef VERILATOR
wire [23:0] cart_a;
wire [31:0] cart_q;
wire [1:0] cart_oe;
`endif

wire cart_ce_n;
wire [1:0] cart_oe_n;

assign cart_oe[0] = (~cart_oe_n[0] & ~cart_ce_n);
assign cart_oe[1] = (~cart_oe_n[1] & ~cart_ce_n);

/*
assign cart_q = ({cart_a[2:1],1'b0}==0) ? {DDRAM_DOUT[63:48],DDRAM_DOUT[63:48]} :
				({cart_a[2:1],1'b0}==2) ? {DDRAM_DOUT[47:32],DDRAM_DOUT[47:32]} :
				({cart_a[2:1],1'b0}==4) ? {DDRAM_DOUT[31:16],DDRAM_DOUT[31:16]} :
										  {DDRAM_DOUT[15:0],DDRAM_DOUT[15:0]};
*/

// 8-bit cart mode... WORKING in Verilator! ElectronAsh.
//
/*
assign cart_q = ({cart_a[2:0]}==0) ? {DDRAM_DOUT[63:56],DDRAM_DOUT[63:56],DDRAM_DOUT[63:56],DDRAM_DOUT[63:56]} :
					 ({cart_a[2:0]}==1) ? {DDRAM_DOUT[55:48],DDRAM_DOUT[55:48],DDRAM_DOUT[55:48],DDRAM_DOUT[55:48]} :
					 ({cart_a[2:0]}==2) ? {DDRAM_DOUT[47:40],DDRAM_DOUT[47:40],DDRAM_DOUT[47:40],DDRAM_DOUT[47:40]} :
					 ({cart_a[2:0]}==3) ? {DDRAM_DOUT[39:32],DDRAM_DOUT[39:32],DDRAM_DOUT[39:32],DDRAM_DOUT[39:32]} :
					 ({cart_a[2:0]}==4) ? {DDRAM_DOUT[31:24],DDRAM_DOUT[31:24],DDRAM_DOUT[31:24],DDRAM_DOUT[31:24]} :
					 ({cart_a[2:0]}==5) ? {DDRAM_DOUT[23:16],DDRAM_DOUT[23:16],DDRAM_DOUT[23:16],DDRAM_DOUT[23:16]} :
					 ({cart_a[2:0]}==6) ? {DDRAM_DOUT[15:8],DDRAM_DOUT[15:8],DDRAM_DOUT[15:8],DDRAM_DOUT[15:8]} :
												 {DDRAM_DOUT[7:0],DDRAM_DOUT[7:0],DDRAM_DOUT[7:0],DDRAM_DOUT[7:0]};
*/

//assign cart_q = (!cart_a[2]) ? DDRAM_DOUT[63:32] : DDRAM_DOUT[31:0];


sdram sdram
(
	.init(~pll_locked),
	
	.clk( clk_sys ),				// Don't need the phase shift any more. DDIO is used to generate SDRAM_CLK instead (Sorg magic).

	.SDRAM_DQ( SDRAM_DQ ),		// 16 bit bidirectional data bus
	.SDRAM_A( SDRAM_A) ,			// 13 bit multiplexed address bus
	.SDRAM_DQML( SDRAM_DQML ) ,// two byte masks
	.SDRAM_DQMH( SDRAM_DQMH ) ,// 
	.SDRAM_BA( SDRAM_BA ),		// two banks
	.SDRAM_nCS( SDRAM_nCS ),	// a single chip select
	.SDRAM_nWE( SDRAM_nWE ),	// write enable
	.SDRAM_nRAS( SDRAM_nRAS ),	// row address select
	.SDRAM_nCAS( SDRAM_nCAS ),	// columns address select
	.SDRAM_CKE( SDRAM_CKE ),	// clock enable
	.SDRAM_CLK( SDRAM_CLK ),	// clock for chip
	
	// Port 1.
	.ch1_addr( {2'b00, ioctl_addr[24:1]} ),	// 16-bit WORD address!! [26:1]
	.ch1_dout(  ),										// output [63:0]
	.ch1_rnw( 1'b0 ),									// Write-only for cart loading.
	.ch1_din( {ioctl_data[7:0], ioctl_data[15:8]} ),		// input [15:0]	- Data from HPS is BYTE swapped!
	.ch1_req( ioctl_download & ioctl_wr & ioctl_index>0 ),	
	.ch1_ready( rom_wrack ),
	
	// Port 2.
	.ch2_addr( sdram_word_addr ),					// 16-bit WORD address!! [26:1]
	.ch2_dout( sdram_dout ),						// output [31:0]
	.ch2_rnw( 1'b1 ),									// Read-only for cart ROM reading!
	.ch2_din( 16'h0000 ),							// input [15:0]
	.ch2_req( !ioctl_download & sdram_rd_trig ),
	.ch2_ready( sdram_ready ),
	
	// Port 3.
	//.ch3_addr( {4'b0000, cart_a[22:1]} ),	// 16-bit WORD address!! [26:1]
	//.ch3_dout( sdram_dout ),						// output [15:0]
	//.ch3_rnw( 1'b1 ),								// Read-only for cart ROM reading!
	//.ch3_din( 16'h0000 ),							// input [15:0]
	//.ch3_udqm_n( 1'b0 ),
	//.ch3_ldqm_n( 1'b0 ),
	//.ch3_req( !ioctl_download & sdram_rd_trig ),
	//.ch3_ready( sdram_ready )
);

(*keep*) wire rom_wrack;


// Cart ROM reading...
(*keep*) wire sdram_ready;
(*keep*) wire [31:0] sdram_dout;

wire [31:0] cart_q_8bit = (!cart_a[0]) ? {sdram_dout[15:8], sdram_dout[15:8]} :
													  {sdram_dout[7:0],  sdram_dout[7:0]};

wire [31:0] cart_q_16bit = {sdram_dout[15:0], sdram_dout[15:0]};

// With MEMCON1 in 32-bit wide mode, cart_a seems to increment by ONE when reading each 32-bit word.
// So we need to add an extra LSB bit to the address sent to the SDRAM controller (because 16-bit).
//
// Then route bits [22:0] of cart_a as well, since the SDRAM controller address is in 16-bit WORDs,
// but also does burst reads, so will output full 32-bit data. Phew.
//
wire [31:0] cart_q_32bit = {sdram_dout[15:0], sdram_dout[31:16]};

//assign cart_q = (romwidth==2'd0) ? cart_q_8bit :
//					   (romwidth==2'd1) ? cart_q_16bit :
//							   				 cart_q_32bit;c

wire [26:1] sdram_word_addr = {4'b0000, cart_a[22:1]};

//assign cart_q = cart_q_16bit;
assign cart_q = (cart_a>=24'h800400 && cart_a<=24'h800403) ? 16'h0202 : SDRAM_DQ;


reg cart_ce_n_1 = 1;
wire cart_ce_n_falling = (cart_ce_n_1 && !cart_ce_n);

reg [23:0] old_cart_a;

wire sdram_rd_trig = !cart_ce_n && (cart_ce_n_falling || (cart_a != old_cart_a));

always @(posedge clk_sys or posedge reset)
if (reset) begin
	xwaitl <= 1'b1;	// De-assert on reset!
	old_cart_a <= 24'h112233;
end
else begin
	cart_ce_n_1 <= cart_ce_n;
	old_cart_a <= cart_a;

	if (sdram_rd_trig) begin
		xwaitl <= 1'b0;	// Assert this (low) until the Cart data is ready.
	end
	else if (sdram_ready) xwaitl <= 1'b1;				// De-assert, to let the core know.
end



`define SS_IDLE	4'b0000
`define SS_END		4'b1111

`define SS_RD_1	4'b0001
`define SS_RD_2	4'b0010
`define SS_RD_3	4'b0011
`define SS_RD_4	4'b0100
`define SS_RD_5	4'b0101

`define SS_WR_1	4'b1001
`define SS_WR_2	4'b1010
`define SS_WR_3	4'b1011
`define SS_WR_4	4'b1100
`define SS_WR_5	4'b1101


wire ram_rdy = DDRAM_DOUT_READY || (mem_cyc == `SS_END);

reg	[0:63]	r_dram_d;

reg DDR_RD_REQ;
reg DDR_WR_REQ;

(*noprune*) reg [3:0] mem_cyc;

always @(posedge clk_sys or posedge reset)
if (reset) begin
	mem_cyc <= `SS_IDLE;
end
else begin
	DDR_RD_REQ <= 1'b0;
	DDR_WR_REQ <= 1'b0;
	
	//if (~fdram) begin	// Seems to make the games more stable. Maybe the games abort certain RAM accesses?
		//mem_cyc <= `SS_IDLE;
	//end else begin
		case (mem_cyc)
			`SS_IDLE: begin
				//if (fdram && (dram_oe_n != 4'b1111)) begin
				if (startcas && (dram_oe_n != 4'b1111)) begin
					//mem_cyc <= `SS_RD_1;
					DDR_RD_REQ <= 1'b1;
					if (!DDRAM_BUSY) mem_cyc <= `SS_RD_2;
				end
				//else if (fdram && ({dram_uw_n, dram_lw_n} != 8'b11111111)) begin
				else if (startcas && ({dram_uw_n, dram_lw_n} != 8'b11111111)) begin
					DDRAM_BE_REG <= ~{ dram_uw_n[3], dram_lw_n[3], 
											 dram_uw_n[2], dram_lw_n[2], 
											 dram_uw_n[1], dram_lw_n[1], 
											 dram_uw_n[0], dram_lw_n[0] };
					r_dram_d <= dram_d;	
					//mem_cyc <= `SS_WR_2;
					DDR_WR_REQ <= 1'b1;
					if (!DDRAM_BUSY) mem_cyc <= `SS_END;
				end
			end
			//`SS_RD_1: begin
				//DDR_RD_REQ <= 1'b1;
				//if (!DDRAM_BUSY) mem_cyc <= `SS_RD_2;
			//end
			`SS_RD_2: if (DDRAM_DOUT_READY) begin
				mem_cyc <= `SS_END;
			end
			//`SS_WR_2: begin
				//DDR_WR_REQ <= 1'b1;
				//if (!DDRAM_BUSY) mem_cyc <= `SS_END;
			//end
			
			default:		// This is essentially the `SS_END mem_cyc state. (ElectronAsh).
				//if (dram_cas_n) begin
				if (!startcas) begin
					mem_cyc <= `SS_IDLE;
				end else begin
					mem_cyc <= `SS_END;
				end
		endcase
	//end
end



endmodule
