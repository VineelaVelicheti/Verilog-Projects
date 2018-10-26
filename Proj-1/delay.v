module delay(dOut2, reset,clock, dOut1);
input clock,reset;
input [7:0] dOut1;
output reg [7:0] dOut2;


always@(posedge clock or posedge reset)
begin
if(reset) dOut2 <= 8'b0;
else dOut2 <= dOut1;
end
endmodule
