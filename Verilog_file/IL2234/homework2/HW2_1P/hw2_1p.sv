//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 3）+1 = 3
//      1.3 Question 3

module divider (
    input clk, rst_n,
    input logic [2:0] dividend,
    input logic [1:0] divisor,
    output logic [2:0] q,
    output logic [1:0] remainder
  );
  logic [2:0] sub[2:0];
  logic [2:0] sel[1:0];
  logic [2:0] sub_2[2:0];
  logic [2:0] sel_2[1:0];
  logic [2:0] individend, individend_2;
  logic [1:0] indivisor, indivisor_2, indivisor_3;
  logic [2:0] q_3;
  logic [1:0] remainder_3;

  always_ff @( posedge clk, negedge rst_n )
  begin
    if (!rst_n)
    begin  //assign value to register
      sub_2[0]   <= 'b0;
      sub_2[1]   <= 'b0;
      sub_2[2]   <= 'b0;
      sel_2[0]   <= 'b0;
      sel_2[1]   <= 'b0;
      sel_2[2]   <= 'b0;
      individend <= 'b0;
      individend_2 <= 'b0;
      indivisor <= 'b0;
      indivisor_2 <= 'b0;
      indivisor_3 <= 'b0;
    end
    else
    begin
      sub_2[0]   <= sub[0];
      sub_2[1]   <= sub[1];
      sub_2[2]   <= sub[2];
      sel_2[0]   <= sel[0];
      sel_2[1]   <= sel[1];
      sel_2[2]   <= sel[2];
      individend <= dividend;
      individend_2 <= individend;
      indivisor <= divisor;
      indivisor_2 <= indivisor;
      indivisor_3 <= indivisor_2;
    end
  end

  //layer 1
  assign sub[2] = {2'b00,individend[2]}-{1'b0,indivisor};
  assign sel[1] = (sub[2][2])?{1'b0,individend[2:1]}:{sub[2][1:0],individend[1]};

  //layer 2
  assign sub[1] = sel_2[1]-{1'b0,indivisor_2};
  assign sel[0] = (sub_2[1][2])?{sel_2[1][1:0],individend_2[0]}:{sub_2[1][1:0],individend_2[0]};

  //layer 3
  assign sub[0] = sel_2[0]-{1'b0,indivisor_3};

  assign remainder_3 = (sub_2[0][2])?sel_2[0][1:0]:sub_2[0][1:0];
  assign q_3[2] = ~sub_2[2][2];
  assign q_3[1] = ~sub_2[1][2];
  assign q_3[0] = ~sub_2[0][2];

  //output
  assign remainder = remainder_3;
  assign q = q_3;

endmodule


//testbench
module divider_tb ();

  // Define signals for the testbench
  logic clk, rst_n;
  logic [2:0] dividend;
  logic [1:0] divisor;
  logic [2:0] q;
  logic [1:0] remainder;

  // Instantiate the adder
  divider DUT (clk, rst_n, dividend, divisor, q, remainder);

  // Initialize test vectors in an initial block
  initial
  begin
    dividend = 3'b110;
    divisor = 2'b10;
    clk = 0;
    rst_n = 1;
  end

  always
  begin
    #5;
    clk=~clk;
  end

endmodule




