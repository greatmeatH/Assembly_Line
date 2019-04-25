`timescale 1ns / 1ps
// update PC 
`include "defines.vh"
module control_unit(
    input wire clock,
    input wire reset,
    
    // input
    input wire[`OP_SIZE] opcode_in,
    input wire[`R_SIZE] funccode_in,
    
    // output . these are all control signal
    output reg RegWriteD,
    output reg MemtoRegD,
    output reg MemWriteD,
    output reg[`ALUCONTROL_SIZE] ALUControlD,
    output reg ALUSrcD,
    output reg RegDstD,
    output reg BranchD
    );
    
    always @ (*) begin
        if(reset == 1'b0) begin
            case (opcode_in)
                `OP_LW:begin
                   
                end
                `OP_ORI:begin
                   RegWriteD <= 1'b1;
                   ALUControlD <= `ALU_OR;
                   ALUSrcD <= 1'b1;
                end
                `OP_ADD:begin
                    RegWriteD <= 1'b1;
                    ALUControlD <= `ALU_ADD;
                    ALUSrcD <= 1'b0;
                    RegDstD <= 1'b1;
                    BranchD <= 1'b0;
                end
                default: begin
                //    regwriteD <= `WRITEABLE;
                //    alu_controlD <= `ALU_ADD;
                end
            endcase
        end
        else begin
           RegWriteD <= 1'b0;
           MemtoRegD <= 1'b0;
           MemWriteD <= 1'b0;
           ALUSrcD <= 1'b0;
           RegDstD <= 1'b0;
           BranchD <= 1'b0;
           ALUControlD <= 3'b000;
        end

    end
    
endmodule
