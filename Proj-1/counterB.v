module counterB(addrB, clock, reset, incB);
input clock,reset,incB;
output reg[1:0] addrB;

initial
begin
	addrB = 2'b0;
end

always @(incB or posedge reset)
begin
if(reset) addrB<= 2'b0;
else if(incB == 1) addrB <= addrB + 2'b01;
end 
endmodule

