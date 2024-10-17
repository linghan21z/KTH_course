module saturation (
    input  logic signed [15:0] in ,
    output logic signed [ 7:0] out
  );
  parameter logic signed [15:0] max = 2**(7)-1;
  parameter logic signed [15:0] min = -2**(7) ;
  always_comb
  begin
    if (in < min)
    begin
      out = min;
      $display("1 %d, %d", in, min);
    end
    else if (in > max)
    begin
      out = max;
      $display("2");
    end
    else
    begin
      $display("3");
      out = in[7:0];
    end
  end
endmodule
