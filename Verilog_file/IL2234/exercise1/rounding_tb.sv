// This is a testbench for rounding
module rounding_tb ();
  logic signed [15:0] in ;
  logic signed [11:0] out;
  rounding_up DUT (in,out);
  initial
  begin
    in = 16'b1001_1001_1100_0000;
    #5;
    in = 16'b1001_1001_1100_0011;
    #5;
    for (int i = 0;i < 10 ; i=i+1)
    begin
      in = $random;
      #5;
    end
    in = 16'b1111_1111_1111_0011;
    #5;
    in = 16'b1111_1001_1111_0011;
    #5;
  end
endmodule
