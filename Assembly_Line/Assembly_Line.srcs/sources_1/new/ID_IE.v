`timescale 1ns / 1ps
module ID_IE(clk,rst,id_RegWrite,id_MemtoReg,id_MemWrite,id_ALUControl,id_ALUSrc,id_RegDst,id_Branch,id_RD1,id_RD2,id_Rs,id_Rt,id_Rd,id_SignImm,id_PCPlus4,
ie_RegWrite,ie_MemtoReg,ie_MemWrite,ie_ALUControl,ie_ALUSrc,ie_RegDst,ie_Branch,ie_RD1,ie_RD2,ie_Rs,ie_Rt,ie_Rd,ie_SignImm,ie_PCPlus4);
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
input wire [5:0] id_Rs;
input wire [5:0] id_Rt;
input wire [5:0] id_Rd;
input wire [31:0] id_SignImm;
input wire [31:0] id_PCPlus4;
output reg ie_RegWrite;
output reg ie_MemtoReg;
output reg ie_MemWrite;
output reg [2:0] ie_ALUControl;
output reg ie_ALUSrc;
output reg ie_RegDst;
output reg ie_Branch;
output reg [31:0] ie_RD1;
output reg [31:0] ie_RD2;
output reg [5:0] ie_Rs;
output reg [5:0] ie_Rt;
output reg [5:0] ie_Rd;
output reg [31:0] ie_SignImm;
output reg [31:0] ie_PCPlus4;


endmodule
