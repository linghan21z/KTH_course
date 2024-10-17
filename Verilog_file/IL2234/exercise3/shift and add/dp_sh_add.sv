module dp_sh_add (
  input  logic       clk, rst_n, select, shift_en, load, sync_reset,
  input  logic [3:0] inA, inB,
  output logic       z, b0,
  output logic [7:0] prod
);

  logic [7:0] a        ;
  logic [3:0] b        ;
  logic [7:0] nexta    ;
  logic [3:0] nextb    ;
  logic [7:0] prod_reg ;
  logic [7:0] next_prod;
  assign prod = prod_reg;

  always_ff @( posedge clk, negedge rst_n) begin
    if (!rst_n) begin
      a        <= 0;
      b        <= 0;
      prod_reg <= 0;
    end else begin
      if (load) begin
        a <= inA;
        b <= inB;
      end else begin
        a <= nexta;
        b <= nextb;
      end
      if (sync_reset) begin
        prod_reg <= 0;
      end else begin
        prod_reg <= next_prod;
      end
    end
  end
  assign b0 = b[0];
  assign z  = (b==0)? 1'b1:1'b0;
  always_comb begin
    if (shift_en) begin
      nexta = a << 1;
      nextb = b >> 1;
    end else begin
      nexta = a;
      nextb = b;
    end
  end

  always_comb begin
    if (select) begin
      next_prod = prod_reg + a;
    end else begin
      next_prod = prod_reg;
    end
  end

endmodule