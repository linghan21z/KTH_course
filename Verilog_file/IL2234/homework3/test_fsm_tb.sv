module test_fsm_tb ();
  logic clk  ;
  logic rst_n;
  logic x    ;
  logic y    ;
  logic out  ;

  test_fsm dut (.*);

  initial begin
    clk = 1'b0;
    forever begin
      #5;
      clk = ~clk;
    end
  end

  initial begin
    rst_n = 0;
    x=1'b0;
    y=1'b0;
    #9;
    x = 1'b1;
    #1;
    rst_n = 1'b1;
    #8;
    y= 1'b1;
    x=1'b0;
    #10;
    y=1'b0;
  end

endmodule