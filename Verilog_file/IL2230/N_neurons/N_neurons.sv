module N_neurons
#(parameter M = 3, N = 2, QM = 3, QN = 5, WM = 6, WN = 10)
(
    input  logic clk, nrst, read_en,
    input  logic signed [QM + QN - 1:0] inputs [N-1:0], 
    input  logic signed [WM + WN - 1:0] weights [N-1:0][N-1:0], 
    input  logic signed [QM + QN - 1:0] bias [N-1:0], 
    output logic signed [QM + QN - 1:0] result [N-1:0]
);

    genvar i;

    generate 
        for(i = 0; i < N; i++) begin
            fully_parallel #(.N(N), .QM(QM), .QN(QN), .WM(WM), .WN(WN)) NEURON (
                .in(inputs),
                .weights(weights[i]),
                .bias(bias[i]),
                .out(result[i])
            );
        end
    endgenerate

endmodule