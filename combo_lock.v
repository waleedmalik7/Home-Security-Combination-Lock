module combo_lock(Clock, Resetn, b1, b2, x, leds);
  input b1, b2, Clock, Resetn;
  input [3:0] x;
  wire [3:0] code;
  wire enter, change;
  wire match, open, alarm, neww;
  output [0:6] leds;
  
  moore (Clock, b1, Resetn, enter);
  moore (Clock, b2, Resetn, change);
  
  comparison (Clock, Resetn, neww, x, code, match);
  lock (Clock, Resetn, enter, change, match, open, alarm, neww);
  hex7seg (open, alarm, neww, leds);

endmodule