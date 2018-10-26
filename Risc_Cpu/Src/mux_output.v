module mux_output(din,reg_rs1_d3,alu_out_d3,immediate_value_d3,DOut_d3,opcode_d3);

output reg [31:0] din;
input [31:0] reg_rs1_d3,alu_out_d3,immediate_value_d3,DOut_d3;
input [5:0] opcode_d3;

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

always@*
begin

if(opcode_d3 ==  NOP || opcode_d3 ==  ADD || opcode_d3 == SUB || opcode_d3 == SGE || opcode_d3 == SLE || opcode_d3 == SGT ||opcode_d3 == SLT || opcode_d3 == SEQ 
|| opcode_d3 == SNE || opcode_d3 == AND || opcode_d3 == OR || opcode_d3 == XOR ||opcode_d3 == NOT || opcode_d3 == SLI || opcode_d3 == SRI || opcode_d3 == ADDI || opcode_d3 == SUBI ) 

din <= alu_out_d3;

else if (opcode_d3 == LOAD) din <= DOut_d3;
else if (opcode_d3 == MOVE) din <= reg_rs1_d3;
else if (opcode_d3 == MOVEI) din <= immediate_value_d3;
else din <= 1111;

end

endmodule