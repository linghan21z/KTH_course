module FourBitRCAdder_par #(parameter N=4) (
  input  logic [N-1:0] A  ,
  input  logic [N-1:0] B  ,
  output logic [  N:0] Sum
);
  logic [  N:0] tempA, tempB, sum_temp;
  logic [N+1:0] carry_temp;
  assign carry_temp[0] = 1'b0;
  assign tempA         = {A[N-1],A};
  assign tempB         = {B[N-1],B};
  genvar i;
  generate
    for (i=0; i<=N; i=i+1)
      begin
        full_adder fa_0(tempA[i],tempB[i],carry_temp[i],carry_temp[i+1],sum_temp[i]);
      end
  endgenerate
  assign Sum = sum_temp;
endmodule
