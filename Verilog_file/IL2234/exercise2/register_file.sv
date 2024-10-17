module register_file (
  input  logic       clk, rst_n,
  input  logic [3:0] data     ,
  input  logic [1:0] r_address, w_address,
  output logic [3:0] out
);
  logic [3:0] Q [3:0];
  logic     [3:0]  en;
  
  genvar      i ;
  generate
    for (i = 0; i<4 ;i=i+1 ) begin
      always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) Q[i] <= 4'b0;
        else if (en[i]) Q[i] <= data;  //en is enability-bit, so Q is the register?
      end
    end
  endgenerate

  always_comb begin
    case (r_address)  //read
      (2'b00): out = Q[0];
      (2'b01): out = Q[1];
      (2'b10): out = Q[2];
      (2'b11): out = Q[3];
      default : out = 4'b0;
    endcase
  end

  always_comb begin
    en = 4'b0000;
    case (w_address)  //write
      (2'b00): en[0] = 1'b1;
      (2'b01): en[1] = 1'b1;
      (2'b10): en[2] = 1'b1;
      (2'b11): en[3] = 1'b1;
      default : en = 4'b0000;
    endcase
  end

endmodule