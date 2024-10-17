module sh_add_top (
  input  logic       clk, rst_n, s,
  input  logic [3:0] inA, inB,
  output logic [7:0] prod
);
  logic select    ;
  logic shift_en  ;
  logic load      ;
  logic sync_reset;
  logic b0        ;
  logic z         ;

  FSM_shift_add fsm (clk,rst_n,z,b0,s,select,shift_en,load,sync_reset);

  dp_sh_add dp (clk,rst_n,select,shift_en,load,sync_reset,inA,inB,z,b0,prod);
endmodule