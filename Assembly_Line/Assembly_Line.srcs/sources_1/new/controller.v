`timescale 1ns / 1ps


module controller(clk,rst,op,funct,RegWrite,MemtoReg,MemWrite,ALUControl,ALUSrc,RegDst,Branch);
input [5:0] op;
input [5:0] funct;
input clk;
input rst;
output reg RegWrite;
output reg MemtoReg;
output reg MemWrite;
output reg [2:0] ALUControl;
output reg ALUSrc;
output reg RegDst;
output reg Branch;

reg add;
reg ori;
reg lw;
reg sw;
//wire j;
reg beq;

    always @ (*) begin
            add<=(op==6'b000000)?'b1:'b0;
            ori<=(op==6'b001101)?'b1:'b0;
            lw<=(op==6'b100011)?'b1:'b0;
            sw<=(op==6'b101011)?'b1:'b0;
            //j=(op==6'b000010)?'b1:'b0;
            beq<=(op==6'b000100)?'b1:'b0;
    end
    
    always @(*) begin
            RegWrite<=add|lw|ori;//add, ori, lw
            MemtoReg<=lw;//lw
            MemWrite<=sw;//sw
            ALUControl<=(ori=='b1)?2'b01:2'b00;//'b01 for ori, 'b00 for others
            ALUSrc<=ori;//'b1 for ori, 'b0 for others
            RegDst<=add;//'b1 for add, 'b0 for ori|lw|others
            Branch=beq;//beq
    end
    
endmodule
