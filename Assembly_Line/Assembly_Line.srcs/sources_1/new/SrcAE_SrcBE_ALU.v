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
    input [`R_SIZE]ShiftsE, //hjw
    
    // input
    input [`DATALENGTH] SrcAE,
    input [`DATALENGTH] SrcBE,
    
    output reg[`DATALENGTH]ALUOutE
    
    );
    
    wire [32:0] tmp;         // for tmp result
    assign tmp = {SrcAE[31],SrcAE} + {SrcBE[31],SrcBE};     // to be done
    
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
                    // zan shi mei you kao lv li wai
                    ALUOutE <= SrcAE + SrcBE;
                end
                
                `ALU_SUB:begin
                    // zan shi mei you kao lv li wai
                    ALUOutE <= SrcAE - SrcBE;
                end
                `ALU_AND:begin  //hjw
                    ALUOutE <= SrcAE & SrcBE;
                end
                `ALU_XOR:begin  //hjw
                    ALUOutE <= SrcAE ^ SrcBE;
                end
                `ALU_NOR:begin  //hjw
                    ALUOutE <= ~(SrcAE | SrcBE);
                end
                `ALU_SLL:begin  //hjw
                    ALUOutE <= SrcBE << ShiftsE;
                end
                `ALU_SRA:begin  //hjw
                    ALUOutE <= ({32{SrcBE[31]}} << (6'd32-{1'b0,ShiftsE})) | SrcBE >> ShiftsE;
                end
                `ALU_SRL:begin  //hjw
                    ALUOutE <= SrcBE >> ShiftsE;
                end
                `ALU_SLT:begin
                    // sig compare
                    if(SrcAE[31] == 1'b1 && SrcBE[31] == 1'b0)begin
                        ALUOutE <= 32'h00000001;
                    end
                    else if(SrcAE[31] == 1'b0 && SrcBE[31] == 1'b1)begin
                        ALUOutE <= `ZEROWORD;
                    end 
                    else if(SrcAE - SrcBE < 0) begin
                        ALUOutE <= 32'h00000001;
                    end else begin
                        ALUOutE <= `ZEROWORD;
                    end
                end
                `ALU_SLEEP:begin    //hjw
                    ALUOutE <= SrcBE;
                end
                default:begin
                    ALUOutE <= `ZEROWORD;
                end
            endcase
        end
    end
endmodule
