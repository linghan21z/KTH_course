module test_fsm (
  input  logic clk, rst_n, x, y,
  output logic out
);
  enum logic [2:0] { s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b010,
    s3 = 3'b011,
    s4 = 3'b100 } state, next;

  always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
      state <= s0;
    end else begin
      state <= next;
    end
  end

  always_comb begin
    case (state)
      3'b000  : next = (x) ? s1 : s2;
      s1      : next = (y) ? s3 : s4;
      s2      : next = s4;
      s3      : next = s0;
      s4      : next = s0;
      default : next = s0;
    endcase
  end

  always_comb begin
    if (state == s3) out = 1'b1;
    else out = 1'b0;
  end

endmodule