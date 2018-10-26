module testbench_instruction_register();

wire[5:0]opcode;
wire[4:0]rs1;
wire[4:0]rs2;
wire[4:0]rd;
wire[15:0]immediate_value;
wire[25:0]immediate_jump;
wire[4:0] rs_value;
reg [31:0] data_out;
reg clock;

instruction_register inst_reg(opcode,rs1,rs2,rd,immediate_value,immediate_jump,rs_value,data_out,clock);

initial 
begin
clock=0;
forever #5 clock=~clock;
end

initial 
begin

#5 data_out = 32'b01000100000000100000000000000101; //SLI
#10 data_out = 32'b00000100000000010001000000000000; //ADD
end

endmodule