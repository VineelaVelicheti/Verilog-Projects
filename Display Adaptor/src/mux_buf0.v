module mux_buf0(B0,SelR0, SelG0, SelB0, red_pix0, green_pix0, blue_pix0);
output reg[7:0] B0;
input SelR0, SelB0, SelG0;
input [7:0] red_pix0, green_pix0, blue_pix0;


always@(SelR0 or SelG0 or SelB0)
begin
	if(SelR0) B0 <= red_pix0;
	else if(SelG0) B0 <= green_pix0;
	else if(SelB0) B0 <= blue_pix0;
end 
endmodule

