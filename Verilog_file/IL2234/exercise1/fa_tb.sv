// This a testbench for a FA

module fa_tb ();

  logic a,b,cin;
  logic sum,cout;

  FA_mux DUT (a,b,cin,sum,cout);

  initial
  begin
    for (int i = 0; i < 8; i=i+1 )
    begin
      {a,b,cin} = i;
      #5;
    end
  end

endmodule
