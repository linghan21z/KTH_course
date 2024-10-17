module memory_N_neuron #(parameter M = 3, parameter N = 2, parameter QM = 3, parameter QN = 5, parameter WM = 3, parameter WN = 5)( 
  //QM is integer-bit, QN is fraction-bit
  input  logic        clk, nrst,

  //input x,w from tb, initially
  input  logic         initial_flag,
  input  logic signed [QM + QN - 1:0] x [N-1:0], 
  input  logic signed [QM + QN - 1:0] w [M-2:0][N-1:0][N-1:0],  //layer- num_neuron- num_w
  input  logic signed [QM + QN - 1:0] b [M-2:0][N-1:0],  //layer- num_neuron

  //input from mac to reg the result
  input  logic  write_en,
  input  logic signed [QM + QN - 1:0] result [N-1:0], //output from mac

  // output data to neuron mac
  input  logic read_en,
  input  logic [$clog2(M-1)-1 :0] layer_addr,
  //input  logic [$clog2(N)-1   :0] neuron_addr,
  output logic signed [QM + QN - 1:0] inputs  [N-1:0],
  output logic signed [WM + WN - 1:0] weights [N-1:0][N-1:0],
  output logic signed [QM + QN - 1:0] bias    [N-1:0], //input bias from tb
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
        reg_inputs_0[i] <= 0;
        reg_inputs_1[i] <= 0;
        for (int j = 0; j<M-1; j=j+1 ) begin
          reg_bias[j][i] <= 0;
          for (int k = 0; k<N; k=k+1 ) begin
            reg_weight[j][i][k] <= 0;
          end
        end
      end       
    end else if (initial_flag) begin
      reg_inputs_0 <= x;
      reg_weight   <= w;
      reg_bias     <= b;
      flag         <= 0;
    end else begin
	  if(read_en && layer_addr != M-2) begin
		flag <= ~flag;
	  end
	  if (write_en) begin 
  	    if (!flag) begin
  	      reg_inputs_1 <= result;
  	    end else begin
  	      reg_inputs_0 <= result;
  	    end
      end
    end
  end 

  //read to neuron from memory, read N once
  always_comb begin
    if (read_en) begin
      bias = reg_bias[layer_addr];
      weights = reg_weight[layer_addr];  //give the whole layer'weights to N neuron
      for (int i = 0; i<N; i=i+1 ) begin
        inputs[i]  = flag ? reg_inputs_1[i]: reg_inputs_0[i];  //flag is whether finished one layer's calculation
      end
    end
	outputs = flag? reg_inputs_0: reg_inputs_1;
  end 
  /*flag mechanism：
  一开始flag=0，把reg0给inputs；
  然后在write_en=1的时候，把result都存到reg1里面，存完一整层，flag跳1；
  然后inputs接reg1上，然后result全存到reg0里面覆盖掉，存完一整层，flag跳0...
  */
  //write to memory from neuron
  always_ff @(posedge clk, negedge nrst) begin
  end

endmodule
