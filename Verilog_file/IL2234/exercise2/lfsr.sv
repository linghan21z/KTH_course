module lfsr_5 (
  input  logic       clk, rst_n,
  input  logic       load,
  input  logic [4:0] in  ,
  output logic [4:0] out
);

  logic [4:0] state;
  logic [4:0] next ;

  always_ff @(posedge clk, negedge rst_n)
    begin
      if (!rst_n) begin
        state <= 5'b0;  //reset_n = 0
      end else begin
        if (load) begin  //load = 1
          state <= in;
        end else begin
          state <= next;
        end
      end
    end

  always_comb begin  //assign of next( is D)
    for (int i = 0; i<5 ; i=i+1) begin
      if (i==0) begin
        next[i] = state[4];  //next[0] = state[4];  next is D, state is Q
      end else begin
        if (i==3) begin
          next[i] = state[i-1]^state[4];  // next[3] = state[2]^state[4];
        end else if (i==1) begin
          next[i] = state[i-1]^state[4];  //next[1] = state[0]^state[4];
        end else begin
          next[i] = state[i-1];  //next[2] = state[1]; next[4] = state[3];
        end
      end
    end
  end

  assign out = state;

endmodule