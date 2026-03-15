//-----------------------------------------------------------------------------
//
// Title       : TutorVerilog
// Design      : TutorVerilog
// Author      : patrycja
// Company     : agh
//
//-----------------------------------------------------------------------------
//
// File        : D:/Vivado/TutorVerilog/src/TutorVerilog.v
// Generated   : Fri Jun 13 21:14:35 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {TutorVerilog}}

module TutorVerilog (CLK,CLR,CE,LOAD,DATA,DIR,SEL,OE,LE,Q);
	
	input CLK, CLR, CE, LOAD, DIR, SEL, OE, LE; 
	input [3:0] DATA;	
	output [3:0] Q;	
	wire CLK, CLR, CE, DIR, LOAD, SEL, OE, LE;	
	wire [3:0] Q_SEL;	// internal signal
	wire [3:0] DATA;   // internal signal
	wire [3:0] Q;	  // internal signal
	
	//}} End of automatically maintained section
	// -- Enter your statements here -- //	 
	reg [3:0] L_DAT;
	reg [3:0] Q_INT;
	
	always @ (posedge CLK or posedge CLR) begin		
		if (CLR)
			Q_INT <= 4'b0000; 
		else if(LOAD)								
			Q_INT <= DATA;		
		else if (CE) begin
			if(DIR == 1'b0) begin
					if (Q_INT == 4'd9)
						Q_INT <= 4'b0000;
					else
						Q_INT <= Q_INT + 1;
				end else begin //  END OF UP-COUNT BLOCK
				    if (Q_INT == 4'd0)
	                    Q_INT <= 4'd9;
	                else
	                    Q_INT <= Q_INT - 1;
				end	 //  END OF DOWN-COUNT BLOCK		
		end		 // END OF CE BLOCK	   
	end	   // END OF always BLOCK			  
		
		
		
	assign Q_SEL = (SEL == 1'b0) ? Q_INT : L_DAT; // Multiplexer
	
	assign Q = (OE == 1'b1) ? Q_SEL : 4'bz;		// 3 state buffor 
	
	
	always @ (LE or DATA or CLR) begin
    if (CLR)
        L_DAT = 4'b0000;
    else if (LE)		   // LE == 1, give  data as input to multiplexer
        L_DAT = DATA;
    				   // else keep previous value
end
	
endmodule
