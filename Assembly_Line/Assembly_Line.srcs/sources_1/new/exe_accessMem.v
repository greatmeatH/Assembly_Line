`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2019 03:42:26 AM
// Design Name: 
// Module Name: exe_accessMem
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
module exe_accessMem(
    input clock,
    input reset,
    
    // control signal
    input RegWriteE,
    input MemtoRegE,
    input MemWriteE,
    
    // input
    input [`DATALENGTH]ALUOutE,
    input [`DATALENGTH]WriteDataE,
    input [`R_SIZE] WriteRegE,
    
    // output 
    output reg RegWriteM,
    output reg MemtoRegM,
    output reg MemWriteM,
    
    output reg[`DATALENGTH]ALUOutM,
    output reg[`DATALENGTH]WriteDataM,
    output reg[`R_SIZE] WriteRegM
    );
    
    always @(posedge clock)begin
        if(reset == `RESETABLE)begin
            RegWriteM <= 1'b0;
            MemtoRegM <= 1'b0;
            MemWriteM <= 1'b0;
            ALUOutM <= `ZEROWORD;
            WriteDataM <= `ZEROWORD;
            WriteRegM <= 5'b00000;
        end
        else begin
            RegWriteM <= RegWriteE;
            MemtoRegM <= MemtoRegE;
            MemWriteM <= MemWriteE;
            ALUOutM <= ALUOutE;
            WriteDataM <= WriteDataE;
            WriteRegM <= WriteRegE;
        end
    end
endmodule
