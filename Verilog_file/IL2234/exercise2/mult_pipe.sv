module mult_pipe (
  input  [3:0] a, b,
  input        clk, rst_n,
  output [7:0] prod
);
  logic [3:0] ina, inb, ina_2, inb_2, ina_3, inb_3;
  logic [5:0] next_1, stage_1;
  logic [6:0] next_2, stage_2;
  logic [7:0] next_3, stage_3;
  logic [4:0] carry_l1, carry_l2, carry_l3;

  always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin  //rst_n = 0, ready to Clear at any time
      ina     <= 4'b0;
      inb     <= 4'b0;
      ina_2   <= 4'b0;
      inb_2   <= 4'b0;
      ina_3   <= 4'b0;
      inb_3   <= 4'b0;
      stage_1 <= 6'b0;
      stage_2 <= 7'b0;
      stage_3 <= 8'b0;
    end else begin
      ina     <= a;
      inb     <= b;
      ina_2   <= ina;
      inb_2   <= inb;
      ina_3   <= ina_2;
      inb_3   <= inb_2;
      stage_1 <= next_1;
      stage_2 <= next_2;
      stage_3 <= next_3;
    end
  end

  //layer 1
  assign next_1[0]   = ina[0] & inb[0];
  assign carry_l1[0] = 1'b0;
  genvar i;
  generate
    for (i = 0; i<4 ;i=i+1 ) begin
      if (i==3) begin
        full_adder fa(1'b0,(ina[3]&inb[1]),carry_l1[i],next_1[i+2],next_1[i+1]);   //fa:a,b,cin,cout,s
      end else begin
        full_adder fa((ina[i+1]&inb[0]),(ina[i]&inb[1]),carry_l1[i],carry_l1[i+1],next_1[i+1]);
      end
    end
  endgenerate

  //layer 2
  assign next_2[0]   = stage_1[0];
  assign next_2[1]   = stage_1[1];
  assign carry_l2[0] = 1'b0;
  generate
    for (i = 0; i<4 ;i=i+1 ) begin
      if (i==3) begin
        full_adder fa(stage_1[i+2],(ina_2[i]&inb_2[2]),carry_l2[i],next_2[i+3],next_2[i+2]);
      end else begin  //i = 0,1,2
        full_adder fa(stage_1[i+2],(ina_2[i]&inb_2[2]),carry_l2[i],carry_l2[i+1],next_2[i+2]);
      end
    end
  endgenerate

  //layer 3
  assign next_3[2:0] = stage_2[2:0];
  assign carry_l3[0] = 1'b0;
  generate
    for (i = 0; i<4 ;i=i+1 ) begin
      if (i==3) begin
        full_adder fa(stage_2[i+3],(ina_3[i]&inb_3[3]),carry_l3[i],next_3[i+4],next_3[i+3]);
      end else begin
        full_adder fa(stage_2[i+3],(ina_3[i]&inb_3[3]),carry_l3[i],carry_l3[i+1],next_3[i+3]);
      end
    end
  endgenerate

  assign prod = stage_3;
endmodule