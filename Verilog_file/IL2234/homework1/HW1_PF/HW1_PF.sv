//Name: Zhao Linghan
//PN:   20020717-T364，then（364 mod 8）+1 = 5
//      1.5 Question 5
module count_1(
    input  logic [3:0] a,
    output logic [2:0] out
  );

  always_comb begin 
    case (a)
        4'b0000 : out = 3'b000;
        4'b0001 : out = 3'b001;
        4'b0010 : out = 3'b001;
        4'b0011 : out = 3'b010;

        4'b0100 : out = 3'b001;
        4'b0101 : out = 3'b010;
        4'b0110 : out = 3'b010;
        4'b0111 : out = 3'b011;

        4'b1000 : out = 3'b001;
        4'b1001 : out = 3'b010;
        4'b1010 : out = 3'b010;
        4'b1011 : out = 3'b011;

        4'b1100 : out = 3'b010;
        4'b1101 : out = 3'b011;
        4'b1110 : out = 3'b011;
        4'b1111 : out = 3'b100;       
        default :  out = 3'b000; //maybe do not need 
    endcase
end
endmodule

