module alu(dataInB, dOut2, dOut1);
output reg [7:0] dataInB;
input[7:0] dOut1, dOut2;

always @(dOut2)
begin
if(dOut2 > dOut1) dataInB <= dOut1 + dOut2;
else if (dOut2 < dOut1) dataInB <= dOut1 - dOut2;
else if ((dOut1 == 0) && (dOut2 == 0)) dataInB <= 8'b0;
end
endmodule
