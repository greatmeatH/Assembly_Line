`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2019 01:18:33 AM
// Design Name: 
// Module Name: get_PCSrcD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.vh"
module get_PCSrcD(
    input reset,
    
    // control signal
    input ForwardAD,
    input ForwardBD,
    
    // input
    input [`DATALENGTH] RD1,
    input [`DATALENGTH] RD2,
    input [`ADDRLENGTH]ALUOutM,
    input BranchD,
    
    // output
    output reg[`DATALENGTH] RD1_out,
    output reg[`DATALENGTH] RD2_out,
    
    // output control signal
    output reg PCSrcD
    );
    
    wire [`ADDRLENGTH] choose_1;
    wire [`ADDRLENGTH] choose_2;
    wire EqualD;
    assign choose_1 = (ForwardAD == 1'b1)? ALUOutM : RD1;
    assign choose_2 = (ForwardBD == 1'b1)? ALUOutM : RD2;
    assign EqualD = (choose_1 == choose_2)?1'b1 : 1'b0;
    
    always@(*)begin
        if(reset == `RESETABLE)begin
            RD1_out <= `ZEROWORD;
            RD2_out <= `ZEROWORD;
            PCSrcD <= 1'b0;
        end else begin
            RD1_out <= RD1;
            RD2_out <= RD2;
            PCSrcD <= EqualD & BranchD;
        end
    end
endmodule
