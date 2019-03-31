`timescale 1ns / 1ps


module gpr(clk,rs,rt,rd,dst,RegWr,RegDst,in_data,out_rs,out_rt);

    input clk;
    input [4:0] rs;//the index of rs(1st register)
    input [4:0] rt;//the index of rt(2nd register)
    input [4:0] rd;//the index of rd(3rd register)
    input [4:0] dst;//the index of register to write
    input RegWr;//write enable
    input RegDst;//'b0 for rt,'b1 for rd
    input [31:0] in_data;//the data to write
    output [31:0] out_rs;//the data from rs(1st register)
    output [31:0] out_rt;//the data from rt(2nd register)
    
    reg [31:0] gpr [31:0];
    assign out_rs=(rs==0)?8'h00000000:gpr[rs];
    assign out_rt=(rt==0)?8'h00000000:gpr[rt];
    assign dst=(RegDst=='b0)?rt:rd;
    
    always@(posedge clk)
        if(RegWr==1)
            begin
                gpr[dst]=in_data;
            end
        
endmodule
