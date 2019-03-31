`timescale 1ns/1ns
module pc(clk,rst,npc,pc);
    input clk;
    input rst;
    input [31:0] npc;
    output reg[31:0] pc;
    
    
    always@(posedge clk)
        pc<=npc;
        
    always@(posedge rst)
        pc<='h0000_3000;
    
endmodule