module d_flop #(parameter N = 4) (
  input  logic clk, rst_n,
  input  logic [N-1 : 0] d,
  output logic [N-1 : 0] q
);

  always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
      q <= 0;  //rst_n = 0, reset valid so reset to 0
    end else begin
      q <= d;  //rst_n = 1
    end
  end
  
endmodule