/////////////////////////////////////////////////////////////////////
// Design unit: imem
//            :
// File name  : imem.sv
//            :
// Description: Instruction memory for basic processor
//            : including simple program
//            :
// Limitations: None
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Mark Zwolinski
//            : School of Electronics and Computer Science
//            : University of Southampton
//            : Southampton SO17 1BJ, UK
//            : mz@ecs.soton.ac.uk
//
// Revision   : Version 1.0 12/12/14
//            : Version 1.1 14/01/21 Simplified some of the syntax
//            : Version 2.0 14/03/24 Rewritten to remove tristate bus
//            :   and address register
/////////////////////////////////////////////////////////////////////

module imem #(parameter WORD_W = 8, OP_W = 3)
               (input logic [WORD_W-OP_W-1:0] Iaddress,
                output logic [WORD_W-1:0] Idata);

`include "opcodes.svh"


always_comb
  begin
  Idata = 0;
  case (Iaddress)
  
    0: Idata = {`LOAD, 5'd31};
    1: Idata = {`XORI, 5'b01111};
    2: Idata = {`STORE, 5'd30};
    3: Idata = {`LOAD, 5'd30};
    4: Idata = {`XORI, 5'b01001};
    5: Idata = {`STORE, 5'd30};
    6: Idata = {`LOAD, 5'd30};
    7: Idata = {`XORI, 5'b11001};
    8: Idata = {`STORE, 5'd30};
    9: Idata = {`LOAD, 5'd30};
    10: Idata = {`XORI, 5'b10100};
    11: Idata = {`STORE, 5'd30};
    12: Idata = {`LOAD, 5'd30};
    13: Idata = {`XORI, 5'b01101};
    14: Idata = {`STORE, 5'd30};
    15: Idata = {`LOAD, 5'd30};
    16: Idata = {`XORI, 5'b01110};
    17: Idata = {`STORE, 5'd30};
    18: Idata = {`LOAD, 5'd30};
    19: Idata = {`XORI, 5'b10110};
    20: Idata = {`STORE, 5'd30};
    21: Idata = {`LOAD, 5'd30};
    22: Idata = {`XORI, 5'b10011};
    23: Idata = {`STORE, 5'd30};
    24: Idata = {`BME, 5'd0}
    
    default: Idata = 0;         //rest of ROM is 0
  endcase
  end

endmodule
