//Name: Linghan Zhao
//PN:   20020717-T364，then（364 mod 5）+1 = 5
//      1.5 Question 5

module sum_prod #(parameter N) (
    input [N-1:0] X [5:0],
    output [2*N+1:0] result
  );

  logic [2*N-1:0]   prod_1, prod_2, prod_3;
  logic [2*N:0]     sum_1;

  always_comb
  begin
    prod_1 = X[0]*X[1]; //2*N -bit, 8
    prod_2 = X[2]*X[3];
    prod_3 = X[4]*X[5];
    sum_1 = prod_1 + prod_2; //2*N+1 -bit, 9
  end

  assign result = sum_1 + prod_3; //2*N+2 -bit, 10

endmodule
