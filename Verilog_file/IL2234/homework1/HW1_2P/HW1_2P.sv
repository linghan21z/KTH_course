//Name: Linghan Zhao
//PN:   20020717-T364，then（364 mod 3）+1 = 2
//      1.2 Question 2

module BCD_adder(
    input logic [3:0] a,
    input logic [3:0] b,
    output logic [4:0] sum,
    output logic carry_out

);

logic [4:0] carry_tempt;
logic [3:0] sum_tempt;
logic [4:0] sum_0;
assign carry_tempt[0] = 1'b0;

genvar i;
generate
  for(i=0; i<4; i=i+1)begin
    full_adder fa_0(a[i], b[i], carry_tempt[i], sum_tempt[i], carry_tempt[i+1]);
  end
endgenerate

assign sum_0 = {carry_tempt[4], sum_tempt[3:0]};

always_comb
  begin
    if(sum_0 > 5'b01001) 
    begin
        carry_out = 1;
        sum = sum_0 +  4'b0110;  //'d6
    end
    else begin
        carry_out = 0;
        sum = sum_0;
    end
  end

endmodule


