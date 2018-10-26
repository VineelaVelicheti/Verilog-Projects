module program_counter(branch,jump,pc_add_imme,addr_in,clock);

input clock,branch,jump;
output reg[31:0] addr_in;
input [31:0] pc_add_imme;


reg[31:0] pc;

initial
begin
pc <= 32'b1;
end

always@(posedge clock)
begin

if(pc == 32'b111) pc = 32'b1; 
if(branch) pc = pc_add_imme;
if(jump) pc = pc_add_imme;

case(pc)
32'b1 : addr_in <=  32'b1;
32'b10 : addr_in  <= 32'b10; // jump
32'b11 : addr_in  <= 32'b11; // store
32'b100 : addr_in  <= 32'b100; //xor
32'b101 : addr_in  <= 32'b101; // and
32'b110 : addr_in  <= 32'b110; //sge
32'b111 : addr_in <= 32'b111;
default : addr_in <= 111111111;
endcase
pc = pc+1;
end
endmodule
