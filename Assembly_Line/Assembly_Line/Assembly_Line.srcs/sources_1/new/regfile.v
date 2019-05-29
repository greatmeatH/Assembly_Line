`timescale 1ns / 1ps
// update PC 
`include "defines.vh"
module regfile(
    input wire clock,
    input wire reset,
    // input signal
    input wire RegWriteW,
    
    // input
    input wire[`R_SIZE] A1,
    input wire[`R_SIZE] A2,
    input wire[`R_SIZE] A3,
    input wire[`DATALENGTH] WD3,
   
   // output
    output wire[`DATALENGTH] RD1,
    output wire[`DATALENGTH] RD2
    
    );
    
    // regs
    reg[`R_SIZE] regs[0:`REGNUM-1];
    initial $readmemh ("/home/hejunwen/Assembly_Line/Assembly_Line/Assembly_Line.data/cal_data.txt",regs);
    // write , cost clock 
    always @ (posedge clock) begin
       if(reset == `RESETUNABLE && RegWriteW == `WRITEABLE) begin
            regs[A3] <= WD3;
       end
    end
    
    // read 
    assign RD1 = (reset == `RESETABLE || A1 == 5'b00000)?`ZEROWORD:regs[A1];
    assign RD2 = (reset == `RESETABLE || A2 == 5'b00000)?`ZEROWORD:regs[A2];

    
endmodule
