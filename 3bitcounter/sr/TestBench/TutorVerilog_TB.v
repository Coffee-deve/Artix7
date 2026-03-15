//-----------------------------------------------------------------------------
//
// Title       : TutorVerilog_tb
// Design      : Verilog_design
// Author      : Patrycja
// Company     : AGH
//
//-----------------------------------------------------------------------------
//
// File        : TutorVerilog_TB.v
// Generated   : Fri Nov  3 17:38:01 2023
// From        : d:\My_Designs\Tutorials\Verilog_design\src\TestBench\TutorVerilog_TB_settings.txt
// By          : tb_verilog.pl ver. ver 1.2s
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ns / 1ps
module TutorVerilog_tb;
	
	
	//Internal signals declarations:
	reg CLK;		 
	//ex2 : change the signal from synchronous RST to asynchronous CLR	
	reg CLR;	 //reg RST;	
	reg CE;		 	
	reg LOAD;
	reg DIR; 
	reg SEL;	   
	reg OE;		 
	reg LE;
	reg [3:0] DATA;
	wire [3:0]Q;
	
	// Unit Under Test port map
	TutorVerilog UUT (
		.CLK(CLK),
		.CLR(CLR),			// .RST(RST),	 
		.CE(CE),  
		.DIR(DIR),
		.LOAD(LOAD),
		.DATA(DATA),
		.SEL(SEL),
		.OE(OE),
		.LE(LE),
		.Q(Q)
		);
	
	
	//Verification stimuli
	
	initial
		begin : CLR_STIM // begin of stimulus process
			CLR = 1'b0;	// 0 ns
			#75;		 		
			CLR = 1'b1;	//75 ns
			#100; 			
			CLR = 1'b0;	//175 ns	   
			#100
			CLR = 1'b0;	// 275 ns
			#95;		 		
			CLR = 1'b1;	//370 ns
			#100; 			
			CLR = 1'b0;	//470 ns
		end // end of stimulus process		
		
	initial begin : CE_STIM
		CE = 1'b1;			// enable counting at start
		#500;
		CE = 1'b0;			// disable for ~2-3 clock periods
		#300;
		CE = 1'b1;			// enable again
	end
	
	initial
		begin : CLOCK_STIM // begin of clock process
			CLK = 1'b0;
			forever #50 CLK = ~CLK;	// 10 MHz clock
		end // end of stimulus process	  
	initial 
		begin: LOAD_STIM
			LOAD = 1'b0; 
			DATA = 4'b0000;
			#1000;		 
			DATA = 4'b0101;
			LOAD = 1'b1; 
			#100;
			LOAD = 1'b0;
		    #200;
			DATA = 4'b1000;	 
			LOAD = 1'b1;
			#100
			LOAD = 1'b0;
		end		   
		initial
			begin: DIR_STIM
				DIR = 1'b0;
				#1600;
				DIR = 1'b1;		
				#500;
				DIR = 1'b0;
				#500
				DIR = 1'b1;
				#100
				DIR = 1'b0;
			end		
		initial 
			begin: SEL_STIM
				SEL = 1'b0;
				#3000;
				SEL = 1'b1;
				#200;
				SEL = 1'b0;		 
				#200;
				SEL = 1'b1;
				#200;		 
				SEL = 1'b0;	 
		 	end	 
		initial 
			begin: OE_STIM
	 			OE = 1'b1;
				#4000;
				OE = 1'b0;
				#100;
				OE = 1'b1;
				#100;
				OE = 1'b0;
				#100;
				OE = 1'b1;
				
		 	end		 
			 
		initial
			begin : LE_STIM
			    LE = 1'b0; 
				#4400;	  
				SEL = 1'b1;
			    #100; 
			    LE = 1'b1;
				#100 	
				DATA = 4'b0010;	
			    #100;
				DATA = 4'b0100;
				#100;
				DATA = 4'b0001;
				#700;
			    LE = 1'b0; 
				SEL = 1'b0;
			    #100;
			    LE = 1'b1; 
			    #100;
			    LE = 1'b0;
			end
endmodule
