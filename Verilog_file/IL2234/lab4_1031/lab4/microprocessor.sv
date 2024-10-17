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
module microprocessor #(parameter N = 8, ROM_addressBits = 6, RF_addressBits = 3) (
  /* --------------------------------- Inputs --------------------------------- */
  input  logic                           clk             ,
  input  logic                           rst_n           ,
  input  logic [ 3+2*(RF_addressBits):0] ROM_data        ,
  input  logic [                  N-1:0] SRAM_data       ,
  /* --------------------------------- Outputs -------------------------------- */
  output logic                           overflowPC      ,
  //Memory
  output logic                           ROM_readEnable  ,
  output logic                           SRAM_readEnable ,
  output logic                           SRAM_writeEnable,
  output logic [    ROM_addressBits-1:0] ROM_address     ,
  output logic [(2**RF_addressBits)-1:0] SRAM_address    ,
  output logic [                  N-1:0] SRAM_data_in
);

//FSM
logic [  1:0] select_source;
logic [RF_addressBits-1:0] write_address;
logic             write_en;
logic [RF_addressBits-1:0] read_address_A, read_address_B;
logic select_destination_A, select_destination_B;
logic [N-1:0] immediate_value;
logic [2:0] OP;
logic       s_rst;
logic [2:0] ONZ;
logic       enable;

  // Connect your components here
  FSM #(RF_addressBits,N,ROM_addressBits) fsm(
    .clk(clk),
    .rst_n(rst_n),
    .ov_warning(overflowPC),
    //RF
    .select_source(select_source),
    .write_address(write_address),
    .write_en(write_en),
    .read_address_A(read_address_A),
    .read_address_B(read_address_B),
    .select_destination_A(select_destination_A),
    .select_destination_B(select_destination_B),
    .immediate_value(immediate_value),
    //ALU
    .OP(OP),
    .s_rst(s_rst),
    .ONZ(ONZ),
    .enable(enable),//1
    //IM
    .instruction_in(ROM_data),
    .en_read_instr(ROM_readEnable),//
    .read_address_instr(ROM_address),
    //DM
    .SRAM_readEnable(SRAM_readEnable),
    .SRAM_writeEnable(SRAM_writeEnable)
  );

logic [N-1:0] A;
logic [N-1:0] destination1A;
logic [N-1:0] destination1B;

  RF #(N,RF_addressBits) rf(
    .clk(clk),
    .rst_n(rst_n),
    //FSM
    .selectDestinationA(select_destination_A), 
    .selectDestinationB(select_destination_B),
    .selectSource(select_source),
    .writeAddress(write_address),
    //
    .write_en(write_en),

    .readAddressA(read_address_A),
    .readAddressB(read_address_B),
    //ALU Y
    .A(A),
    //DM DATA OUT
    .B(SRAM_data),
    //FSM
    .C(immediate_value),
    //ALU
    .destination1A(destination1A),
    //DM adress
    .destination2A(SRAM_address),
    //ALU
    .destination1B(destination1B),
    //DM data in
    .destination2B(SRAM_data_in)
  );

ALU #(N)alu(
  .clk(clk),
  .rst_n(rst_n),
  //FSM
  .OP(OP),
  //RF
  .A(destination1A),
  .B(destination1B),
  //FSM
  .reg_ONZ(ONZ),
  .reg_Result(A),
  .sync_reset(s_rst), 
  .enable(enable)
);

endmodule