module FSM(I,clock,reset,F);
input clock;
input reset;
input I;
output reg F;

parameter
S0=3'b000,
S1=3'b001,
S2=3'b010,
S3=3'b011,
S4=3'b100;

reg [2:0] CS, NS;

always @(posedge clock)
begin
if (reset==1)
CS <= S0;
else
CS <=NS;
end

always @(CS,I)
begin
	case(CS)
	S0:begin
	if (I==1)
		NS = S1;
	
	else
		NS=S0;
	end

	S1:begin
	if (I==1)
		NS = S1;
	
	else
		NS=S2;
	end
	
	S2:begin
	if (I==1)
		NS = S1;
	
	else
		NS=S3;
	end	
	S3:begin
	if (I==1)
		NS = S4;
	
	else
		NS=S0;
	end
		
	S4:begin
	if (I==1)
		NS = S1;
	
	else
		NS=S2;
	end
	
	default:NS = S0;
	endcase
	
	if (CS==S4)
		F = 1;
	else
		F = 0;
	end
	endmodule
	