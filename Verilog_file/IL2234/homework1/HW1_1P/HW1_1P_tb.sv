//Name: Linghan Zhao
//PN:   20020717-T364，then（364 mod 5）+1 = 5
//      1.5 Question 5

module HW1_1P_tb ();
// this is a testbench for HW1_1P
logic [3:0] X [5:0];
logic [9:0] result;

sum_prod #(4) DUT(X, result);

initial begin
    for (int i = 0; i<10 ; i = i+1) 
    begin
        for(int j = 0; j<6; j=j+1)
        begin
            X[j] = $random;
        end
        #5;  
    end
end
endmodule

