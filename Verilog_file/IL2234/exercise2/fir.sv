`include "weight_pkg.sv"

module fir_4 (
  input logic clk, rst_n,
  input logic signed [7:0] in,
  output logic signed [17:0] out
);

  logic signed [7:0] s [3:0];  //4 rows, 8 columns
  
  logic signed [15:0] p0, p1, p2, p3;

  logic signed [16:0] sum0, sum1;

  assign p0 = weight_pkg::weight_0*s[0];
  assign p1 = weight_pkg::weight_1*s[1];
  assign p2 = weight_pkg::weight_2*s[2];
  assign p3 = weight_pkg::weight_3*s[3];

  assign sum0 = p0+p1;
  assign sum1 = p2+p3;

  assign out = sum0 + sum1;
  genvar i;
  generate
    for (i = 0; i<4; i=i+1) begin
      if (i==0) begin
        d_flop #(8) d(clk,rst_n,in,s[i]);
      end else begin
        d_flop #(8) d(clk,rst_n,s[i-1],s[i]);
      end
    end
  endgenerate
endmodule