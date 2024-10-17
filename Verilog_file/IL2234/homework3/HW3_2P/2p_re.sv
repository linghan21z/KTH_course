//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 3）+1 = 2+1=3
//      1.3 Question 3
module fsmd_re (
    input logic clk, rstn, valid_key,
    input logic [3:0] key,
    output logic [7:0] result,
    output logic done
  );
  enum logic [2:0] { idle = 3'b000,
  waitopera = 3'b001,
  waitnum = 3'b010,
  add = 3'b011,
  sub = 3'b100,
  mul = 3'b101,
  out = 3'b110} state, next;

  logic [1:0] opera;
  logic [4:0] result_temp;
  
  always_ff @(posedge clk, negedge rstn) begin
    if (!rstn) begin
      state <= idle;
      result <= 5'b0;
    end else begin
      state <= next;
      result <= result_temp;
    end
  end
  
  always_comb begin
    case (state)
    idle : next = (valid_key) ? waitopera : idle;
    waitopera : next = (valid_key) ? waitnum : waitopera;
    waitnum : begin if (valid_key) begin
        if (opera==2'b00) begin
            next = add;            
        end else if (opera==2'b01) begin
            next = sub;
        end else next = mul;
    end
    end
    add : next = (valid_key) ? waitopera : out;
    sub : next = (valid_key) ? waitopera : out;
    mul : next = (valid_key) ? waitopera : out;
    out : next = (valid_key) ? waitopera : out;
    default : next = idle;
    endcase
  end
  
  always_comb begin
      //result = 5'b0;
      done = 1'b0;
    case (state)
      idle : begin
        result_temp = key;
        done = 1'b0;
        end
      waitopera : begin
        result_temp = key;
        done = 1'b0;
        end
      waitnum : begin
        result_temp = result_temp;
        opera = key;
        end
        
      add : begin 
        result_temp = result + key;
        done = 1'b1;
      end
      sub : begin
        result_temp = result - key;
        done = 1'b1;
        end
      mul : begin 
        result_temp = result * key;
        done = 1'b1;
        end  
      out : begin
        result_temp = result;
        done = 1'b1;
      end  
      default : begin
        result_temp = 5'b0;
        done = 1'b0;
      end
    endcase
  end
      
  endmodule