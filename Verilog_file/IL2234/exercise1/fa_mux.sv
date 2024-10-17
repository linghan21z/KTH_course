// This is a mux based full adder

module FA_mux (
    input  logic a, b, cin,
    output logic sum, cout
  );

  parameter logic [7:0] lut_sum  = 8'b10010110;
  parameter logic [7:0] lut_cout = 8'b11101000;

  mux821 mux_sum ({a,b,cin},lut_sum,sum);
  mux821 mux_cout ({a,b,cin},lut_cout,cout);

endmodule
