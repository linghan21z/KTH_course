module lfsr_6_tb ();
  // Define signals for the testbench
    logic clk, rst_n;
    logic sel;
    logic [5:0] p;
    logic [5:0] out;

    lfsr_6 DUT (clk, rst_n, sel, p, out);

  // Initialize test vectors in an initial block
  initial
    begin
      p = 6'b101011;
      clk=0;
      // sel, rst_n can be "force" in simulation
    end

    always begin
    #5;
    clk=~clk;
    end
    //successful validation!

endmodule