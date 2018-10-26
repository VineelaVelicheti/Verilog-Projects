module counterA(addrA, clock, reset, incA);
input clock,reset,incA;
output reg[2:0] addrA;

initial
begin
	addrA = 3'b111;
end

always @(posedge clock or posedge reset or incA)
begin
if(reset) addrA <= 3'b111;
else if(incA) addrA <= addrA + 3'b001;
end 
endmodule

