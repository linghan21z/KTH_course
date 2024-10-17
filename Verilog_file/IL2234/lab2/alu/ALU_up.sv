
module ALU  #(parameter N = 8) (
    input logic [2:0] OP,  //000 111
    input logic signed [N-1:0] A, 
    input logic signed [N-1:0] B, 
    /* --------------------------------- Outputs -------------------------------- */
    output logic  [2:0] ONZ,
    output logic signed [N-1:0] Result,
    //update design
    input logic clk, rst_n, sync_reset, enable,
    output logic signed [N-1:0] reg_Result, 
    output logic  [2:0] reg_ONZ
);
  // Add your ALU description here
  logic Wrong_sign;

  always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
      reg_ONZ <= 'b0;
    end else if (sync_reset) begin
      reg_ONZ <= 'b0;
    end else if (enable) begin
      reg_ONZ <= ONZ;
    end 
  end
  always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
      reg_Result <= 'b0;
    end else begin 
      reg_Result <= Result; 
    end
  end

  always_comb begin 
    case (OP)
        3'b000 : begin
          Result = A + B;  //ADD
          Wrong_sign = (A[N-1]& B[N-1]& (~Result[N-1])) |((~A[N-1])& (~B[N-1])& Result[N-1]);  
        end
        3'b001 : begin
          Result = A - B;  //SUB
          Wrong_sign = ((~A[N-1])& B[N-1]& Result[N-1]) |(A[N-1]& (~B[N-1])& (~Result[N-1]));  
        end
        3'b010 : Result = A & B;  //AND
        3'b011 : Result = A | B;  //OR
        3'b100 : Result = A ^ B;  //XOR
        3'b101 : Result = A + 1'b1;  //INC
        3'b110 : Result = A;  //MOVA
        3'b111 : Result = B;  //MOVB
        default: Result = 0;
    endcase
  end

  assign ONZ[2] = (Wrong_sign ==1) ? 1:0;
  assign ONZ[1] = (Result[N-1] == 1) ? 1:0;
  assign ONZ[0] = (Result == 0) ? 1:0;


endmodule