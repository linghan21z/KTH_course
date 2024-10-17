`timescale 10ns/1ns

module TB();
  // Add your testbench code here
  logic [2:0] OP;  //000 111
  logic signed [7:0] A;
  logic signed [7:0] B;
  logic  [2:0] ONZ;
  logic signed [7:0] Result;

  ALU #(8) DUT (OP, A, B, ONZ, Result);

  initial
  begin
    for (int i = 0; i < 10 ; i = i +1 )
    begin
      A = $random;  //randomized inputs
      B = $random;
      for (int j = 0; j < 8 ;j=j+1 )
      begin
        OP = i;  //check all possible functions 
      end
      #5ns;
    end
  end

  //automatic check 
  logic auto_check;  //1'b
  logic Wrong_sign_tb;
  logic [2:0] OP_tb;  
  logic signed [7:0] A_tb;
  logic signed [7:0] B_tb;
  logic  [2:0] ONZ_tb;
  logic signed [7:0] Result_tb;

  assign OP_tb = OP;
  assign A_tb = A;
  assign B_tb = B;
  always_comb begin 
    case (OP_tb)
        3'b000 : begin
          Result_tb = A_tb + B_tb;  //ADD
          Wrong_sign_tb = (A_tb[7]& B_tb[7]& (~Result_tb[7])) |((~A_tb[7])& (~B_tb[7])& Result_tb[7]);  
        end
        3'b001 : begin
          Result_tb = A_tb - B_tb;  //SUB
          Wrong_sign_tb = ((~A_tb[7])& B_tb[7]& Result_tb[7]) |(A_tb[7]& (~B_tb[7])& (~Result_tb[7]));  
        end
        3'b010 : Result_tb = A_tb & B_tb;  //AND
        3'b011 : Result_tb = A_tb | B_tb;  //OR
        3'b100 : Result_tb = A_tb ^ B_tb;  //XOR
        3'b101 : Result_tb = A_tb + 1'b1;  //INC
        3'b110 : Result_tb = A_tb;  //MOVA
        3'b111 : Result_tb = B_tb;  //MOVB
        default: Result_tb = 0;
    endcase
  end

  assign ONZ_tb[2] = (Wrong_sign_tb ==1) ? 1:0;
  assign ONZ_tb[1] = (Result_tb[7] == 1) ? 1:0;
  assign ONZ_tb[0] = (Result_tb == 0) ? 1:0;

  //assign to the auto_check
  always_comb
  begin
    if((Result == Result_tb)& (ONZ == ONZ_tb)) 
    begin
      auto_check = 1;  //right
      $display("automatic check:working correctly!");
    end
    else begin
      auto_check = 0;  //wrong
      $display("automatic check:wrong!");
    end
  end

endmodule
