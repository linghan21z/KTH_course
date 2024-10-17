module RF_TB();
// Constant values
parameter N = 8 ;
parameter addressBits = 2;
logic clk;
logic rst_n;
logic selectDestinationA;
logic selectDestinationB;

logic [1:0] selectSource;
logic [addressBits-1:0] writeAddress;
logic write_en;
logic [addressBits-1:0] readAddressA;
logic [addressBits-1:0] readAddressB;

logic [N-1:0] A;
logic [N-1:0] B;
logic [N-1:0] C;
/* --------------------------------- Outputs -------------------------------- */
logic [N-1:0] destination1A;
logic [N-1:0] destination2A;
logic [N-1:0] destination1B;
logic [N-1:0] destination2B;
//keep track of what is stored in RF
logic [N-1:0] expected_outA;
logic [N-1:0] expected_outB;
logic [N-1:0] outA;
logic [N-1:0] outB;

//logic [N-1:0] expected_in;
  // Instantiate
  RF #(8, 2) DUT (.*);

  initial begin
    clk = 1;
    forever begin
      #5;
      clk =~clk;
    end
  end

  initial begin
    rst_n = 0;
    write_en = 0;
    #10;
    rst_n = 1;
    forever begin
      write_en =~write_en;
      #10;
    end
  end

  initial begin
    for (int i = 0; i<1000 ; i = i+1 ) 
    begin
      A = $random;
      B = $random;
      C = $random;  
      for (int j=0; j<3; j=j+1 ) begin
        selectSource = j;
        #10;
      end
    end
  end

  initial
  begin
    for (int i=0; i<1000 ; i=i+1 )
    begin
      writeAddress = $random;  //random address inputs
      readAddressA = $random;
      readAddressB = $random;
      for (int j = 0; j < 2 ;j=j+1 )
      begin
        selectDestinationA = j;
        selectDestinationB = j;
        #10ns;
      end
    end
  end


  // Predictor block generates expected output
  always_comb //@(clk)
    begin
      //#1;
      expected_outA = DUT.RF.regRF[readAddressA];
      expected_outB = DUT.RF.regRF[readAddressB];
      //expected_in = regRF[writeAddress];
    end

  // Monitor block records outputs
    always_comb//@(clk)
    begin
      if(selectDestinationA == 0) outA = destination1A;
      else outA = destination2A;
      if(selectDestinationB == 0) outB = destination1B;
      else outB = destination2B;
    end

  // Scoreboard block compares actual and expected outputs
    int correct_count = 0;
    int incorrect_count = 0;
    always @(posedge clk)//@(expected_outA)
    begin
      assert ((outA == expected_outA) && (outB == expected_outB))
      correct_count = correct_count + 1;
        else begin 
          incorrect_count = incorrect_count +1;
          $error("read error");
        end
    end

    always @( clk)  
    begin
      if (correct_count == 20) begin
        $display("correct amount = %d ", correct_count);
        $display("incorrect amount = %f ", incorrect_count);
      end 
    end


  endmodule