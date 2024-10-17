//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 7）+1 = 4
//      1.4 Question 4
module lfsr_6 (
  input logic clk, rst_n, 
  input logic sel,
  input logic [5:0] p,
  output logic [5:0] out
);
    
  logic [5:0] state;
  logic [5:0] next;

  always_ff @(posedge clk, negedge rst_n)
    begin
      if(!rst_n) begin
        state <= 6'b0;  //reset_n = 0
      end else begin
        if(!sel) begin  //sel = 0
          state <= p;  //why not next <= p
        end else begin
          state <= next;
        end
      end
    end

  always_comb begin
    for (int i = 0; i<6; i=i+1) begin
      if (i==0) begin
        next[i] = state[5];
      end else begin
        if (i==1) begin
          next[i] = state[i-1] ^ state[5];
        end else if (i==3) begin
          next[i] = state[i-1] ^ state[5];
        end else begin
          next[i] = state[i-1];
        end
      end
    end
  end

  assign out = state;

endmodule