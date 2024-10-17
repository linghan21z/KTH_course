//Name: Linghan Zhao 
//PN:   20020717-T364，then（364 mod 3）+1 = 2
//      1.2 Question 2

module full_adder(
    input logic a,
    input logic b,
    input logic cin,
    output logic sum,
    output logic cout

);

assign sum = a ^ b ^ cin;
assign cout = a & b | a & cin | b & cin;

endmodule


