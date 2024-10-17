// This is a testbench of saturation
module saturation_tb ();
  logic signed [15:0] in ;
  logic signed [ 7:0] out;
  saturation DUT (in,out);
  initial
  begin
    for (int i = 0; i < 10; i=i+1)
    begin
      in = $random;
      #5;
    end
    in = $signed(5);
    #5;
    in = $signed(-5);
    #5;
  end
endmodule
