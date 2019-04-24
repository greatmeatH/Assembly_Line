`timescale 1ns / 1ns
module ID_IE(clk,rst,id_RegWrite,id_MemtoReg,id_MemWrite,id_ALUControl,id_ALUSrc,id_RegDst,id_Branch,id_RD1,id_RD2,id_Rs,id_Rt,id_Rd,id_SignImm,id_PCPlus4,
RegWrite_ie,MemtoReg_ie,MemWrite_ie,ALUControl_ie,ALUSrc_ie,RegDst_ie,Branch_ie,RD1_ie,RD2_ie,Rs_ie,Rt_ie,Rd_ie,SignImm_ie,PCPlus4_ie);
input wire clk;
input wire rst;
input wire id_RegWrite;
input wire id_MemtoReg;
input wire id_MemWrite;
input wire[2:0] id_ALUControl;
input wire id_ALUSrc;
input wire id_RegDst;
input wire id_Branch;
input wire [31:0] id_RD1;
input wire [31:0] id_RD2;
input wire [4:0] id_Rs;
input wire [4:0] id_Rt;
input wire [4:0] id_Rd;
input wire [31:0] id_SignImm;
input wire [31:0] id_PCPlus4;
output reg RegWrite_ie;
output reg MemtoReg_ie;
output reg MemWrite_ie;
output reg [2:0] ALUControl_ie;
output reg ALUSrc_ie;
output reg RegDst_ie;
output reg Branch_ie;
output reg [31:0] RD1_ie;
output reg [31:0] RD2_ie;
output reg [4:0] Rs_ie;
output reg [4:0] Rt_ie;
output reg [4:0] Rd_ie;
output reg [31:0] SignImm_ie;
output reg [31:0] PCPlus4_ie;


always@(posedge clk)
    begin
        if(rst=='b0) begin
            RegWrite_ie<=id_RegWrite;
            MemtoReg_ie<=id_MemtoReg;
            MemWrite_ie<=id_MemWrite;
            ALUControl_ie<=id_ALUControl;
            ALUSrc_ie<=id_ALUSrc;
            RegDst_ie<=id_RegDst;
            Branch_ie<=id_Branch;
            RD1_ie<=id_RD1;
            RD2_ie<=id_RD2;
            Rs_ie<=id_Rs;
            Rt_ie<=id_Rt;
            Rd_ie<=id_Rd;
            SignImm_ie<=id_SignImm;
            PCPlus4_ie<=id_PCPlus4;
        end else begin
            RegWrite_ie<='b0;
            MemtoReg_ie<='b0;
            MemWrite_ie<='b0;
            ALUControl_ie<='b0;
            ALUSrc_ie<='b0;
            RegDst_ie<='b0;
            Branch_ie<='b0;
            RD1_ie<='h0000_0000;
            RD2_ie<='h0000_0000;
            Rs_ie<='b00000;
            Rt_ie<='b00000;
            Rd_ie<='b00000;
            SignImm_ie<='h0000_0000;
            PCPlus4_ie<='h0000_0000;
        end
    end

endmodule
