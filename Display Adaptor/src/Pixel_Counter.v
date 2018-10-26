module Pixel_Counter(PxOut,clock, ResetPx, IncPx);

input clock,ResetPx,IncPx;
output reg[3:0] PxOut;

initial
begin
	PxOut = 4'b0000;
end

always @(posedge clock)
begin
	if(ResetPx) PxOut <= 4'b0000;
	else if(IncPx) PxOut <= PxOut+4'b0001;
end
endmodule

