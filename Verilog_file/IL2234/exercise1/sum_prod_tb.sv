module sum_prod_tb ();
  logic [3:0] A [7:0];
  logic [9:0] result;

  sum_prod DUT(A, result);

  initial
  begin
    for (int i = 0; i< 10 ; i= i+1 )
    begin
      for (int j = 0; j<8 ; j=j+1)
      begin
        A[j] = $random;
      end
      #5;
    end
  end

endmodule
