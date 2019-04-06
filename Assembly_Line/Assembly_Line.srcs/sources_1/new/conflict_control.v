`timescale 1ns / 1ns
module conflict_control(clk,rst,cc_RsE,cc_RtE,cc_WriteRegM,cc_WriteRegW,cc_RegWriteM,cc_RegWriteW,cc_ForwardAE,cc_ForwardBE);
    input clk;
    input rst;
    input wire [4:0] cc_RsE;
    input wire [4:0] cc_RtE;
    input wire [4:0] cc_WriteRegM;
    input wire [4:0] cc_WriteRegW;
    input wire cc_RegWriteM;
    input wire cc_RegWriteW;
    output reg [1:0] cc_ForwardAE;
    output reg [1:0] cc_ForwardBE;
    
    always@(posedge clk)
        begin
            
        end
    
endmodule
