`timescale 1ns / 1ps


module controller(op,funct,beqout,RegDst,ExtOp,ALUSrc,ALUctr,RegWr,DMWr,GPRSrc,NPCSel);
input [5:0] op;
input [5:0] funct;
input beqout;//'b1 for same,'b0 for not
output RegDst;//'b0 for rt,'b1 for rd
output ExtOp;//'b0 for zero,'b1 for sign
output ALUSrc;//'b0 for [rt],'b1 for ext(imm)
output ALUctr;//'b0 for add,'b1 for or
output RegWr;//'b0 for  not write,'b1 for write
output DMWr;//'b0 for write, 'b1 for not
output GPRSrc;//'b0 for dm, 'b1 for alu
output [1:0] NPCSel;//'b00 for nothing,'b01 for beq,'b10 for j

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

assign NPCSel=(j=='b1)?'b10:(beq=='b1&&beqout=='b1)?'b01:'b00;
assign RegDst=(add=='b1)?'b1:'b0;
assign ExtOp='b0;
assign ALUSrc=(ori=='b1||lw=='b1||sw=='b1)?'b1:'b0; //assign ALUSrc=(add=='b1)?'b0:'b1'
assign ALUctr=(ori=='b1)?'b1:'b0;
assign RegWr=(add=='b1)?'b1:(ori=='b1)?'b1:(lw=='b1)?'b1:'b0;
assign DMWr=(sw=='b1)?'b0:'b1;
assign GPRSrc=(lw=='b1)?'b0:'b1;

endmodule
