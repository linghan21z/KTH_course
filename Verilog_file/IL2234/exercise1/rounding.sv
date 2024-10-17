module rounding_up (
  input  logic signed [15:0] in ,
  output logic signed [11:0] out
);
  // Assume Q(8.8) and Q(8.4)
  logic unsigned [ 3:0] drop  ;
  logic unsigned [12:0] rnd_up;
  assign rnd_up = unsigned'(in[15:4])+1'b1;
  assign drop   = unsigned'(in[3:0]);
  assign out    = (drop==4'b0000)?in[15:4]:rnd_up[11:0];

endmodule
