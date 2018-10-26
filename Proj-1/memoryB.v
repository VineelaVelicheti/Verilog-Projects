module memoryB(dataInB,weB,addrB,clock,reset);
input weB, clock, reset;
input [1:0] addrB;
input[7:0] dataInB;

reg [7:0] memB [3:0];
integer i;

always@(*)
begin
if(reset) 
begin
	for( i = 0; i<= addrB; i = i+1) memB[i] <= 8'b0;
end
else if(weB) memB[addrB] <= dataInB;
end
endmodule
