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
    output wire [1:0] cc_ForwardAE;
    output wire [1:0] cc_ForwardBE;
    
    assign cc_ForwardAE=((cc_RsE!=0)&&(cc_RsE==cc_WriteRegM)&&(cc_RegWriteM))?'b10:((cc_RsE!=0)&&(cc_RsE==cc_WriteRegW)&&(cc_RegWriteW))?'b01:'b00;
    assign cc_ForwardBE=((cc_RtE!=0)&&(cc_RtE==cc_WriteRegM)&&(cc_RegWriteM))?'b10:((cc_RtE!=0)&&(cc_RtE==cc_WriteRegW)&&(cc_RegWriteW))?'b01:'b00;
       
    
endmodule
