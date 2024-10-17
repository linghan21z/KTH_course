//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 3）+1 = 3
//      1.3 Question 3

module divider (
    input logic [2:0] dividend,
    input logic [1:0] divisor,
    output logic [2:0] q,
    output logic [1:0] remainder
    );
    logic [2:0] sub[2:0];
    logic [2:0] sel[1:0];
    logic [2:0] sub_2[2:0];
    logic [2:0] sel_2[1:0];
    logic [2:0] sub_3[2:0];
    logic [2:0] sel_3[1:0];
    logic [2:0] individend, individend_2;
    logic [1:0] indivisor, indivisor_2, indivisor_3;
    logic [2:0] q_3;
    logic [1:0] remainder_3;     

    //layer 1
    assign individend = dividend;
    assign indivisor = indivisor;
    assign sub[2] = {2'b00,individend[2]}-{1'b0,indivisor};
    assign sel[1] = (sub[2][2])?{1'b0,individend[2:1]}:{sub[2][1:0],individend[1]};

    //layer 2
    assign individend_2 = individend;
    assign indivisor_2 =indivisor;
    assign sel_2[1] = sel[1];
    assign sub_2[2] = sub[2];

    assign sub_2[1] = sel_2[1]-{1'b0,indivisor_2};
    assign sel_2[0] = (sub_2[1][2])?{sel_2[1][1:0],individend_2[0]}:{sub_2[1][1:0],individend_2[0]};
    
    //layer 3
    assign sel_3[0] = sel_2[0];
    assign sub_3[1] = sub_2[1];
    
    assign indivisor_3 = indivisor_2;
    assign sub_3[0] = sel_3[0]-{1'b0,indivisor_3};
    
    assign remainder_3 = (sub_3[0][2])?sel_3[0][1:0]:sub_3[0][1:0];
    assign q_3[2] = ~sub_3[2][2];
    assign q_3[1] = ~sub_3[1][2];
    assign q_3[0] = ~sub_3[0][2];

    //output
    assign remainder = remainder_3; 
    assign q = q_3;

    endmodule
    



