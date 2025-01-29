module hex7seg(open, alarm, neww, leds);
   input open, alarm, neww;
   output reg[0:6]leds;

   always @*
	begin
		if(open) leds = 7'b0000001;
		else if(neww) leds = 7'b1101010;
		else if(alarm) leds = 7'b0001000;
		else leds = 7'b1111110;
	end

endmodule