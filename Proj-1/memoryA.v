module memoryA(dOut1, clock, reset, addrA, weA, datainA);

output reg[7:0] dOut1;
input weA, clock, reset;
input[7:0] datainA;
input[2:0] addrA;

reg [7:0] memA [7:0];
integer i;
always @(addrA)
begin
//writing
if(reset) 
begin
	for( i = 0; i <= addrA; i = i+1) memA[i] = 8'b0;
end
else if(weA) memA[addrA] <= datainA;
end

//reading
always@(posedge clock or posedge reset)
if(reset) dOut1 <= 8'b0;
else if(!weA) dOut1 <= memA[addrA];
endmodule

