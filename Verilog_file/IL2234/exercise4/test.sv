`include "ex_ran_package.sv"
module testcase ();

ex_ran_package pkg = new();

logic clk = 0;

int count = 0;

logic [ 2:0] source     ;
logic [ 2:0] destination;
logic [ 3:0] operation  ;
logic [31:0] data_in    ;
logic        enable     ;

covergroup cg @(posedge clk);
  cp_data: coverpoint data_in;
  cp_destination: coverpoint destination{
    bins legal_bin = {0, 1, 7};
    illegal_bins illegal_bin[] = {[2:6]};
  }
  cp_operation: coverpoint operation;
  cp_source: coverpoint source {
    bins legal_bin[] = {[2:6]};
    illegal_bins illegal_bin[] = {[0:1],7};
  }
  xcp_src_op : cross cp_source, cp_operation{
    bins         legal_comb_1   = (binsof(cp_source) intersect {[2:4]}) && (binsof(cp_operation) intersect {[0:4]}) ;
    bins         legal_comb_2   = (!binsof(cp_source) intersect {[2:4]})                                            ;
    illegal_bins illegal_comb_1 = (binsof(cp_source) intersect {[2:4]}) && (!binsof(cp_operation) intersect {[0:4]});
  }
  xcp_data_op : cross cp_data, cp_operation;
endgroup

cg cg_inst = new();

initial begin
  forever begin
    #5;
    clk =~clk;
  end
end

always @(posedge clk) begin
  if (pkg.randomize()) begin
    source      = pkg.source;
    destination = pkg.destination;
    operation   = pkg.operation;
    data_in     = pkg.data_in;
    enable      = pkg.enable;
    assert ((source <= 6) && (source >= 2)) else $fatal("Source is out of bounds");
    assert ((destination == 1) || (destination == 0) || (destination == 7)) else $error("Destination is out of bounds");
    assert (((((source <= 4) && (source >= 2)) && ((operation <= 4) && (operation >= 0))))|| ((source <= 6) && (source >= 5))) else $error("Operation out of bounds!");
  end else begin
    $display("Randomization failed!");
  end
end

property en_check;
  @(posedge clk) ((destination == 7) && (enable == 0)) |=> $stable(destination) until enable;
endproperty

assert property(en_check) else $error("Property Failed");

always @(posedge clk) begin
  if (count == 100000) begin
    $display("Coverage = %0.2f %%", cg_inst.get_inst_coverage());
    $display("Coverage cp_src = %0.2f %%", cg_inst.cp_source.get_coverage());
    $display("Coverage cp_dest = %0.2f %%", cg_inst.cp_destination.get_coverage());
    $display("Coverage cp_op = %0.2f %%", cg_inst.cp_operation.get_coverage());
    $display("Coverage cp_data = %0.2f %%", cg_inst.cp_data.get_coverage());
    $display("Coverage cross = %0.2f %%", cg_inst.xcp_src_op.get_coverage());
    $display("Coverage cross 2= %0.2f %%", cg_inst.xcp_data_op.get_coverage());
    $finish;
  end else count +=1 ;
end

endmodule