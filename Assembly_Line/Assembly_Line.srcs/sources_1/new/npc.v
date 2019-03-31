`timescale 1ns/1ns
module npc(imm_16,imm_26,pc,npc,NPCSel);
    input [15:0] imm_16;
    input [25:0] imm_26;
    input [31:0] pc;
    output [31:0] npc;
    input [1:0] NPCSel;
    
    assign npc=(NPCSel=='b01)?(pc+3'b100+{{14{imm_16[15]}},imm_16,2'b00}):(NPCSel==2'b10)?({pc[31:28],imm_26,2'b00}):(pc+3'b100);
    
endmodule