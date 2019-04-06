`timescale 1ns / 1ns
module IM_IW(clk,rst,im_RegWrite,im_MemtoReg,im_ReadData,im_ALUOut,im_WriteReg,
RegWrite_iw,MemtoReg_iw,ReadData_iw,ALUOut_iw,WriteReg_iw);
    input wire clk;
    input wire rst;
    input wire im_RegWrite;
    input wire im_MemtoReg;
    input wire [31:0] im_ReadData;
    input wire [31:0] im_ALUOut;
    input wire [4:0] im_WriteReg;
    output reg RegWrite_iw;
    output reg MemtoReg_iw;
    output reg [31:0] ReadData_iw;
    output reg [31:0] ALUOut_iw;
    output reg [4:0] WriteReg_iw;
    
    always@(posedge clk)
        begin
            RegWrite_iw<=im_RegWrite;
            MemtoReg_iw<=im_MemtoReg;
            ReadData_iw<=im_ReadData;
            ALUOut_iw<=im_ALUOut;
            WriteReg_iw<=im_WriteReg;
        end
    
endmodule
