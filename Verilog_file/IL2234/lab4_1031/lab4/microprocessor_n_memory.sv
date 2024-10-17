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
module microprocessor_n_memory #(
  parameter N               = 8,
  parameter ROM_addressBits = 6,
  parameter RF_addressBits  = 3
) (
  input  logic clk, rst_n,
  output logic overflowPC
);

  logic [3+2*(RF_addressBits):0] ROM_data      ;
  logic                          ROM_readEnable;
  logic [   ROM_addressBits-1:0] ROM_address   ;


// Connect your modules here


  ROM #(ROM_addressBits,RF_addressBits) ROM (
    .clk           (clk           ),
    .ROM_readEnable(ROM_readEnable),
    .ROM_address   (ROM_address   ),
    .ROM_data      (ROM_data      )
  );


logic                           SRAM_readEnable ;
logic                           SRAM_writeEnable;
logic [(2**RF_addressBits)-1:0] SRAM_address    ;
logic [                  N-1:0] SRAM_data_in;
logic [                  N-1:0] SRAM_data ; 


  SRAM #(8, ROM_addressBits, RF_addressBits) SRAM (
    .clk           (clk           ),
    .SRAM_readEnable(SRAM_readEnable),
    .SRAM_writeEnable(SRAM_writeEnable),
    .SRAM_address(SRAM_address),
    .SRAM_data_in(SRAM_data_in),
    .SRAM_data(SRAM_data)
  );

  microprocessor #() microprocessor(
    .clk(clk),
    .rst_n(rst_n),
    .ROM_data(ROM_data),
    .SRAM_data(SRAM_data),
  /* --------------------------------- Outputs -------------------------------- */
    .overflowPC (overflowPC),
    .ROM_readEnable (ROM_readEnable),
    .SRAM_readEnable(SRAM_readEnable),
    .SRAM_writeEnable(SRAM_writeEnable),
    .ROM_address(ROM_address),
    .SRAM_address(SRAM_address),
    .SRAM_data_in (SRAM_data_in)
  );


endmodule