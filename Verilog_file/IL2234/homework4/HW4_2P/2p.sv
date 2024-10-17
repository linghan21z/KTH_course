//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 2）+1 = 2
//      1.2 Question 2
//latest submit

module hw4_2p();
logic clk = 0;
logic active , ready ;
logic data;

initial begin
    forever begin
      #1;
      clk =~clk;
    end
end
initial begin
    active=1; ready=1;    
    data='b1;
    #6;
    active=0; ready=1;  
    #6;
    active=1; ready=0;  
    data='bz;
    #14;
    active=0;
    #4;
    active=1; ready=1;  
    #6;
    active=0; ready=0;  
    #6;
    ready=1;
    //ready=0;
    //ready=1;   
end
//1 Immediate Assertion  
always @(posedge clk) begin
  if ((active==0)||(ready==0)) begin
    assert (data=='bz) else $error("wrong 1");   
    //assert(((!active)||(!ready))&&(data=='bz)) else $error("wrong 1");
  end
end

//2 Concurrent Assertion  ok
property en_check2;
  @(posedge clk) (((active) && (!ready))[*5] |=> (active==0));
endproperty
assert property(en_check2) else $error("Property for 2 Failed");

//3 Concurrent Assertion  ok
property en_check3;
  //@(posedge clk) ((!ready) until active);
  @(posedge clk) (((!active) && (!ready)) |=> (ready==0));
endproperty
assert property(en_check3) else $error("Property for 3 Failed");

//4 Concurrent Assertion  ok
property en_check4;
  //@(posedge clk) ($fell(active, @(posedge clk)) |=> (ready==0));
  @(posedge clk) ($fell(active, @(negedge active)) |=> (ready==0));
endproperty
assert property(en_check4) else $error("Property for 4 Failed"); 


endmodule