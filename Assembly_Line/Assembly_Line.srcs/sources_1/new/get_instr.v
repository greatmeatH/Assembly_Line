`timescale 1ns / 1ps
// get instrcment from instr memary
`include "defines.vh"

module get_instr(
    input wire clock,      
    input wire reset, 
    
  //  input 
    input wire[`PCSIZE] instr_addr,       
    
    output reg[`INSTRSIZE] InstrI   // instrcment
    
    );
    
    reg[`INSTRLENGTH]  instr_mem[0:`INSTR_MEM_NUM-1];
    initial $readmemh ("/home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.data/code.txt",instr_mem);
    
    always @ (*) begin
        if (reset == 1'b1) begin
            InstrI <= `ZEROWORD;
        end else begin
            InstrI <= instr_mem[instr_addr[17:2]];    // because pc + 4, the lowest two bits are 00
        end
    end
    
endmodule
