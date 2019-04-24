`timescale 1ns / 1ns
module IE_IM(clk,rst,ie_RegWrite,ie_MemtoReg,ie_MemWrite,ie_Branch,ie_Zero,ie_ALUOut,ie_WriteData,ie_WriteReg,ie_PCBranch,
RegWrite_im,MemtoReg_im,MemWrite_im,Branch_im,Zero_im,ALUOut_im,WriteData_im,WriteReg_im,PCBranch_im);
    input wire clk;
    input wire rst;
    input wire ie_RegWrite;
    input wire ie_MemtoReg;
    input wire ie_MemWrite;
    input wire ie_Branch;
    input wire ie_Zero;
    input wire [31:0] ie_ALUOut;
    input wire [31:0] ie_WriteData;
    input wire [4:0] ie_WriteReg;
    input wire [31:0] ie_PCBranch;
    output reg RegWrite_im;
    output reg MemtoReg_im;
    output reg MemWrite_im;
    output reg Branch_im;
    output reg Zero_im;
    output reg [31:0] ALUOut_im;
    output reg [31:0] WriteData_im;
    output reg [4:0] WriteReg_im;
    output reg [31:0] PCBranch_im;
    
    always@(posedge clk) begin
        if(rst=='b0) begin
            RegWrite_im<=ie_RegWrite;
            MemtoReg_im<=ie_MemtoReg;
            MemWrite_im<=ie_MemWrite;
            Branch_im<=ie_Branch;
            Zero_im<=ie_Zero;
            ALUOut_im<=ie_ALUOut;
            WriteData_im<=ie_WriteData;
            WriteReg_im<=ie_WriteReg;
            PCBranch_im<=ie_PCBranch;
        end else begin
            RegWrite_im<='b0;
            MemtoReg_im<='b0;
            MemWrite_im<='b0;
            Branch_im<='b0;
            Zero_im<='b0;
            ALUOut_im<='h0000_0000;
            WriteData_im<='h0000_0000;
            WriteReg_im<='b00000;
            PCBranch_im<='h0000_3000;
        end
    end
        
endmodule
