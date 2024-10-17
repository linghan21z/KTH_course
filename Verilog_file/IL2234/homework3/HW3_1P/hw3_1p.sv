//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 2）+1 = 2
//      1.2 Question 2
module lock4 (
    input logic clk, rstn, 
    input logic [3:0] key,
    input logic valid_key,
    output logic state
  );
  enum logic [2:0] { unlock = 3'b000,
                  lock = 3'b001,
                  pw1 = 3'b010,
                  pw2 = 3'b011,
                  pw3 = 3'b100,
                  pw4 = 3'b101,
                  changepw = 3'b110 }state0, next;

  logic [2:0] cnt     ;
  logic [2:0] cnt_next;  //cnt=000-100
  logic [3:0] pw [3:0] = {4'h4,4'h3,4'h2,4'h1};
  //logic [3:0] pwnew [3:0];

  always_ff @( posedge clk, negedge rstn ) begin
    if (!rstn) begin
      state0 <= unlock;
    end else begin
      state0 <= next;
    end
  end
  always_ff @( posedge clk, negedge rstn ) begin
    if (!rstn) begin
      cnt <= 0;
    end else begin
      cnt <= cnt_next;
    end
  end

  always_comb begin
    case (state0)
      unlock : begin
        if(valid_key & (key==4'hB)) next = lock; //B
        else begin
          if(valid_key & (key==4'hE)) next = changepw;  //E
          else next = unlock;
          end
      end 
      lock : begin
        if (valid_key & (key==pw[0])) next = pw1;
        else next = lock;          
      end
      pw1 : begin
        if (valid_key)begin
           if (key==pw[1]) next = pw2;
            else next = lock; 
        end else next = pw1;
      end
      pw2 : begin
        if (valid_key)begin
          if (key==pw[2]) next = pw3;
           else next = lock; 
        end else next = pw2;          
      end
      pw3 : begin
        if (valid_key)begin
          if (key==pw[3]) next = pw4;
           else next = lock; 
       end else next = pw3;
      end
      pw4 : begin
        if (valid_key)begin
          if (key==4'hC) next = unlock;
           else next = lock; 
       end else next = pw4;
      end
      changepw : begin
        if (cnt==4) begin           
          next = unlock;
        end else next = changepw;    
      end          
      default: next = unlock; //lock
    endcase    
  end

  always_comb begin
    case (state0)
      unlock : state = 0;  
      lock : state = 1; 
      pw1 : state = 1; 
      pw2 : state = 1; 
      pw3 : state = 1; 
      pw4 : state = 1; 
      changepw : begin
        state = 0;
        if (valid_key)begin
          if (cnt < 3'b100) begin
            pw[cnt] = key;
            cnt_next = cnt + 1; 
          end else cnt_next = 0;
        end                                                        
      end     
      default: begin
        state = 0;
        cnt_next = 0;        
      end //lock
    endcase    
  end
  


endmodule
