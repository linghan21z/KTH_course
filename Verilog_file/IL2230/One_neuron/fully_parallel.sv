//QM is integer, QN is fraction
module fully_parallel #(parameter N = 2, parameter QM = 3, parameter QN = 5, parameter WM = 6, parameter WN = 10) (
    input logic clk, rst_n,
    input logic signed [QM + QN - 1:0] in [N-1:0],
    input logic signed [WM + WN - 1:0] weights [N-1:0],
    input logic signed [QM + QN - 1:0] bias,
    output logic [QM + QN - 1:0] out
);

logic [QM + QN + WM + WN + N - 1:0] mac_out [N-1:0];
logic no_overflow, no_underflow;
logic signed [QM + QN - 1:0] mac_final;
logic [QM + QN - 1:0] out_not_registered;
logic signed [QM + QN + WM +WN + N - 1:0] bias_feedback;

assign bias_feedback = $signed({bias}) << WN;

//Fully parallel loop
genvar i;
generate
    //last iteration handles the bias
    for (i = 0; i < N; i++) begin
        if (i == 0) MAC #(N, QM, QN, WM, WN) mac (in[i], weights[i], bias_feedback, mac_out[i]);
        else MAC #(N, QM, QN, WM, WN) mac (in[i], weights[i], mac_out[i-1], mac_out[i]);
    end
endgenerate

always_comb begin
    no_overflow = ~|mac_out[N-1][QM + QN + WM + WN + N - 1 : QM + QN + WN - 1];   
    no_underflow = &mac_out[N-1][QM + QN + WM + WN + N - 1 : QM + QN + WN - 1];
    if (no_overflow | no_underflow) begin
        mac_final = $signed(mac_out[N-1][QM + QN + WN - 1 : WN]);
    end else begin
      if (mac_out[N-1][QM + QN + WM + WN + N - 1])
        mac_final = -(2**(QM + QN - 1));
      else
        mac_final = 2**(QM + QN - 1) - 1;
    end
end

//Activation function
ReLU #(N, QM, QN) my_func (mac_final, out_not_registered);

//Register the output
assign out = out_not_registered;

endmodule
