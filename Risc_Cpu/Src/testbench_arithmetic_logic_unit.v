module testbench_arithmetic_logic_unit();

wire[31:0] alu_out;
reg[31:0] reg_rs1,reg_rs2;
reg [5:0] opcode;

arithmetic_logic_unit alu(alu_out,reg_rs1,reg_rs2,opcode);

initial 
begin
opcode = 6'b1; reg_rs1 = 32'b01;  reg_rs2 = 32'b10; //add
#10 opcode = 6'b110; reg_rs1 = 32'b101;  reg_rs2= 32'b01; // sge
#10 opcode = 6'b1010; reg_rs1 = 32'b101; reg_rs2=32'b101; //seq
#10 opcode =  6'b10001; reg_rs1 = 32'b101; reg_rs2 = 32'b1; //sli
end

endmodule
