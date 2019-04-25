`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2019 02:58:50 AM
// Design Name: 
// Module Name: decode_exe
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

module decode_exe(
    input clock,
    input reset,
    
    // control signal
    input RegWriteD,
    input MemtoRegD,
    input MemWriteD,
    input [`ALUCONTROL_SIZE]ALUControlD,
    input ALUSrcD,
    input RegDstD,
    
    input FlushE,           // for conflict , to be done
    // input
    input [`DATALENGTH]RD1D,
    input [`DATALENGTH]RD2D,
    input [`R_SIZE]RsD,
    input [`R_SIZE]RtD,
    input [`R_SIZE]RdD,
    
    input [`DATALENGTH]SignImmD,
    
    // output
    output reg RegWriteE,
    output reg MemtoRegE,
    output reg MemWriteE,
    output reg[`ALUCONTROL_SIZE] ALUControlE,
    output reg ALUSrcE,
    output reg RegDstE,
    
    output reg [`DATALENGTH]RD1E,
    output reg [`DATALENGTH]RD2E,
    output reg [`R_SIZE]RsE,
    output reg [`R_SIZE]RtE,
    output reg [`R_SIZE]RdE,
    
    output reg [`DATALENGTH]SignImmE
    );
    
    always@(posedge clock)begin
        if(reset == `RESETABLE)begin
            RegWriteE <= 1'b0;
            MemtoRegE <= 1'b0;
            MemWriteE <= 1'b0;
            ALUSrcE <= 1'b0;
            RegDstE <= 1'b0;
            ALUControlE <= 3'b000;
            RD1E <= `ZEROWORD;
            RD2E <= `ZEROWORD;
            SignImmE <= `ZEROWORD;
            RsE <= 5'b00000;
            RtE <= 5'b00000;
            RdE <= 5'b00000;
        end
        else begin
            RegWriteE <= RegWriteD;
            MemtoRegE <= MemtoRegD;
            MemWriteE <= MemWriteD;
            ALUSrcE <= ALUSrcD;
            RegDstE <= RegDstD;
            ALUControlE <= ALUControlD;
            RD1E <= RD1D;
            RD2E <= RD2D;
            SignImmE <= SignImmD;
            RsE <= RsD;
            RtE <= RtD;
            RdE <= RdD; 
        end
    end
endmodule
