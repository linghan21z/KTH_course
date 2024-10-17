module fsmd_re_tb ();
  logic clk  ;
  logic rstn;
  logic valid_key;
  logic [3:0] key;
  logic [7:0] result;
  logic done;

  fsmd_re dut (.*);

  initial begin
    clk = 1'b1;
    forever begin
      #1;
      clk = ~clk;
    end
  end

  initial begin
    valid_key = 0;
    key = 0;
    rstn = 0;
    #4;
    rstn = 1;
    #2;
    valid_key = 1;
    key = 4;
    #2;  //8ms
    valid_key = 0;  
    #4;  //12
    valid_key = 1;
    key = 0;
    #2;  //14
    valid_key = 0;
    #4;  //18
    valid_key = 1;
    key = 1;
    #2;  //20
    valid_key = 0;
    #6;  //26
    valid_key = 1;
    key = 3;
    #2;  //28
    valid_key = 0;
    #4;  //32
    valid_key = 1;
    key = 2;
    #2;  //34
    valid_key = 0;
    #4;  //38
    valid_key = 1;
    key = 5;
    #2;  //40
    valid_key = 0;
  end

endmodule