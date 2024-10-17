module tb ();

  // Constant values
  parameter int N    = 4       ;
  parameter int INS  = 2**N    ;
  parameter int OUTS = 2**(2*N);
  // Define signals for the testbench
  logic [N-1:0] A  ;
  logic [N-1:0] B  ;
  logic [  N:0] SUM;

  // Instantiate the adder
  FourBitRCAdder_par #(N) DUT (A,B,SUM);

  // Array to store test vectors
  logic        [N-1:0] test_vectors[INS-1:0];
  logic signed [  N:0] expected_sum         ;
  logic        [  N:0] results              ;

  // Initialize test vectors in an initial block
  initial
    begin
      for (int i = 0; i < INS; i = i + 1)
        begin
          test_vectors[i] = i;
        end
    end

  // Driver block assigns values to inputs
  initial
    begin
      for (int x = 0; x < INS; x = x + 1)
        begin
          for (int j = 0; j < INS; j = j + 1)
            begin
              #5;  // Delay to allow the adder to settle
              A = test_vectors[x];
              B = test_vectors[j];
            end
        end
      $finish;
    end

  // Predictor block generates expected output
  always @(SUM)
    begin
      #1;
      expected_sum = signed'(A) + signed'(B);
    end

  // Monitor block records outputs
  always @(SUM)
    begin
      results = signed'(SUM);
    end

  // Scoreboard block compares actual and expected outputs
  always @(expected_sum)
    begin
      assert (results == expected_sum)
        else $error("Assertion Failed - A=%d, B=%d, SUM=%d, Expected=%d", $signed(A), $signed(B), results, expected_sum);
    end

endmodule