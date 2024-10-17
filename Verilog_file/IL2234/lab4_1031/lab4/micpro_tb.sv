//-------------- Copyright (c) notice -----------------------------------------
//
// The SV code, the logic and concepts described in this file constitute
// the intellectual property of the authors listed below, who are affiliated
// to KTH (Kungliga Tekniska Högskolan), School of EECS, Kista.
// Any unauthorised use, copy or distribution is strictly prohibited.
// Any authorised use, copy or distribution should carry this copyright notice
// unaltered.
//-----------------------------------------------------------------------------
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
//                                                                         #
//This file is part of IL1332 and IL2234 course.                           #
//                                                                         #
//    The source code is distributed freely: you can                       #
//    redistribute it and/or modify it under the terms of the GNU          #
//    General Public License as published by the Free Software Foundation, #
//    either version 3 of the License, or (at your option) any             #
//    later version.                                                       #
//                                                                         #
//    It is distributed in the hope that it will be useful,                #
//    but WITHOUT ANY WARRANTY; without even the implied warranty of       #
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        #
//    GNU General Public License for more details.                         #
//                                                                         #
//    See <https://www.gnu.org/licenses/>.                                 #
//                                                                         #
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
module micpro_tb ();
  logic clk        = 0;
  logic rst_n      = 0;
  logic overflowPC    ;

  parameter N               = 8;
  parameter ROM_addressBits = 6;
  parameter RF_addressBits  = 3;

  microprocessor_n_memory #(N,ROM_addressBits,RF_addressBits) DUT (clk,rst_n,overflowPC);

  always #5ns clk = ~clk;

  initial begin
    //reset to zero RF etc
    rst_n = 0;
    #10ns;
    rst_n = 1;
  end
  always @(posedge clk) begin
    if (overflowPC) begin
      assert (DUT.SRAM.SRAM_memory[0]==2) $display("Data in SRAM 0 location are correct");
      else   $error("Data in the SRAM 0 location are wrong");
      assert (DUT.SRAM.SRAM_memory[1]==3) $display("Data in SRAM 0 location are correct");
      else   $error("Data in the SRAM 1 location are wrong");
      assert (DUT.SRAM.SRAM_memory[2]==4) $display("Data in SRAM 0 location are correct");
      else   $error("Data in the SRAM 2 location are wrong");
      assert (DUT.SRAM.SRAM_memory[3]==5) $display("Data in SRAM 0 location are correct");
      else   $error("Data in the SRAM 3 location are wrong");
      assert (DUT.SRAM.SRAM_memory[4]==6) $display("Data in SRAM 0 location are correct");
      else   $error("Data in the SRAM 4 location are wrong");
      assert (DUT.SRAM.SRAM_memory[5]==7) $display("Data in SRAM 0 location are correct");
      else   $error("Data in the SRAM 5 location are wrong");
      $finish;
    end
  end


  //my filling
  microprocessor #(N, ROM_addressBits, RF_addressBits) microprocessor (.*);
  //parameter N = 8, ROM_addressBits = 6, RF_addressBits = 3
  //check reset states correct
  always @(!rst_n) begin
    if(rf.RF.regRF[0]==0 && rf.RF.regRF[1]==8'b11111111)
    $display("RF reset states are correct");
    if(alu.ALU.reg_ONZ==0 && alu.ALU.reg_Result==0)
    $display("ALU reset output&flag are correct");
    if(fsm.FSM.state==2'b11) //idle
    $display("FSM reset state correct");    
  end

  //generate random instructions
  class inst_a;  //only read inst 0-1-2-3 item to load immediate
    rand logic [RF_addressBits-1:0] inst_load_immediate;
    constraint inst_load {inst_load_immediate inside {0,1,2,3};}//3'b000-011
  endclass //inst_a
  class inst_b;
  rand logic [RF_addressBits-1:0] inst_test;
  endclass //inst_b

  inst_a inst_aa = new();
  inst_b inst_bb = new();
  always @(fsm.en_read_instr==1) begin
    //repeat(4) begin
      //end
    if (rf.regRF[1]!=0 && rf.regRF[2]!=0 && rf.regRF[3]!=0 && rf.regRF[4]!=0)begin//R2-3-4-5 loaded inmmediate
      if (inst_bb.randomize() == 1)begin
        ROM.ROM_address = inst_bb.inst_test;
        $display("Randomization ROM_address= %d", ROM.ROM_address);
      end else  $display("Randomization inst_test failed!");
    end else 
      if (inst_aa.randomize() == 1) begin
      ROM.ROM_address = inst_aa.inst_load_immediate;
      $display("Randomization ROM_address= %d", ROM.ROM_address);
    end else  $display("Randomization inst_load_immediate failed!");
  end
   //generate random data to load rf when requested
  class inst_b;
  rand logic [RF_addressBits-1:0] inst_test;
  endclass //inst_b

  inst_b inst_bb = new();
  always @(fsm.en_read_instr==1) begin
    //repeat(4) begin
      //end
    if (rf.regRF[1]!=0 && rf.regRF[2]!=0 && rf.regRF[3]!=0 && rf.regRF[4]!=0)begin//R2-3-4-5 loaded inmmediate
      if (inst_bb.randomize() == 1)begin
        ROM.ROM_address = inst_bb.inst_test;
        $display("Randomization ROM_address= %d", ROM.ROM_address);
      end else  $display("Randomization inst_test failed!");
    end else 
      if (inst_aa.randomize() == 1) begin
      ROM.ROM_address = inst_aa.inst_load_immediate;
      $display("Randomization ROM_address= %d", ROM.ROM_address);
    end else  $display("Randomization inst_load_immediate failed!");
  end

// assertions to check the timing of the control signals// copy from FSM.tb file
always @(posedge clk) begin
    if (fsm.state == fsm.fetch) begin
      assert (en_read_instr == 1'b1) else $error("en_read_instr incorrect!");
    end  
    if (fsm.state == fsm.decode) begin
      case (instruction_in[4+2*M-1:2*M])
      (BRN||BRN_O||BRN_N||BRN_Z) : begin
        assert (s_rst) 
        else $error("s_rst incorrect!");
      end
      (ADD || SUB || AND || OR || XOR || INC || MOV) :begin
        assert (!select_destination_A && !select_destination_B && enable) 
        else $error("enable incorrect!");
      end
      LOAD_IM : begin
        assert (write_en && (select_source == 2'b10)) 
        else $error("write_en incorrect!");
      end
      LOAD : begin
        assert (SRAM_readEnable ) 
        else $error("SRAM_readEnable incorrect!");
          assert (select_destination_A == 1)
        else $error("select_destination_A == 1 incorrect!");
      end
      STORE : begin
        assert (SRAM_writeEnable && (select_destination_B == 1) && (select_destination_A == 1)) 
        else $error("SRAM_writeEnable incorrect!");
      end
      default: $display("correct!");
      endcase    
    end   
    if (fsm.state == fsm.execute) begin
      case (instruction_reg[4+2*M-1:2*M])
      (ADD || SUB || AND || OR || XOR || INC || MOV) :begin
        assert (write_en && (select_source == 2'b00)&&(!enable)) 
        else $error("aluop write_en incorrect!");
      end
      LOAD : begin
        assert (write_en && (select_source == 2'b01)) 
        else $error("load write_en incorrect!");
      end
      default: $display("correct!");
      endcase    
    end   
  end

// scoreboard  need to work on it
   int correct_count = 0;
   int incorrect_count = 0;
   logic [N-1:0]expected_out, reg_out;// use the same thing in ALU_up

    always @(posedge clk)//
    if (fsm.state == fsm.execute) begin
      case (instruction_reg[4+2*M-1:2*M])
      (ADD || SUB || AND || OR || XOR || INC || MOV) :begin
      expected_out= ALU.reg_Result;
      end
      endcase
    end 

    always @(posedge clk) //
    if (fsm.state == fsm.fetch) begin
      reg_out = rf.A;
      assert ((reg_out== expected_out))
      correct_count = correct_count + 1;
        else begin 
          incorrect_count = incorrect_count +1;
          // $error("reg_out error");
          $display("error ratio = %f ", incorrect_count/(correct_count+incorrect_count));
        end
      end


//covergroup
covergroup cg @(poseedge clk);
tp_inst: coverpoint fsm.instruction_reg;
ALU_inst:coverpoint fsm.inst_reg_Code {
  bins ALUinst={0000,0001,0010,0011,0100,0101,0110,0111};
 }
branch_inst: coverpoint fsm.inst_reg_Code {
  bins branchinst={1011,1100,1101,1110};
  ignore_bins ingnor_branchinst={0000,0001,0010,0011,0100,0101,0110,0111,1000,1001,1010};
 }
offset_inst:coverpoint fsm.offset;

branch_offset: cross branch_inst,offset_inst;

endgroup


endmodule