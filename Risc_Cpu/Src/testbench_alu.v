module testbench_ALU();

reg[7:0] dOut1;
reg[7:0] dOut2;
reg clk;
wire[7:0] dataInB;

alu c1(dataInB,clk,dOut1,dOut2);

initial
begin
clk=1;
forever #5 clk=~clk;
end

initial 
begin
dOut1=8'b1010; dOut2=8'b0001;
#10 dOut1=8'b0100; dOut2=8'b1011;
#10 dOut1=8'b1100; dOut2=8'b0;
#10 dOut1=8'b0010; dOut2=8'b1111;
end
endmodule
