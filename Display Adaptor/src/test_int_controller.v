module test_int_controller();

//wire RE0, WE0, SelR0, SelG0, SelB0, SelBuf0, SelBlank, SyncVB, Buf1Empty, IncAddr0, ResetAddr0;
reg [3:0] VBOut, AILOut, AIPOut;
reg clock, reset, CSDisplay;


int_controller ic(CSDisplay,VBOut,AILOut,AIPOut,clock, reset);


initial
begin
	clock=0;
	forever #5 clock =~clock;
end

initial
begin
	reset = 0;
	#6 CSDisplay=1; VBOut = 4'b0010; AILOut = 4'b1010; AIPOut = 4'b1010;
end


endmodule

