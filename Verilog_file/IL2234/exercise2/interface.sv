interface myif #(parameter N=4) (input clk);

  logic [N-1:0] A;
  logic [N-1:0] B;
  logic [  N:0] Sum;

  clocking cb @(posedge clk);
    output  A;
    output  B;
    input   Sum;
  endclocking

  modport  tb (input clk, clocking cb);
  
endinterface //myif