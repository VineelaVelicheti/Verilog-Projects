module testbench_cpu_module();

wire[31:0] reg_rs1,reg_rs2;
reg[31:0] addr_in,rs1_data,rs2_data,din;
reg clock,we;

//cpu_module cpu(reg_rs1,reg_rs2,addr_in,,din,rs1_data,rs2_data,clock,we);

initial
begin
clock = 0;
forever  #5 clock = ~ clock;
end

initial
begin
 addr_in = 32'b00;
#6 addr_in = 32'b01;we=0; rs1_data = 32'b01;rs2_data = 32'b10; din = 32'b11;//ADD
#10 addr_in=32'b10; we=0;rs1_data = 32'b111;rs2_data = 32'b11; din = 32'b1;//SUB
#10 addr_in=32'b10; we=0;rs1_data = 32'b100;rs2_data = 32'b101; din = 32'b110;
#10 addr_in = 32'b00;rs1_data = 32'b00;rs2_data = 32'b00;
//#10 addr_in = 32'b00;
/*#10 addr_in = 32'b10110; //BRA
#10 addr_in = 32'b10101; //JUMP
#10 addr_in = 32'b10001;  // SLI*/
end

endmodule
