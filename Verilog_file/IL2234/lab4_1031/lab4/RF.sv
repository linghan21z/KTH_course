
//module RF  #(parameter N = 8, parameter addressBits = 2) ( 
  module RF  #(parameter N = 8, parameter addressBits = 3) ( 
    /* --------------------------------- Inputs --------------------------------- */
    input logic clk,
    input logic rst_n,
    input logic selectDestinationA,
    input logic selectDestinationB,
    
    input logic [1:0] selectSource,
    input logic [addressBits-1:0] writeAddress,
    input logic write_en,
    input logic [addressBits-1:0] readAddressA,
    input logic [addressBits-1:0] readAddressB,

    input logic [N-1:0] A, 
    input logic [N-1:0] B, 
    input logic [N-1:0] C, 
    /* --------------------------------- Outputs -------------------------------- */
    output logic [N-1:0] destination1A,
    output logic [N-1:0] destination2A,
    output logic [N-1:0] destination1B,
    output logic [N-1:0] destination2B
);
    // Add your description here
  logic [N-1:0] regRF [2**addressBits-1:0];
  logic [N-1:0] data;

  //genvar i;
  //generate    
    always_ff @(posedge clk, negedge rst_n) begin
      if (!rst_n) begin
        for (int i = 0; i<2**addressBits; i=i+1 ) begin
          //if(i==1) regRF[i] <= 'b1;
          if(i==1) regRF[i] <= {N*{1'b1}};
          else regRF[i] <= 'b0;
        end 
      //end else if (write_en) regRF[writeAddress] <= data; //write
      end else if (write_en) begin
        if ((writeAddress!=0) && (writeAddress!=1))
        regRF[writeAddress] <= data; //write
      end
    end 
  //endgenerate

  always_comb begin  //sourceABC mux
    case (selectSource)  
        (2'b00): data = A;
        (2'b01): data = B;
        (2'b10): data = C;
        default : data = 'b0;
    endcase
  end

  always_comb begin  //readAddressA,
    case (selectDestinationA)  
      (1'b0): begin
        destination1A = regRF[readAddressA];
        destination2A = 'b0;
      end
      (1'b1): begin
        destination1A = 'b0;
        destination2A = regRF[readAddressA];
      end
      default: begin
        destination1A = 'b0;
        destination2A = 'b0;        
      end
    endcase
  end

  always_comb begin  //readAddressB
    case (selectDestinationB)  
      (1'b0): begin
        destination1B = regRF[readAddressB];
        destination2B = 'b0;
      end
      (1'b1): begin
        destination1B = 'b0;
        destination2B = regRF[readAddressB];
      end
      default: begin
        destination1B = 'b0;
        destination2B = 'b0;        
      end
    endcase
  end

  
endmodule