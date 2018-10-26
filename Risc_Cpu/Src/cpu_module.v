module cpu_module(din,clock,rs1_data,rs2_data);

output  [31:0] din;
input[31:0] rs1_data,rs2_data;
input clock;

wire[31:0] data_out;
wire [4:0] rs1,rs2,rd,rd_d1,rd_d2,rd_d3,rs_value;
wire clock,branch,jump;
wire [15:0] immediate_value;
wire [25:0] immediate_jump;
wire[31:0] addr_in,reg_rs1,reg_rs2,immediate_value_sign,reg_rs2_d1,reg_rs1_d1,immediate_value_d1,mux1_out,mux2_out,alu_out,reg_rs1_d2,alu_out_d2,immediate_value_d2,
DOut,reg_rs1_d3,alu_out_d3,immediate_value_d3,DOut_d3,opcode_d3,din,pc_delay,rs_value_sign,pc_add_imme;
wire [5:0] opcode_d1,opcode,opcode_d2;
wire register_we,data_we,data_we_d2,register_we_d2,register_we_d3;


program_counter pc (branch,jump,pc_add_imme,addr_in,clock);  // linking aadr_in of pc to instruction memory
instruction_memory im (data_out,addr_in); // linking data_out from in_mem to instr_register
delay_pc delayPC (pc_delay,addr_in,clock);
instruction_register ir(opcode,rs1,rs2,rd,immediate_value,immediate_jump,rs_value,data_out,clock); //linking rs1,rs2,rd to reg file and linking opcode and immediate value to delay_output


sign_extension signex (opcode,immediate_value,rs_value,immediate_jump,immediate_value_sign,rs_value_sign);
branch_program bp (pc_add_imme,pc_delay,immediate_value_sign,opcode);
opcode_decoder od(register_we,data_we,opcode);
register_file rf(reg_rs1,reg_rs2,rs1,rs2,rd_1, rs1_data,rs2_data,din,clock,we_1);//Linking reg_rs1 and reg_rs2 to delay module
compare_branch cb (branch,jump,reg_rs1,rs_value_sign,opcode);
program_counter pc_again(branch,jump,pc_add_imme,addr_in,clock);


delay_input delay1 (reg_rs1_d1,reg_rs2_d1,opcode_d1,rd_d1,immediate_value_d1,register_we_d1,data_we_d1,reg_rs1,reg_rs2,rd,immediate_value_sign,opcode,register_we,data_we,clock);
mux1 m1(mux1_out,opcode_d1,reg_rs2_d1,reg_rs1_d1); //taking the connection from delay module
mux2 m2 (mux2_out,opcode_d1,reg_rs2_d1,immediate_value_d1);
arithmetic_logic_unit alu(alu_out,mux1_out,mux2_out,opcode_d1);
delay_input2 delay2(clock,reg_rs1_d1,alu_out,immediate_value_d1,opcode_d1,register_we_d1,data_we_d1,rd_d1,reg_rs1_d2,alu_out_d2,immediate_value_d2,opcode_d2,rd_d2,register_we_d2,data_we_d2);

data_memory dmem (DOut,reg_rs1_d2,alu_out_d2,data_we_d2,opcode_d2);
delay_input3 delay3 (clock,reg_rs1_d2,alu_out_d2,immediate_value_d2,opcode_d2,register_we_d2,rd_d2,DOut,reg_rs1_d3,alu_out_d3,immediate_value_d3,opcode_d3,rd_d3,register_we_d3,DOut_d3);
mux_output mux (din,reg_rs1_d3,alu_out_d3,immediate_value_d3,DOut_d3,opcode_d3);
register_file rfwrite (reg_rs1,reg_rs2,rs1,rs2,rd_d3, rs1_data,rs2_data,din,clock,register_we_d3);//Linking reg_rs1 and reg_rs2 to delay module

endmodule



