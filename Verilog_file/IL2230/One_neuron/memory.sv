module memory #(parameter M = 3, parameter N = 2, parameter QM = 3, parameter QN = 5, parameter WM = 3, parameter WN = 5)( 
    //QM is integer-bit, QN is fraction-bit
  input  logic        clk, nrst,

  //input x,w from tb, initially
  input  logic        initial_flag,
  input  logic signed [QM + QN - 1:0] x [N-1:0], 
  input  logic signed [QM + QN - 1:0] w [M-2:0][N-1:0][N-1:0],  //layer- num_neuron- num_w
  input  logic signed [QM + QN - 1:0] b [M-2:0][N-1:0],  //layer- num_neuron

  //input from mac to reg the result
  input  logic  write_en,
  input  logic signed [QM + QN - 1:0] result, //output from mac

  // output data to neuron mac
  input  logic read_en,
  input  logic [$clog2(M-1)-1 :0] layer_addr,
  input  logic [$clog2(N)-1   :0] neuron_addr,
  output logic signed [QM + QN - 1:0] inputs  [N-1:0],
  output logic signed [WM + WN - 1:0] weights [N-1:0],
  output logic signed [QM + QN - 1:0] bias,  //input bias from tb
  output logic signed [QM + QN - 1:0] outputs [N-1:0]
);

  logic flag;
  logic signed [QM + QN - 1:0] reg_inputs_0 [N-1:0]; 
  logic signed [QM + QN - 1:0] reg_inputs_1 [N-1:0];  //reg the result from every neuron 1 layer
  logic signed [QM + QN - 1:0] reg_weight [M-2:0][N-1:0][N-1:0];  //weights intial 
  logic signed [QM + QN - 1:0] reg_bias   [M-2:0][N-1:0];

  //input x,w from tb, initially
  always_ff @(posedge clk, negedge nrst) begin
    if (!nrst) begin
      flag       <= 0;
      for (int i = 0; i<N; i=i+1 ) begin
        for (int j = 0; j<M-1; j=j+1 ) begin
          reg_bias[j][i] <= 0;
          for (int k = 0; k<N; k=k+1 ) begin
            reg_weight[j][i][k] <= 0;
          end
        end
      end       
    end else if (initial_flag) begin
      reg_weight   <= w;
      reg_bias     <= b;
      flag         <= 0;
	end else begin
      if (neuron_addr == N-1 && layer_addr != M-2) begin
	    flag <= ~flag;
      end
	end
  end 

  //read to neuron from memory, read N once
  always_comb begin
    if (read_en) begin
      bias = reg_bias[layer_addr][neuron_addr];
      for (int i = 0; i<N; i=i+1 ) begin
        inputs[i]  = flag ? reg_inputs_1[i]: reg_inputs_0[i];  //flag is whether finished one layer's calculation?
        weights[i] = reg_weight[layer_addr][neuron_addr][i];
      end
    end else begin
      bias = 0;
    end
	outputs = flag? reg_inputs_0: reg_inputs_1;
  end 

  /*flag mechanism?
  ???flag=0??reg0?inputs?
  ???write_en=1?????result???reg1?????????flag?1?
  ??inputs?reg1????result???reg0????????????flag?0...
  */
  //write to memory from neuron
  always_ff @(posedge clk, negedge nrst) begin
	if(!nrst) begin
      for (int i = 0; i<N; i=i+1 ) begin
        reg_inputs_0[i] <= 0;
        reg_inputs_1[i] <= 0;
	  end
    end else if (initial_flag) begin
      reg_inputs_0 <= x;
	end else begin
      if (write_en) begin 
		if (!flag) begin
		  reg_inputs_1[neuron_addr] <= result;
		end else begin
	      reg_inputs_0[neuron_addr] <= result;
		end
	  end
	end
  end

endmodule
