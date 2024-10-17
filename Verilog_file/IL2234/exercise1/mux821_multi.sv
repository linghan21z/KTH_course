//This is a multibit multiplexer 8to1
module mux821_gen #(parameter N=4) (
    input  logic [N-1:0] A [7:0] ,
    input  logic [2:0] ctrl,
    output logic [N-1:0] out
  );

  always_comb
  begin
    case (ctrl)
      3'b000  :
        out = A[0];
      3'b001  :
        out = A[1];
      3'b010  :
        out = A[2];
      3'b011  :
        out = A[3];
      3'b100  :
        out = A[4];
      3'b101  :
        out = A[5];
      3'b110  :
        out = A[6];
      3'b111  :
        out = A[7];
      default :
        out = 0;
    endcase
  end

endmodule
