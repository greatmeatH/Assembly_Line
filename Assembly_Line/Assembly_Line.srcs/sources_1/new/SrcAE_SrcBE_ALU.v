`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2019 03:33:28 AM
// Design Name: 
// Module Name: SrcAE_SrcBE_ALU
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


module SrcAE_SrcBE_ALU(
    input clock,
    input reset,
    // control signal
    input [`ALUCONTROL_SIZE]ALUControlE,
    
    // input
    input [`DATALENGTH] SrcAE,
    input [`DATALENGTH] SrcBE,
    
    output reg[`DATALENGTH]ALUOutE
    
    );
    
    always@(*)begin
        if(reset == `RESETABLE)begin
            ALUOutE <= `ZEROWORD;
        end 
        else begin
            case(ALUControlE)
                // this place is for ALU calcluate.
                `ALU_OR:begin
                    ALUOutE <= SrcAE | SrcBE;
                end
                `ALU_ADD:begin
                    ALUOutE <= SrcAE + SrcBE;
                end
                default:begin
                    ALUOutE <= `ZEROWORD;
                end
            endcase
        end
    end
endmodule
