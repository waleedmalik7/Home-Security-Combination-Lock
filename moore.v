module moore(Clock, w, Resetn, z);
  input Clock, w, Resetn;
  output z;
  reg[1:0] y, Y;
  parameter A=2'b00, B=2'b01, C=2'b10;
  
  always@(w, y)
  begin
    case(y)
	   A: if(w==1) Y = A;
		   else Y=B;
	   B: if(w==1) Y = A;
		   else Y=C;
      C: if(w==1) Y = A;
		   else Y=C;
    endcase
  end
  
  always@(posedge Clock, negedge Resetn)
  begin
    if(Resetn==0)
	   y<=A;
    else
	   y<=Y;
  end
  
  assign z=(y==B);
  
endmodule