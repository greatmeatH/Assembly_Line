`timescale 1ns / 1ps


module controller(op,funct,RegWrite,MemtoReg,MemWrite,ALUControl,ALUSrc,RegDst,Branch);
input [5:0] op;
input [5:0] funct;
output RegWrite;
output MemtoReg;
output MemWrite;
output [2:0] ALUControl;
output ALUSrc;
output RegDst;
output Branch;

wire add;
wire ori;
wire lw;
wire sw;
wire j;
wire beq;

assign add=(op==6'b000000)?'b1:'b0;
assign ori=(op==6'b001101)?'b1:'b0;
assign lw=(op==6'b100011)?'b1:'b0;
assign sw=(op==6'b101011)?'b1:'b0;
assign j=(op==6'b000010)?'b1:'b0;
assign beq=(op==6'b000100)?'b1:'b0;


endmodule
