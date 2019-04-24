`timescale 1ns / 1ns


module gpr(clk,rs,rt,dst,RegWr,in_data,out_rs,out_rt);

    input clk;
    input [4:0] rs;//the index of rs(1st register)
    input [4:0] rt;//the index of rt(2nd register)
    input [4:0] dst;//the index of register to write
    input RegWr;//write enable
    input [31:0] in_data;//the data to write
    output reg [31:0] out_rs;//the data from rs(1st register)
    output reg [31:0] out_rt;//the data from rt(2nd register)
    
    reg [31:0] gpr [31:0];
    
    always@(*) begin
        out_rs<=gpr[rs];
        out_rt<=gpr[rt];
    end
    //assign dst=(RegDst=='b0)?rt:rd;
    
    always@(*) begin
        if(RegWr=='b1)  begin
            gpr[dst]<=in_data;
        end
    end
        
endmodule
