module mux_buf1(B1,SelR1, SelG1, SelB1, red_pix1, green_pix1, blue_pix1);
output reg[7:0] B1;
input SelR1, SelB1, SelG1;
input [7:0] red_pix1, green_pix1, blue_pix1;


always@(SelR1 or SelG1 or SelB1)
begin
	if(SelR1) B1 <= red_pix1;
	else if(SelG1) B1 <= green_pix1;
	else if(SelB1) B1 <= blue_pix1;
end 
endmodule

