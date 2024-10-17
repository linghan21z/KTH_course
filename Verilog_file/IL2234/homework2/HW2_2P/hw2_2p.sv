//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 2）+1 = 2
//      1.2 Question 2
module pipe_NP #(parameter N, P) (
    input  [N-1:0] a, b,
    input        clk, rst_n,
    output [N-1:0] sum,
    output       cout
  );
    logic [N-1:0] ina, inb, ina_2, inb_2;
    logic [2*N-P:0] next_1, stage_1;
    logic [N-1:0] next_2, stage_2;
    logic [P:0] carry_l1;
    logic [N-P:0] carry_l2;
  
    always_ff @(posedge clk, negedge rst_n) begin
      if (!rst_n) begin  //rst_n = 0, ready to Clear at any time
        ina     <= 'b0;
        inb     <= 'b0;
        ina_2   <= 'b0;
        inb_2   <= 'b0;
        stage_1 <= 'b0;
        stage_2 <= 'b0;
      end else begin
        ina     <= a;
        inb     <= b;
        ina_2   <= ina;
        inb_2   <= inb;
        stage_1 <= next_1;
        stage_2 <= next_2;
      end
    end
  
    //layer 1
    assign carry_l1[0] = 1'b0;  
    genvar i;
    generate
      for (i = 0; i<P ;i=i+1 ) begin
        if (i==P-1) begin
          full_adder fa(ina[i],inb[i],carry_l1[i],next_1[i+1],next_1[i]);   //fa:a,b,cin,cout,s
        end else begin
          full_adder fa(ina[i],inb[i],carry_l1[i],carry_l1[i+1],next_1[i]);
        end
      end
    endgenerate

    //assign a[N-1:P] b[N-1:P] to next[2N-P:P+1]
    //initial begin
      always_comb begin
      int m;
      m = 0;
      for ( int i = P ; i<N ;i=i+1 ) begin
          next_1[i+2+m] = ina[i];  //next_1[p+1] = inb[p] 
          next_1[i+1+m] = inb[i];  //next_1[p+2] = ina[p]
          m = m+1;         
        end           
      end    
  
    //layer 2
    assign next_2[P-1:0]  = stage_1[P-1:0];
    assign carry_l2[0] = stage_1[P];
    generate
      for (i = 0; i<N-P ;i=i+1 ) begin
        //if (i==N-P-1) begin
          //full_adder fa(stage_1[2*N-P],stage_1[2*N-P-1],carry_l2[N-P-1],carry_l2[N-P],next_2[N-1]);
          //full_adder fa(stage_1[i+N+1],stage_1[i+N],carry_l2[i],carry_l2[i+1],next_2[i+P]);
        
         //i = 0,1,2
          full_adder fa(ina_2[i+P],inb_2[i+P],carry_l2[i],carry_l2[i+1],next_2[i+P]);
      end
    endgenerate

    //assign sum = next_2;
    assign sum = stage_2;
    assign cout = carry_l2[N-P];
    
  endmodule


  //testbench
  module pipe_NP_tb ();
// Constant values
parameter int N  = 5 ;
parameter int P  = 3 ;
  // Define signals for the testbench
  logic [N-1:0] a, b;
  logic         clk, rst_n;
  logic [N-1:0] sum;
  logic         cout;

  // Instantiate the adder
  pipe_NP #(5,3) DUT (a, b, clk, rst_n, sum, cout);

  // Initialize test vectors in an initial block
  initial
    begin
      //a = 5'b11110;
      //b = 5'b01101;
      rst_n = 1;
      clk = 1'b0;
      forever begin
        #5;
        clk  = ~clk;
      end
      // rst_n can be "force" in simulation
    end

    initial begin
      for (int i = 0; i<10 ; i = i+1) 
      begin
        a = $random;
          for(int j = 0; j<6; j=j+1)
          begin
              b = $random;
          end
          #10;  
      end
  end

    //always begin
    //#5;
    //clk=~clk;
    //end

endmodule