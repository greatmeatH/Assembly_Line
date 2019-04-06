`timescale 1ns/1ns
module alu(in_data1,in_data2,ALUctr,out_data,beqout);
    input [31:0] in_data1;
    input [31:0] in_data2;
    input [1:0]ALUctr;
    output [31:0] out_data;
    output beqout;

    reg [32:0] tmp_arith;

    assign beqout=(in_data1-in_data2==0)?'b1:'b0;//'b1 for the same,'b0 for not

    assign out_data=(ALUctr==2'b00)?(in_data1+in_data2):(in_data1|in_data2);


endmodule