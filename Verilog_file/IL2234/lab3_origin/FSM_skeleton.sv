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

`include "instructions.sv"


module FSM #(
  parameter M = 4, // size of register address
  parameter N = 4, // size of register data
  parameter P = 6  // PC size and instruction memory address
) (
  input  logic clk,
  input  logic rst_n,
  output logic ov_warning,
  /* ---------------------- signals to/from register file --------------------- */
  output logic [  1:0] select_source,
  output logic [M-1:0] write_address,
  output logic             write_en,
  output logic [M-1:0] read_address_A, read_address_B,
  output logic select_destination_A, select_destination_B,
  output logic [N-1:0] immediate_value,
  /* --------------------------- signals to/from ALU -------------------------- */
  output logic [2:0] OP,
  output logic       s_rst,
  input  logic [2:0] ONZ,
  output logic enable,
  /* --------------------------- signals from instruction memory -------------- */
  input  logic [4+2*M-1:0] instruction_in,
  output logic             en_read_instr,
  output logic [P-1:0] read_address_instr,
  /*---------------------------Signals to the data memory--------------*/
  output logic SRAM_readEnable,
  output logic SRAM_writeEnable
);

enum logic [1:0] { idle = 2'b11, fetch = 2'b00, decode = 2'b01, execute= 2'b10} state, next;
/* ----------------------------- PROGRAM COUNTER ---------------------------- */
logic [  P-1:0] PC     ;
logic [  P-1:0] PC_next;
logic           ov     ;
logic           ov_reg ;
logic [2*M-1:0] offset ;

/*-----------------------------------------------------------------------------*/
// Add signals and logic here
logic [4+2*M-1:0] instruction_reg;
logic [4+2*M-1:0] instruction_next;
logic [3:0] inst_reg_Code;
logic [3:0] RA;
logic [3:0] RB;
logic [2:0] ONZ_next;
logic [2:0] ONZ_reg;


/*-----------------------------------------------------------------------------*/

//State register
always @(posedge clk, negedge rst_n) begin
  if (!rst_n) begin
    state <= idle;
  end else begin
    state <= next;
  end
end

/*-----------------------------------------------------------------------------*/
// Describe your next state and output logic here

// Next state logic
always_comb begin
  ov_warning = 0;
  case (state)
    idle : begin
      if (ov_reg) begin
        next = idle;
        ov_warning = 1;   //PC has overflow
      end else begin
        next = fetch;
        ov_warning = 0;
      end
    end 
    fetch : next = decode;
    decode : next = execute;
    execute : begin
      if (ov) begin
        next = idle;
        ov_warning = 1;  //PC will overflow
      end else begin
        next = fetch;
        ov_warning = 0;
      end
    end 
    default: begin
      next = idle;
      ov_warning = 0;
    end
  endcase
end

// Combinational output logic
always_comb begin
  // control RF
  read_address_A = 0;
  read_address_B = 0;
  select_destination_A = 0;
  select_destination_B = 0;
  write_address = 0;
  write_en = 0;
  select_source = 0;
  immediate_value = 0;
  //control alu
  OP = 0;
  s_rst = 0;
  enable = 0;
  //control signals from instruction memory
  en_read_instr = 0;
  read_address_instr = 0;
  //contrl Signals to the data memory
  SRAM_readEnable = 0;
  SRAM_writeEnable = 0;
  
  inst_reg_Code = 0;
  ONZ_next = 0;
  PC_next = PC; //
  ov = ov_reg;  //

  case (state)
    idle : begin
      // control RF
      read_address_A = 0;
      read_address_B = 0;
      select_destination_A = 0;
      select_destination_B = 0;
      write_address = 0;
      write_en = 0;
      select_source = 0;
      immediate_value = 0;
      //control alu
      OP = 0;
      s_rst = 0;
      enable = 0;
      //control signals from instruction memory
      en_read_instr = 0;
      read_address_instr = 0;
      //contrl Signals to the data memory
      SRAM_readEnable = 0;
      SRAM_writeEnable = 0;
      
      inst_reg_Code = 0;
      RA = 0;
      RB = 0;
      ONZ_next = 0;
      PC_next = PC;
      ov = ov_reg;
    end

    fetch : begin
      en_read_instr = 1'b1;
      read_address_instr = PC;   
    end 
    decode : begin   
      ONZ_next = ONZ;    
      instruction_next = instruction_in;
      inst_reg_Code = instruction_in[4+2*M-1:2*M];
      RA = instruction_in[2*M-1 : M];
      RB = instruction_in[M-1:0];

      case (inst_reg_Code) //instructionCode
        (BRN||BRN_O||BRN_N||BRN_Z) : begin
          s_rst = 1;    
          //offset = instruction_in[2*M-1:0] ;            
        end  
        //alu
        (ADD || SUB || AND || OR || XOR || INC || MOV) : begin
          read_address_A = RA;  //RA-->A in alu
          select_destination_A = 0;
          read_address_B = RB;  //RB-->B in alu
          select_destination_B = 0;
          enable = 1; //enable ONZ reg in alu       
          if (inst_reg_Code == MOV) OP = 3'b111;
          else OP = inst_reg_Code[2:0]; //3'b             
        end
        
        NOP : immediate_value = 0; //do nothing

        LOAD_IM : begin
          //extended = {instruction_in[M-1],{(N-M){1'b0}},instruction_in[M-2:0]};
          //immediate_value = extended; //rb-sign-extended
          immediate_value = $signed(RB); //value of operandB
          select_source = 2'b10; //source C
          write_en = 1;
          write_address = RA; //RA
        end

        LOAD : begin  //RA = mem(RB)
          SRAM_readEnable = 1;
          read_address_A = RB;  //RB //different with Hint
          select_destination_A = 1; //dest_2A--mem(address)
        end

        STORE : begin  //mem(RB) = RA
          SRAM_writeEnable = 1;
          read_address_B = RA; //RA
          select_destination_B = 1; //dest_2B--men(data_in)    
          read_address_A = RB;  //RB  
          select_destination_A = 1; //dest_2A--mem(address)
        end 
        default: begin 
          // control RF
          read_address_A = 0;
          read_address_B = 0;
          select_destination_A = 0;
          select_destination_B = 0;
          write_address = 0;
          write_en = 0;
          select_source = 0;
          immediate_value = 0;
          //control alu
          OP = 0;
          s_rst = 0;
          enable = 0;
          //control signals from instruction memory
          en_read_instr = 0;
          read_address_instr = 0;
          //contrl Signals to the data memory
          SRAM_readEnable = 0;
          SRAM_writeEnable = 0;
          
          inst_reg_Code = 0;
          ONZ_next = 0;
          PC_next = PC; //
          ov = ov_reg;  //
        end
      endcase
    end

    execute : begin       
      inst_reg_Code = instruction_reg[4+2*M-1:2*M];
      RA = instruction_reg[2*M-1 : M];
      RB = instruction_reg[M-1:0]; //instruction_reg
      offset = instruction_reg[2*M-1:0] ;   
      case (inst_reg_Code)
      BRN : begin 
        s_rst = 0;
        if (offset[2*M-1]==1) begin
        {ov,PC_next} = PC - offset[2*M-2:0];
        end  else begin
        {ov,PC_next} = PC + offset[2*M-2:0];
        end
      end
      BRN_O : begin 
        s_rst = 0;
        if(ONZ_reg[2]) begin
          if (offset[2*M-1]==1) begin
          {ov,PC_next} = PC - offset[2*M-2:0];
          end  else begin
          {ov,PC_next} = PC + offset[2*M-2:0];
          end
        end else {ov, PC_next} = PC + 1;
      end
      BRN_N : begin 
        s_rst = 0;
        if(ONZ_reg[1]) begin
          if (offset[2*M-1]==1) begin
          {ov,PC_next} = PC - offset[2*M-2:0];
          end  else begin
          {ov,PC_next} = PC + offset[2*M-2:0];
          end
        end else {ov, PC_next} = PC + 1;
      end
      BRN_Z : begin 
        s_rst = 0;
        if(ONZ_reg[0]) begin
          if (offset[2*M-1]==1) begin
          {ov,PC_next} = PC - offset[2*M-2:0];
          end else begin
          {ov,PC_next} = PC + offset[2*M-2:0];
          end
        end else {ov, PC_next} = PC + 1;
      end

      (ADD || SUB || AND || OR || XOR || INC || MOV) : begin
        select_source = 2'b00; //source A--alu(Y)
        write_address = RA; //RA
        write_en = 1;

        enable = 0; //de-assert alu flag_reg enable
        {ov, PC_next} = PC + 1;
      end 
      NOP : {ov, PC_next} = PC + 1;

      LOAD : begin  //RA = mem(RB)
        select_source = 2'b01; //source B--mem(data_out)
        write_en = 1;
        write_address = RA; //RA        
        {ov, PC_next} = PC + 1;
      end
      STORE : {ov, PC_next} = PC + 1;

      LOAD_IM : {ov, PC_next} = PC + 1;
      default: begin
        //{ov, PC_next} = PC + 1; 
        //control rf
        read_address_A = 0;
        read_address_B = 0;
        select_destination_A = 0;
        select_destination_B = 0;
        write_address = 0;
        write_en = 0;
        select_source = 0;
        immediate_value = 0;
        //control alu
        OP = 0;
        s_rst = 0;
        enable = 0;
        //control signals from instruction memory
        en_read_instr = 0;
        read_address_instr = 0;
        //contrl Signals to the data memory
        SRAM_readEnable = 0;
        SRAM_writeEnable = 0;
        
        PC_next = PC;
        ov = ov_reg;
      end
      endcase    
    end    
    default: begin/*
      // control RF
      read_address_A = 0;
      read_address_B = 0;
      //select_destination_A = 0;
      //select_destination_B = 0;
      write_address = 0;
      write_en = 0;
      select_source = 0;
      immediate_value = 0;
      //control alu
      OP = 0;
      s_rst = 0;
      enable = 0;
      //control signals from instruction memory
      en_read_instr = 0;
      read_address_instr = 0;
      //contrl Signals to the data memory
      //SRAM_readEnable = 0;
      //SRAM_writeEnable = 0;
      
      //inst_reg_Code = 0;
      ONZ_next = 0;
      PC_next = PC;
      ov = ov_reg;
      */
    end
  endcase
end
/*
Example of how to update the PC counter
if (offset[2*M-1]==1) begin
{ov,PC_next} = PC - offset[2*M-2:0];
end  else begin
{ov,PC_next} = PC + offset[2*M-2:0];
end
*/
/*-----------------------------------------------------------------------------*/

// Registered the output of the FSM when required
always_ff @(posedge clk, negedge rst_n) begin
  // fill in here
  if (!rst_n) begin
    instruction_reg <= 0;
    ONZ_reg <= 0;
  end else begin
    instruction_reg <= instruction_next;
    ONZ_reg <= ONZ_next;
  end

end

// PC and overflow
always_ff @(posedge clk, negedge rst_n) begin
  if (!rst_n) begin
    PC     <= 0;
    ov_reg <= 0;
  end else begin
    PC     <= PC_next;
    ov_reg <= ov;
  end
end

endmodule