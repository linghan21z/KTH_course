`include "state_pkg.sv"

module serial_add (
  input  logic clk, rst_n, a, b, st,
  output logic sum, done
);
import state_pkg::*;
state_ty state;
state_ty next ;

logic [1:0] cnt     ;
logic [1:0] cnt_next;
always_ff @( posedge clk, negedge rst_n ) begin
  if (!rst_n) begin
    state <= idle;
  end else begin
    state <= next;
  end
end
always_ff @( posedge clk, negedge rst_n ) begin
  if (!rst_n) begin
    cnt <= 0;
  end else begin
    cnt <= cnt_next;
  end
end
always_comb begin
  case (state)
    idle : begin
      if (!st) next = idle;
      else begin
        if(a&b) next = c1;
        else next = c0;
      end
    end
    c0 : begin
      if (cnt==3) next= idle;
      else begin
        if(a&b) next = c1;
        else next = c0;
      end
    end
    c1 : begin
      if (cnt==3) next= idle;
      else begin
        if((!a)&(!b)) next = c0;
        else next = c1;
      end
    end
    default : next = idle;
  endcase
end
always_comb begin
  case (state)
    idle : begin
      done     = 1'b0;
      cnt_next = 0;
      if (a^b) sum = 1'b1;
      else sum = 0;
    end
    c0 : begin
      cnt_next = cnt + 1;
      if(cnt==2'b11)begin
        sum  = 1'b0;
        done = 1'b1;
      end
      else begin
        if (a^b) sum = 1'b1;
        else sum = 0;
      end
    end
    c1 : begin
      cnt_next = cnt + 1;
      if(cnt==2'b11)begin
        sum  = 1'b1;
        done = 1'b1;
      end
      else begin
        if (!(a^b)) sum = 1'b1;
        else sum = 0;
      end
    end
    default : begin
      sum      = 1'b0;
      done     = 1'b0;
      cnt_next = 0;
    end
  endcase

end
endmodule