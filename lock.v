module lock (Clock, Resetn, enter, change, match, open, alarm, neww);
	input Clock, Resetn, enter, change, match;
	output open, alarm, neww;
	reg[2:0] state, State;
  parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100;
  
  always@(enter, change, state)
  begin
    case(state)
	   A:	begin
				if(enter==0 && change==0) State=A;
				else if((change==1 || enter==1) && match==0) State=B;
				else if((enter==1 && change==0) && match==1) State=C;
				else if((enter==0 && change==1) && match==1) State=E;
			end
	   B:	begin
				if(enter==0 && change==0) State=B;
				else if((change==1 || enter==1) && match==0) State=D;
				else if((enter==1 && change==0) && match==1) State=C;
				else if((enter==0 && change==1) && match==1) State=E;
			end
      C: if(enter==0) State=C;
			else State=A;
		D: State=D;
		E: if(enter==0 && change==0) State=E;
			else 
			State=A;
    endcase
  end
  
  always@(posedge Clock, negedge Resetn)
  begin
    if(Resetn==0)
	   state=A;
    else
	   state=State;
  end
  
  assign open=(state==C);
  assign alarm=(state==D);
  assign neww=(state==E);

endmodule