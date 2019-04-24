`timescale 1ns/1ns
module alu(in_data1,in_data2,ALUctr,out_data,beqout);
    input [31:0] in_data1;
    input [31:0] in_data2;
    input [1:0]ALUctr;
    output reg [31:0] out_data;
    output reg beqout;

always @ (*) begin
    beqout<=(in_data1-in_data2==0)?'b1:'b0;//'b1 for the same,'b0 for not
    out_data<=(ALUctr==2'b00)?(in_data1+in_data2):(in_data1|in_data2);
end

endmodule