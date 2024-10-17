module mux_821_tb ();
// this is a testbench
logic [2:0] ctrl;
logic [7:0] a;
logic out;
mux821 DUT(ctrl,a,out);

initial begin
    for (int i = 0; i<10 ; i = 1+1) begin
        ctrl = $random;
        a = $random;
        #5ns;  //wait 5 ns?
    end
end
endmodule