module MLP_tb #(parameter M = 3, parameter N = 2, parameter QM = 3, parameter QN = 5, parameter WM = 3, parameter WN = 5);
 	logic clk;
 	logic nrst;
 	logic init;
 	logic initial_flag;
    logic weight_flag;
    logic signed [QM + QN - 1:0] x [N-1:0]; 
    logic signed [QM + QN - 1:0] w [M-2:0][N-1:0][N-1:0];
    logic signed [QM + QN - 1:0] b [M-2:0][N-1:0];
    logic signed [QM + QN - 1:0] outputs;

    MLP_N_neuron #(.M(M), .N(N), .QM(QM), .QN(QN), .WM(WM), .WN(WN)) DUT_N (.*);
    //MLP_one_neuron #(.M(M), .N(N), .QM(QM), .QN(QN), .WM(WM), .WN(WN)) DUT_ONE (.*);
    //my try
    assign outputs = DUT_N.outputs;

    initial begin
        nrst         = 1'b0;
        init         = 1'b0;
        initial_flag = 1'b0;
        weight_flag  = 1'b0;
        #20;
        nrst         = 1'b1;
        init         = 1'b1;
        initial_flag = 1'b1;
        weight_flag  = 1'b1;
        #10;
        init         = 1'b0;
        initial_flag = 1'b0;
        weight_flag  = 1'b0;
    end

    initial begin
        clk = 1'b0;
        forever begin 
            #5;
            clk = ~clk;
        end
    end

    initial begin
        for (int i = 0; i < N; i++) begin
            x[i] = {{(QM){1'b0}}, {1'b1}, {(QN-1){1'b0}}}; //00010000=0.5
        end
        for (int i = 0; i < M; i++) begin
            for (int j = 0; j < N; j++) begin
                b[i][j] = {{(QM){1'b0}}, {1'b1}, {(QN-1){1'b0}}};
                for (int k = 0; k < N; k++) begin
                    w[i][j][k] = {{(QM){1'b0}}, {1'b1}, {(QN-1){1'b0}}};
                end
            end
        end
    end
endmodule