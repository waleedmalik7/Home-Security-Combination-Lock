module comparison(Clock, Resetn, neww, x, code, match);
  input [3:0] x;
  input neww, Clock, Resetn;
  output [3:0] code;
  reg [3:0] Code=4'b0110;
  output match;

  always@(posedge Clock, negedge Resetn)
  begin
    if(Resetn==0)
		Code=4'b0110;
    else
		if(neww) Code=x;
  end

  assign code=Code;
  assign match=(x==code);

endmodule