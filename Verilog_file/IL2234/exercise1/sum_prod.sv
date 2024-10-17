// This calculates the sum of products

module sum_prod (
    input logic [3:0] A [7:0],
    output logic [17:0] result
  );

  logic [7:0] prod_1, prod_2, prod_3, prod_4;
  logic [8:0] sum_1, sum_2;

  always_comb
  begin
    prod_1 = A[0]*A[1]; //8-bit
    prod_2 = A[2]*A[3];
    prod_3 = A[4]*A[5];
    prod_4 = A[6]*A[7];
    sum_1 = prod_1+prod_2; //9-bit
    sum_2 = prod_3+prod_4;
  end

  assign result = sum_1 + sum_2; //10-bit ?

endmodule
