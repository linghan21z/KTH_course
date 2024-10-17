module lock4_tb ();
  logic clk  ;
  logic rstn;
  logic [3:0] key;
  logic valid_key;
  logic state;


  lock4 dut (.*);

  initial begin
    clk = 1'b1;
    forever begin
      #1;
      clk = ~clk;
    end
  end

  initial begin
    rstn = 1;
    key = 0;
    valid_key = 0;
    #2; //2
    rstn = 0;
    #2; //4
    rstn = 1;
    #2;//6
    valid_key = 1;
    key = 4'hB;
    #2;//8
    valid_key = 0;

    #6;//14
    valid_key = 1;
    key = 4'b0001;
    #2;//16
    valid_key = 0;

    #2;//18
    valid_key = 1;
    key = 4'b0010;
    #2;//20
    valid_key = 0;

    #2;//22
    valid_key = 1;
    key = 4'b0011;
    #2;//24
    valid_key = 0;

    #2;//26
    valid_key = 1;
    key = 4'b0100;
    #2;//28
    valid_key = 0;

    #2;//30
    valid_key = 1;
    key = 4'hC;
    #2;//32
    valid_key = 0;

//start change password
    #2;//34
    valid_key = 1;
    key = 4'hE;
    #2;//36
    valid_key = 0;

    #2;//38
    valid_key = 1;
    key = 4'b0010; //2
    #2;
    valid_key = 0;

    #2;//42
    valid_key = 1;
    key = 4'b0011; //3
    #2;
    valid_key = 0;

    #2;//46
    valid_key = 1;
    key = 4'b0100; //4
    #2;//48
    valid_key = 0;

    #2;//50
    valid_key = 1;
    key = 4'b0101; //5
    #2;//52
    valid_key = 0;

//try the new pw
    #2;//54
    valid_key = 1;
    key = 4'hB;
    #2;
    valid_key = 0;

    #2;//58
    valid_key = 1;
    key = 4'b0010; //2
    #2;
    valid_key = 0;

    #2;//62
    valid_key = 1;
    key = 4'b0011; //3
    #2;
    valid_key = 0;

    #2;//66
    valid_key = 1;
    key = 4'b0100; //4
    #2;
    valid_key = 0;

    #2;//70
    valid_key = 1;
    key = 4'b0101; //5
    #2;
    valid_key = 0;

    #2;//74
    valid_key = 1;
    key = 4'hC;
    #2;
    valid_key = 0;

  end

endmodule