module sequential(dataInB,datainA, clock, reset);
output [7:0] dataInB;
input clock, reset;
input [7:0] datainA;
wire incA, clock, reset, weA, incB, weB;
wire[2:0] addrA;
wire[1:0] addrB;
wire [7:0] dOut1,dOut2;

controller contr(weA,incA,weB,incB,clock,reset);
counterA countA(addrA, clock, reset, incA);
memoryA memA(dOut1, clock, reset, addrA, weA, datainA);
delay d1 (dOut2, reset,clock, dOut1);
alu alu1(dataInB, dOut2, dOut1);
counterB countB(addrB, clock, reset, incB);
memoryB memB(dataInB,weB,addrB,clock,reset);
endmodule
