`timescale 1ns / 1ps
module IF_ID(clk,rst,if_pc,if_instr,id_pc,id_instr);
    input wire clk;
    input wire rst;
    //signal for fetch
    input wire[31:0] if_pc;
    input wire[31:0] if_instr;
    //signal for decode
    output reg[31:0] id_pc;
    output reg[31:0] id_instr;
    
    always@(posedge clk)
        if(rst==1)
            begin
                id_pc<='h00000000;
                id_instr<='h00000000;
            end
        else
            begin
                id_pc<=if_pc;
                id_instr<=if_instr;
            end
    
endmodule
