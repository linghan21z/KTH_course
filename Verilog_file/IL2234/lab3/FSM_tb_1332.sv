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
//`timescale 1ns/1ps

module FSM_TB ();
  `include "instructions.sv"
  parameter M     = 4; // size of register address
  parameter N     = 4; // size of register data
  parameter P     = 6; // PC size and instruction memory address
  logic     clk      ;
  logic     rst_n    ;
/* ---------------------- signals to/from register file --------------------- */
  logic [  1:0] select_source       ;
  logic [M-1:0] write_address       ;
  logic         write_en            ;
  logic [M-1:0] read_address_A      ;
  logic [M-1:0] read_address_B      ;
  logic         select_destination_A;
  logic         select_destination_B;
  logic [N-1:0] immediate_value     ;
/* --------------------------- signals to/from ALU -------------------------- */
  logic [2:0] OP    ;
  logic       s_rst ;
  logic [2:0] ONZ   ;
  logic       enable;
/* --------------------------- signals from instruction memory -------------- */
  logic [4+2*M-1:0] instruction_in    ;
  logic [4+2*M-1:0] instruction_reg   ;
  logic             en_read_instr     ;
  logic [    P-1:0] read_address_instr;
/*Signals to the data memory*/
  logic SRAM_readEnable ;
  logic SRAM_writeEnable;
  logic ov_warning      ;

  FSM #(M,N,P) DUT (.*);
  //fsm_prog_tb #(M,N,P) TB (.*);

  logic [P-1:0] tb_PC;
  logic         ov   ;

  //my fill
  logic [2*M-1:0] offset_tb ;
  assign instruction_reg = DUT.instruction_reg;
  assign tb_PC = DUT.PC ;
  assign ov = DUT.ov;
  //assign offset_tb = instruction_reg[2*M-1:0];

//my filling
  class inst_rand;
    rand logic [4+2*M-1:0] instruction_in;
    rand logic [2:0] ONZ;
    constraint inst_Code_valid {instruction_in[4+2*M-1:2*M] <= 4'b1110;}
/*
    constraint not_exceedPC {
     (instruction_in[4+2*M-1:2*M]==(BRN||BRN_O||BRN_N||BRN_Z)) -> 
     ((instruction_in[2*M-2:0]) <= tb_PC);}
*/
    constraint not_exceedPC {
     (instruction_in[4+2*M-1:2*M]==(BRN||BRN_O||BRN_N||BRN_Z)) -> 
     (instruction_in[2*M-2:0] inside {8'b10000010,8'b00000010,8'b10000011,8'b00000011});}

  endclass //inst_rand

  inst_rand inst = new();
  always @(en_read_instr==1) begin  //fetch
    if (inst.randomize() == 1) begin
      instruction_in = inst.instruction_in;
      ONZ = inst.ONZ;
      offset_tb = inst.instruction_in[2*M-1:0] ;  
    end else  $display("Randomization failed!");
  end
  
//assert to verify control-sigals
  always @(posedge clk) begin
    if (DUT.state == DUT.fetch) begin
      assert (en_read_instr == 1'b1) else $error("en_read_instr incorrect!");
    end  
    if (DUT.state == DUT.decode) begin
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
    if (DUT.state == DUT.execute) begin
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

  //PC check 
  sequence pc_incre;
  //instruction_reg[4+2*M-1:2*M]<=4'b1010;
  instruction_reg[4+2*M-1:2*M]==
    (ADD||SUB||AND||OR||XOR||INC||MOV||NOP||LOAD||STORE||LOAD_IM);
  endsequence
  sequence pc_BRN_incre;
  (instruction_reg[4+2*M-1:2*M]==(BRN_O||BRN_N||BRN_Z)) && (DUT.ONZ_reg==0);
  endsequence
  sequence pc_BRN_offset;
  (instruction_reg[4+2*M-1:2*M]==BRN|| ((BRN_O||BRN_N||BRN_Z) && DUT.ONZ_reg!=0));
  endsequence

  property PC_check1; //concurrent assertion
    @(posedge clk) pc_incre |=> ({ov,DUT.PC_next == tb_PC+1});
  endproperty
  property PC_check2; 
    @(posedge clk) pc_BRN_incre |=> ({ov,DUT.PC_next == tb_PC+1}) ;
  endproperty
  property PC_check3; 
    @(posedge clk) pc_BRN_offset |=> 
    ({ov,DUT.PC_next} == (offset_tb[2*M-1]==1)? (tb_PC - offset_tb[2*M-2:0]) :(tb_PC + offset_tb[2*M-2:0])) ;
  endproperty
  always @(posedge clk) begin
    if (DUT.state == DUT.execute) begin
      assert property(PC_check1) else $error("PC_check1 Failed");
      assert property(PC_check2) else $error("PC_check2 Failed");
      assert property(PC_check3) else $error("PC_check3 Failed");
    end
  end
  


  always @(posedge clk) begin
    if (DUT.ov || DUT.ov_reg) begin
      assert (ov_warning) else $error("ov_warning Failed");
    end   
  end

//my filling end

  initial begin
    clk = 0;
    rst_n = 0;
    #5;
    clk= 1'b1;
    #5;
    rst_n = 1;
    forever begin
      clk = ~clk;
      #5;
    end
  end

  initial begin
    forever begin
      @(DUT.ov); //Until the triggering happen, 
              //it blocks the following code and when it triggers, 
              //the execution flow goes to the next statement.
      if(DUT.ov==1'b1) $finish; //check for potential overflow
    end
  end

endmodule

/*
program fsm_prog_tb #(
    parameter M = 4, // size of register address
    parameter N = 4, // size of register data
    parameter P = 6  // PC size and instruction memory address
  ) (
    input  logic             clk                 ,
    input  logic             rst_n               ,
    /* ---------------------- signals to/from register file --------------------- 
    input logic [      1:0] select_source       ,
    input logic [    M-1:0] write_address       ,
    input logic             write_en            ,
    input logic [    M-1:0] read_address_A, read_address_B,
    input logic             select_destination_A, select_destination_B,
    input logic [    N-1:0] immediate_value     ,
    /* --------------------------- signals to/from ALU ---------------------------
    input logic [      2:0] OP                  ,
    input logic             s_rst               ,
    output  logic [      2:0] ONZ                 ,
    input logic enable,
    /* --------------------------- signals from instruction memory ---------------
    output  logic [4+2*M-1:0] instruction_in      ,
    input logic             en_read_instr       ,
    input logic [    P-1:0] read_address_instr,
    /*Signals to the data memory-----------
    input logic SRAM_readEnable,
    input logic SRAM_writeEnable);

  `include "instructions.sv"

  //parameter logic [3:0] test_code[13:0] = { ADD,  SUB, AND, OR, XOR, NOT, BRN_Z, BRN_N, BRN_O, BRN, MOV, NOP, LOAD, STORE, LOAD_IM};
  parameter logic [3:0] test_code[14:0] = { ADD,  SUB, AND, OR, XOR, INC, BRN_Z, BRN_N, BRN_O, BRN, MOV, NOP, LOAD, STORE, LOAD_IM};
  
  logic [3:0] ra;
  logic [3:0] rb;

  initial begin
    instruction_in = 0;
    ONZ = 0;
    @(posedge(rst_n));
    for(int i = 0; i < 4; i=i+1) begin
      ONZ=0;
      if (i==3) ONZ = 0; else ONZ[i]=1'b1;
      foreach (test_code[i]) begin
        @(en_read_instr==1);
        @(posedge clk);
        if ((test_code[i]== BRN_Z)||(test_code[i]== BRN_O)||(test_code[i]== BRN_N)||(test_code[i]== BRN)) begin
          randcase //randomly select one of the branches in case(with weights)
          1 : begin  //weights 1:1:1:1
            ra = 4'b1000;
            rb = 4'b0010;
          end

          1 : begin
            ra = 4'b0000;
            rb = 4'b0010;
          end

          1: begin
            ra = 4'b1000;
            rb = 4'b0011;
          end

          1: begin
            ra = 4'b0000;
            rb = 4'b0011;
          end

          endcase
        end else begin
          ra = $random;
          rb = $random;
        end
        instruction_in = {test_code[i], ra, rb};
      end
    end
    forever begin
      @(en_read_instr==1);
      @(posedge clk);
      instruction_in = 0;
    end
  end

endprogram

*/

