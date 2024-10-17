module count_1_tb ();
// this is a testbench for HW1_PF
logic [3:0] a;
logic [2:0] out;

count_1 DUT(a,out);

initial begin
    for (int i = 0; i<10 ; i = i+1) begin
        a = $random;
        #5ns;  //wait 5 ns?
    end
end
endmodule