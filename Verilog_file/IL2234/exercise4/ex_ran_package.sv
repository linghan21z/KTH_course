class ex_ran_package;
  rand logic [2:0] source;
  rand logic [2:0] destination;
  rand logic [3:0] operation;
  rand logic [31:0] data_in;
  logic enable;
  function new();
    enable =1;
  endfunction
  constraint src {source <= 6; source >= 2;};
  constraint dest {destination dist {0 := 25, 1 := 25, 7 := 50};};
  constraint op {
    (source inside {[2:4]}) -> (operation inside {[0:4]});
  }
  constraint order {solve source before operation;}
  function void post_randomize();
    if (destination == 7) begin
      enable = 0;
    end else enable = 1;
  endfunction
  function void pre_randomize();
    enable =1;
  endfunction
endclass//ex_ran_package