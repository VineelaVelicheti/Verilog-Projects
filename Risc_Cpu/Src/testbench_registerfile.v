module testbench_registerfile();

wire[31:0]  reg_rs1, reg_rs2;
reg [4:0] rs1, rs2, rd;
reg [31:0] din,rs1_data,rs2_data;
reg clock,we;

register_file rf (reg_rs1,reg_rs2,rs1,rs2,rd, rs1_data,rs2_data,din,clock,we);

//Creating clock signal
initial
begin
clock = 0;
forever  #5 clock = ~ clock;
end

initial
begin
#15  we = 0;din = 32'b1; rd = 5'b10; rs1 = 5'b0; rs2 = 5'b1;rs1_data = 32'b101 ; rs2_data = 32'b110;
#10 we = 0;din = 32'b10; rd = 5'b10; rs1 = 5'b11; rs2 = 5'b1;rs1_data = 32'b111 ; rs2_data = 32'b1000;  
#10 we = 0;din = 32'b11; rd = 5'b10; rs1 = 5'b0; rs2 = 5'b1;rs1_data = 32'b11 ; rs2_data = 32'b10;
#10 we = 1;din = 32'b10; rd = 5'b10; rs1 = 5'b10; rs2 = 5'b1;rs1_data = 32'b100 ; rs2_data = 32'b110;    
end

endmodule
