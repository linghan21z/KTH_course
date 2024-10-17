module sh_add_tb ();

  logic       clk  ;
  logic       rst_n;
  logic [3:0] inA  ;
  logic [3:0] inB  ;
  logic [7:0] prod ;
  logic       s    ;

  sh_add_top DUT (.*);

  initial begin
    clk = 1;
    rst_n = 0;
    inA = 0;
    inB = 0;
    s =0;
    #5;
    clk = 0;
    #5;
    rst_n = 1;
    clk = 1;
    #1;
    s =1;
    inA = 3;
    inB = 2;
    #4;
    forever begin
      clk =~clk;
      #5;
    end
  end

endmodule