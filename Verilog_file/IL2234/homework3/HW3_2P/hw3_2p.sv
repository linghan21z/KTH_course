//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 3）+1 = 2+1=3
//      1.3 Question 3
module fsmd_calculator (
    input logic clk, rstn, valid_key,
    input logic [3:0] key,
    output logic [7:0] result,
    output logic done
  );
  enum logic [1:0] { idle = 2'b00,
  waitopera = 2'b01,
  waitnum = 2'b10,
  calculate = 2'b11} state, next;

  logic [1:0] opera;
  logic [3:0] number1;
  logic [3:0] number2;

  always_ff @(posedge clk, negedge rstn) begin
    if (!rstn) begin
      state <= idle;
    end else begin
      state <= next;
    end
  end
  
  always_ff @(negedge valid_key) begin
    case(state)
      idle : number1 <= key;
      waitopera : opera <= key;
      waitnum : number2 <= key;
      calculate : number1 <= key;
    endcase     
  end
  always_comb begin
    case (state)
      idle : next = (valid_key) ? waitopera : idle;
      waitopera : next = (valid_key) ? waitnum : waitopera;
      waitnum : next = (valid_key) ? calculate : waitnum;
      calculate : next = (valid_key) ? waitopera : calculate;
      default : next = idle;
    endcase
  end

  always_comb begin
    case (state)
      idle : begin
        result = 7'b0;
        done = 1'b0;
      end
      waitopera : begin
        result = 7'b0;
        done = 1'b0;     
      end
      waitnum : begin
        result = 7'b0;
        done = 1'b0;         
      end
      calculate : begin
        if(valid_key==0) begin
          done = 1'b1; 
        if(opera==2'b00) result = number1 + number2;
        if(opera==2'b01) result = number1 - number2;
        if(opera==2'b10) result = number1 * number2;
        end else begin 
          result = 0;
          done = 1'b0; 
        end
        end
      default : begin
        result = 7'b0;
        done = 1'b0;
      end      
    endcase
  end
    
endmodule