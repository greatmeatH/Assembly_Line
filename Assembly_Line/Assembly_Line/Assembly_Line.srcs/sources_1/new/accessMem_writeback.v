`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2019 03:53:43 AM
// Design Name: 
// Module Name: accessMem_writeback
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.vh"
module accessMem_writeback(
    input clock,
    input reset,
    
    // control signal
    input RegWriteM,
    input MemtoRegM,
    
    // input 
    input [`DATALENGTH] ReadDataM,
    input [`DATALENGTH] ALUOutM,
    input [`R_SIZE] WriteRegM,
    
    // output
    output reg RegWriteW,
    output reg MemtoRegW,
    
    output reg[`DATALENGTH] ReadDataW,
    output reg[`DATALENGTH] ALUOutW,
    output reg[`R_SIZE] WriteRegW
    );
    
    always@(posedge clock)begin
        if(reset == `RESETABLE)begin
            RegWriteW <= 1'b0;
            MemtoRegW <= 1'b0;
            ReadDataW <= `ZEROWORD;
            ALUOutW <= `ZEROWORD;
            WriteRegW <= 5'b00000;
        end
        else begin
            RegWriteW <= RegWriteM;
            MemtoRegW <= MemtoRegM;
            ReadDataW <= ReadDataM;
            ALUOutW <= ALUOutM;
            WriteRegW <= WriteRegM;
        end
    end
endmodule
