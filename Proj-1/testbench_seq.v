module testbench_seq();
wire[7:0] dataInB;
reg clock, reset;
reg[7:0] datainA;

sequential seq(dataInB,datainA, clock, reset);
initial 
begin
	clock=0;
	forever #5 clock=~clock;
	
end

initial 
begin
	reset = 1;
	#5 reset = 0;
	#130 reset = 1;
	#20 reset = 0;

end


initial 
begin
#5 datainA = 8'b1;
#10 datainA = 8'b11;
#10 datainA = 8'b1100;
#10 datainA = 8'b10100;
#10 datainA = 8'b10010;
#10 datainA = 8'b111;
#10 datainA = 8'b100;
#10 datainA = 8'b1011;

end
endmodule
