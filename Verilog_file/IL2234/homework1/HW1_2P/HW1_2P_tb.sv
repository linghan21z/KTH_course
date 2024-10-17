//Name: Linghan Zhao
//PN:   20020717-T364，then（364 mod 3）+1 = 2
//      1.2 Question 2

module BCD_adder_tb ();
// This a testbench for a HW1_2P

logic [3:0] a, b;
logic [4:0] sum;
logic carry_out;

BCD_adder DUT (a,b,sum,carry_out);

initial
begin
  for (int i = 0; i < 10 ; i=i+1 )
  begin
    for (int j = 0; j < 10 ; j=j+1 )
    begin
      a = i;
      b = j;
      #5;
    end
  end
end


endmodule