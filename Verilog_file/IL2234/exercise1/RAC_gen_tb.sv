// This a testbench for an 4-bit signed RCA

module adder_gen_tb ();

  logic [3:0] A,B,sum;
  logic carry;
  adder_gen #(4) dut (A,B,sum);
  initial
  begin
    for (int i = 0; i < 16 ; i=i+1 )
    begin
      for (int j = 0; j < 16 ; j=j+1 )
      begin
        A = i;
        B = j;
        #5;
      end
    end
  end

endmodule
