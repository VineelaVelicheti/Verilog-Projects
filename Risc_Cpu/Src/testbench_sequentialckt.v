module testbench_sequentialckt();
reg clock,reset;
reg[7:0] dataIn;
wire[7:0]data_outB;

sequential_circuit seq (data_outB,clock,reset,dataIn);

initial
begin
clock=0;
forever #5 clock = ~clock;
end

initial
begin
reset=1;
#10 reset = 0;

end

/*initial
begin
incA=1;
weA=1;
end*/

initial@(negedge reset)
begin
  dataIn=8'b1011;
#10 dataIn=8'b1001;
#10 dataIn=8'b1101;
#10 dataIn=8'b110;
#10 dataIn=8'b111;
#10 dataIn=8'b100;
#10 dataIn=8'b1110;
#10 dataIn=8'b10;
end

endmodule
