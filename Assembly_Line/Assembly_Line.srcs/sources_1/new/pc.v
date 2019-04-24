`timescale 1ns/1ns
module pc(clk,rst,npc,pc);
    input clk;
    input rst;
    input [31:0] npc;
    output reg[31:0] pc;
    
    
    always@(posedge clk) begin
        if(rst=='b0) begin
            pc<=npc;
        end else begin
            pc<='h0000_3000;
        end
    end
    
endmodule