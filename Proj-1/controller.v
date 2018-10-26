module controller(weA,incA,weB,incB,clock,reset);
output reg weA, weB, incA, incB;
input clock, reset;
reg[4:0] counter;

parameter zero = 5'b0;
parameter one = 5'b1;
parameter two = 5'b10;
parameter three = 5'b11;
parameter four = 5'b100;
parameter five = 5'b101;
parameter six = 5'b110;
parameter seven = 5'b111;
parameter eight = 5'b1000;
parameter ten = 5'b1010;
parameter eleven = 5'b1011;
parameter twelve = 5'b1100;
parameter thirteen = 5'b1101;
parameter fourteen = 5'b1110;
parameter fifteen = 5'b1111;
parameter sixteen = 5'b10000;
parameter seventeen = 5'b10001;
parameter eighteen = 5'b10010;
parameter nineteen = 5'b10011;
parameter twenty = 5'b10100;

//initializing counter value
initial
begin
counter = 5'b0;
end


always@(posedge clock or posedge reset)
begin

if(reset || (counter == twenty)) counter = 5'b0;
else    counter = counter + 1;

//setting weA high
if((counter == one) || (counter == two) || (counter == three) || (counter == four) || (counter == five) || (counter == six) || (counter == seven) || (counter == eight)) weA = 5'b1;
else weA = 5'b0;

//setting incA high
if((counter == seventeen) || (counter == eighteen) || (counter == nineteen) || (counter == zero)) incA = 5'b0;
else incA = 5'b1;

//setting weB high
if((counter == eleven) || (counter == thirteen) || (counter == fifteen) || (counter == seventeen) ) weB = 5'b1;
else weB = 5'b0;

//setting inB high
if((counter == twelve) || (counter == fourteen) || (counter == sixteen) || (counter == eighteen)) incB = 5'b1;
else incB = 5'b0;

end 
endmodule
