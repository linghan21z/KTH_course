//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 2）+1 = 2
//      1.2 Question 2

module hw4_2p();
logic clk ;
logic active , ready ;
logic data;

//1 Immediate Assertion
always @(posedge clk) begin
  if ((active==0)||(ready==0)) begin
    assert (data=='bz) else $error("wrong 1");   
    //assert(((active==0)||(ready==0))&&(data=='bz)) else $error("wrong 1");
  end
end

//2 Concurrent Assertion
property en_check2;
  @(posedge clk) (((active) && (!ready))[*5] |=> (active==0));
endproperty
assert property(en_check2) else $error("Property for 2 Failed");

//3 Concurrent Assertion
property en_check3;
  @(posedge clk) ((!ready) until active);
endproperty
assert property(en_check3) else $error("Property for 3 Failed");

//4 Concurrent Assertion
property en_check4;
  @(posedge clk) ((!active) ##1 (!ready));
endproperty
assert property(en_check4) else $error("Property for 4 Failed"); 


endmodule