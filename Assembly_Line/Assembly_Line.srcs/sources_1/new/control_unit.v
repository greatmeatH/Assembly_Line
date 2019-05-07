`timescale 1ns / 1ps
// update PC 
`include "defines.vh"
module control_unit(
    input wire clock,
    input wire reset,
    
    // input
    input wire[`OP_SIZE] opcode_in,
    input wire[`OP_SIZE] funccode_in,
    
    // output . these are all control signal
    output reg [`EXTENDSIGNAL_SIZE] SigExtendSignalD,
    output reg RegWriteD,
    output reg MemtoRegD,
    output reg MemWriteD,
    output reg[`ALUCONTROL_SIZE] ALUControlD,
    output reg ALUSrcD,
    output reg RegDstD,
    output reg BranchD,
    output reg ShiftSrcD  //hjw
    );
    
    // cal ALUControlD

    
    
    always @ (*) begin
        if(reset == 1'b0) begin
            case (opcode_in)
                `OP_ALL_ZERO:begin
                   case (funccode_in)
                        `FUNC_ADD,`FUNC_ADDU:begin
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_ADD;
                            ALUSrcD <= 1'b0;
                            RegDstD <= 1'b1;
                            BranchD <= 1'b0;
                            SigExtendSignalD <= 2'b00;  // whatever
                            ShiftSrcD <= 'b0;   //whatever
                        end
                        `FUNC_SUB,`FUNC_SUBU:begin
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_SUB;
                            ALUSrcD <= 1'b0;
                            RegDstD <= 1'b1;
                            BranchD <= 1'b0;
                            SigExtendSignalD <= 2'b00;  // whatever
                            ShiftSrcD <= 1'b0;
                        end
                        `FUNC_SLT:begin
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_SLT;
                            ALUSrcD <= 1'b0;
                            RegDstD <= 1'b1;
                            BranchD <= 1'b0;
                            SigExtendSignalD <= 2'b00;  // whatever
                            ShiftSrcD <= 1'b0;
                        end
                        `FUNC_AND:begin  //hjw
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_AND;
                            ALUSrcD <= 1'b0;
                            RegDstD <= 1'b1;
                            BranchD <= 1'b0;
                            SigExtendSignalD <= 2'b00;   //whatever
                            ShiftSrcD <= 1'b0;
                        end
                        `FUNC_XOR:begin  //hjw
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_XOR;
                            ALUSrcD <= 1'b0;
                            RegDstD <= 1'b1;
                            BranchD <= 1'b0;
                            SigExtendSignalD <= 2'b00;   //whatever
                            ShiftSrcD <= 1'b0;
                        end
                        `FUNC_NOR:begin  //hjw
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_NOR;
                            ALUSrcD <= 1'b0;
                            RegDstD <= 1'b1;
                            BranchD <= 1'b0;
                            SigExtendSignalD <= 2'b00;   //whateverv
                            ShiftSrcD <= 1'b0;
                        end
                        `FUNC_OR:begin  //hjw
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_OR;
                            ALUSrcD <= 1'b0;
                            RegDstD <= 1'b1;
                            BranchD <= 1'b0;
                            SigExtendSignalD <= 2'b00;   //whatever
                            ShiftSrcD <= 1'b0;
                        end
                        `FUNC_SLL:begin  //hjw
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_SLL;
                            ALUSrcD <= 'b0;
                            RegDstD <= 'b1;
                            BranchD <= 'b0;
                            SigExtendSignalD <= 2'b00;    //whatever
                            ShiftSrcD <= 1'b1;
                        end
                        `FUNC_SLLV:begin  //hjw
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_SLL;
                            ALUSrcD <= 'b0;
                            RegDstD <= 'b1;
                            BranchD <= 'b0;
                            SigExtendSignalD <= 2'b00;    //whatever
                            ShiftSrcD <= 1'b0;
                        end
                        `FUNC_SRA:begin  //hjw
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_SRA;
                            ALUSrcD <= 'b0;
                            RegDstD <= 'b1;
                            BranchD <= 'b0;
                            SigExtendSignalD <= 2'b00;    //whatever
                            ShiftSrcD <= 1'b1;
                        end
                        `FUNC_SRAV:begin  //hjw
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_SRA;
                            ALUSrcD <= 'b0;
                            RegDstD <= 'b1;
                            BranchD <= 'b0;
                            SigExtendSignalD <= 2'b00;    //whatever
                            ShiftSrcD <= 1'b0;
                        end
                        `FUNC_SRL:begin  //hjw
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_SRL;
                            ALUSrcD <= 'b0;
                            RegDstD <= 'b1;
                            BranchD <= 'b0;
                            SigExtendSignalD <= 2'b00;    //whatever
                            ShiftSrcD <= 1'b1;
                        end
                        `FUNC_SRLV:begin  //hjw
                            RegWriteD <= 1'b1;
                            MemtoRegD <= 1'b0;
                            MemWriteD <= 1'b0;
                            ALUControlD <= `ALU_SRL;
                            ALUSrcD <= 'b0;
                            RegDstD <= 'b1;
                            BranchD <= 'b0;
                            SigExtendSignalD <= 2'b00;    //whatever
                            ShiftSrcD <= 1'b0;
                        end
                        default:begin
                            
                        end
                   endcase
                end
                `OP_ADDI,`OP_ADDIU:begin
                    RegWriteD <= 1'b1;
                    MemtoRegD <= 1'b0;
                    MemWriteD <= 1'b0;
                    ALUControlD <= `ALU_ADD;
                    ALUSrcD <= 1'b1;
                    RegDstD <= 1'b0;
                    BranchD <= 1'b0;
                    SigExtendSignalD <= 2'b01;       // 1 extend
                    ShiftSrcD <= 1'b0;
                end

                `OP_ORI:begin
                    RegWriteD <= 1'b1;
                    MemtoRegD <= 1'b0;
                    MemWriteD <= 1'b0;
                    ALUControlD <= `ALU_OR;
                    ALUSrcD <= 1'b1;
                    RegDstD <= 1'b0;
                    BranchD <= 1'b0;
                    SigExtendSignalD <= 2'b00;       // 0 extend
                    ShiftSrcD <= 1'b0;
                end
                `OP_ANDI:begin
                    RegWriteD <= 1'b1;
                    MemtoRegD <= 1'b0;
                    MemWriteD <= 1'b0;
                    ALUControlD <= `ALU_AND;
                    ALUSrcD <= 1'b1;
                    RegDstD <= 1'b0;
                    BranchD <= 1'b0;
                    SigExtendSignalD <= 2'b00;   //0 extend
                    ShiftSrcD <= 1'b0;
                end
                `OP_XORI:begin
                    RegWriteD <= 1'b1;
                    MemtoRegD <= 1'b0;
                    MemWriteD <= 1'b0;
                    ALUControlD <= `ALU_XOR;
                    ALUSrcD <= 1'b1;
                    RegDstD <= 1'b0;
                    BranchD <= 1'b0;
                    SigExtendSignalD <= 2'b00;   //0 extend
                    ShiftSrcD <= 1'b0;
                end
                `OP_LUI:begin
                    RegWriteD <= 1'b1;
                    MemtoRegD <= 1'b0;
                    MemWriteD <= 1'b0;
                    ALUControlD <= `ALU_SLEEP;
                    ALUSrcD <= 1'b1;
                    RegDstD <= 1'b0;
                    BranchD <= 1'b0;
                    SigExtendSignalD <= 2'b10;
                    ShiftSrcD <= 1'b0;
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
           SigExtendSignalD <= 1'b00;
           ShiftSrcD <= 1'b0;
        end

    end
    
endmodule
