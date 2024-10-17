module detect51_fsm_tb ();
  logic clk ;
  logic rst_n ;
  logic inputin ;
  logic detected ;


  detect51_fsm dut (.*);

  initial begin
    clk = 1'b1;
    forever begin
      #1;
      clk = ~clk;
    end
  end

  initial begin
    rst_n = 1;
    inputin = 1'b0;
    #2;
    inputin = 1'b1;
    #30;
    inputin = 1'b0;
    
  end

endmodule