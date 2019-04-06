`timescale 1ns / 1ns
module IF_ID(clk,rst,if_pc,if_instr,pc_id,instr_id);
    input wire clk;
    input wire rst;
    //signal for fetch
    input wire[31:0] if_pc;
    input wire[31:0] if_instr;
    //signal for decode
    output reg[31:0] pc_id;
    output reg[31:0] instr_id;
    
    always@(posedge clk)
        if(rst==1)
            begin
                pc_id<='h00000000;
                instr_id<='h00000000;
            end
        else
            begin
                pc_id<=if_pc;
                instr_id<=if_instr;
            end
    
endmodule
