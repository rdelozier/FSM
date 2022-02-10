`timescale 1ns/1ps
module FSM_tb();
	reg I, clock, reset;
	wire F;
	
	FSM uut (.I(I),.clock(clock),.reset(reset),.F(F));
	
	initial
	begin
	clock=1'b0;
	reset=1'b0;
	I = 1'b0;
	end
	
	always
	begin
	#10
	clock = (clock == 0)? 1:0;
	end
	
	always
	begin
	#10 I = 1'b1;
	#10 I = 1'b0;
	#10 I = 1'b1;
	#10 I = 1'b0;
	#10 I = 1'b0;
	#10 I = 1'b1;
	#10 I = 1'b0;
	#10 I = 1'b0;
	#10 I = 1'b1;
	#10 I = 1'b0;
	#10 I = 1'b0;
	#10 I = 1'b1;
	#10 I = 1'b0;
	#10 reset = 1'b1;
	#10 reset = 1'b0;
	end

	initial begin
		#1000 $stop;
	end
	endmodule
	
							
	

	
	