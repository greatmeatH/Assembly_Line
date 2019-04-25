`timescale 1ns / 1ps
// update PC 
`include "defines.vh"
module sig_extend(
    input wire clock,
    input wire reset,
    
    // input 
    input wire[`IMI_SIZE] im,
    
    // output
    output reg[`DATALENGTH] SignImmD
    );
   
   always @ (*) begin
        if(reset == `RESETABLE)begin
        
        end else if(im[15] == 1'b1) begin
            SignImmD[31:16] <= 4'hffff;
            SignImmD[15:0] <= im;
        end else begin
            SignImmD[31:16] <= 4'h0000;
            SignImmD[15:0] <= im;
        end
   end
   
endmodule