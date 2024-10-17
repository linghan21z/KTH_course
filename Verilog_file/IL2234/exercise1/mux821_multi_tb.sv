// this is a testbench for a 8to1 mux

module mux_821_mult_tb ();
  logic [2:0] ctrl;
  logic [3:0] A [7:0];
  logic       out ;

  mux821_gen #(4) DUT (A,ctrl,out);

  initial
  begin
    for (int i = 0; i < 10 ; i = i +1 )
    begin
      ctrl = $random;
      for (int j = 0; j<8 ;j=j+1 )
      begin
        A[j] = $random;
      end
      #5ns;
    end
  end
endmodule
