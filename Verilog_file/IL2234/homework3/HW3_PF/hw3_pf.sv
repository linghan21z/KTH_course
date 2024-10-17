//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 4）+1 = 4
//      1.4 Question 4
module detect51_fsm (
    input  logic clk, rst_n, inputin,
    output logic detected
  );

  enum logic [2:0] { s0 = 3'b000,
                     s1 = 3'b001,
                     s2 = 3'b010,
                     s3 = 3'b011,
                     s4 = 3'b100,
                     s5 = 3'b101} state, next;

  always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
      state <= s0;
    end else begin
      state <= next;
    end
  end

  always_comb begin
    case (state)
      s0  : next = (inputin) ? s1 : s0;
      s1  : next = (inputin) ? s2 : s0;
      s2  : next = (inputin) ? s3 : s0;
      s3  : next = (inputin) ? s4 : s0;
      s4  : next = (inputin) ? s5 : s0;
      s5  : next = (inputin) ? s5 : s0;
      default : next = s0;
    endcase
  end

  always_comb begin
    if (state == s5) detected = 1'b1;
    else detected = 1'b0;
  end

endmodule
