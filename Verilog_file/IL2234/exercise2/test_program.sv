//testbench program
`include "interface.sv"
`include "random_pkg.sv"
program test_program #(parameter N=4) (myif.tb myif, input logic rst_n); 
  logic signed [N:0] expected [$];
  logic signed [N:0] temp;
  logic signed [N-1:0] a,b;
  logic signed [N:0] sum [$];
  logic signed [N:0] tempE,tempS;
  random_pkg #(N) pkg = new();
  initial begin
    a = 0;
    b = 0;
    for (int i = 0; i<30 ;i=i+1 ) begin
      temp = a+b;
      expected.push_front(temp);
      myif.cb.A <= a;
      myif.cb.B <= b;
      @(myif.cb);
      pkg.randomize();
      a = pkg.a;
      b = pkg.b;
    end
    $finish;
  end

  initial begin
    @(rst_n);
    if (rst_n) begin
      forever begin
        @(myif.cb);
        sum.push_front(signed'(myif.cb.Sum));
      end
    end
  end

  initial begin
    @(rst_n);
    if (rst_n) begin
      forever begin
        @(myif.cb);
        tempE = expected.pop_back();
        tempS = sum.pop_back();
        assert (tempE==tempS) 
        else   $error("Expected %d Result %d",tempE,tempS);
      end
    end
  end

endprogram