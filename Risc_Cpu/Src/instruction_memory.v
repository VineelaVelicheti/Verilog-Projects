module instruction_memory(data_out,addr_in);
input[31:0] addr_in;
output reg[31:0] data_out;
reg[31:0] in_memory[31:0];
//input[15:0] immediate_value;
//input[25:0] immediate_jump;
//input[4:0] rs_value;


//parameter immediate_value = 16'b101;
//parameter immediate_jump = 26'b011;
//parameter rs_value = 5'b111;

parameter rs1 = 5'b0;
parameter rs2 = 5'b01;
parameter rd = 5'b10;
parameter NOP = 6'b0;
parameter ADD = 6'b1;
parameter SUB = 6'b10;
parameter STORE = 6'b11;
parameter LOAD= 6'b100;
parameter MOVE = 6'b101;
parameter SGE = 6'b110;
parameter SLE = 6'b111;
parameter SGT = 6'b1000;
parameter SLT = 6'b1001;
parameter SEQ = 6'b1010;
parameter SNE = 6'b1011;
parameter AND = 6'b1100;
parameter OR = 6'b1101;
parameter XOR= 6'b1110;
parameter NOT = 6'b1111;
parameter MOVEI = 6'b10000;
parameter SLI = 6'b10001;
parameter SRI = 6'b10010;
parameter ADDI = 6'b10011;
parameter SUBI = 6'b10100;
parameter JUMP = 6'b10101;
parameter BRA = 6'b10110;
parameter ADDF = 6'b10111;
parameter MULF = 6'b 11000;

initial 
begin
	

        in_memory[32'b0] = {NOP,rs1,rs2,rd,11'b0} ;
        in_memory[32'b01] = {ADD,rs1,rs2,rd,11'b0};
        in_memory[32'b10] = {JUMP,26'b0110};
        in_memory[32'b11] = {STORE,rs1,rd,16'b100};
        in_memory[32'b100] = {XOR,rs1,rs2,rd,11'b0};
        in_memory[32'b101] = {AND,rs1,rs2,rd,11'b0};
	in_memory[32'b110] = {SGE,rs1,rs2,rd,11'b0};
        in_memory[32'b111] = {SLE,rs1,rs2,rd,11'b0};
	in_memory[32'b1000] = {SGT,rs1,rs2,rd,11'b0};
	in_memory[32'b1001] = {SLT,rs1,rs2,rd,11'b0};
	in_memory[32'b1010] = {SEQ,rs1,rs2,rd,11'b0};
	in_memory[32'b1011] = {SNE,rs1,rs2,rd,11'b0};
	in_memory[32'b1100] = {AND,rs1,rs2,rd,11'b0};
	in_memory[32'b1101] = {OR,rs1,rs2,rd,11'b0};
	in_memory[32'b1110] = {XOR,rs1,rs2,rd,11'b0};
	in_memory[32'b1111] = {NOT,rs1,rd,16'b0};	
	in_memory[32'b10000] = {MOVEI,5'b0,rd,16'b10};
	in_memory[32'b10001] = {SLI,rs1,rd,16'b10};
	in_memory[32'b10010] = {SRI,rs1,rd,16'b10};
	in_memory[32'b10011] = {ADDI,rs1,rd,16'b10};
	in_memory[32'b10100] = {SUBI,rs1,rd,16'b10};
	in_memory[32'b10101] = {ADD,rs1,rs2,rd,11'b0};
	in_memory[32'b10110] = {SLI,rs1,rd,16'b10};
	in_memory[32'b10111] = {SGT,rs1,rs2,rd,11'b0};
	in_memory[32'b11000] = {SLT,rs1,rs2,rd,11'b0};
	in_memory[32'b11001] = {SEQ,rs1,rs2,rd,11'b0};
        in_memory[32'b11010] = {BRA,rs1,5'b111,16'b11};


			
end

always@(addr_in)
begin
	if(addr_in > 32'b11010)
		begin
		//display$("Address out of range");
		$stop;
		end
else
begin 
             data_out = in_memory[addr_in];
end

end


endmodule
	



