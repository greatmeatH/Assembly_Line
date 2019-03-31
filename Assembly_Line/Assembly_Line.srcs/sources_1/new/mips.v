`timescale 1ns/1ns
module mips(clk,rst);
    input clk;
    input rst;
    wire [31:0]PCPlus4F;
    wire [31:0]PCBranchM;
    //module im_4k(addr,dout);
    
    //module dm_4k(addr,din,we,clk,dout);
    
    //module gpr(clk,rs,rt,rd,dst,RegWr,RegDst,in_data,out_rs,out_rt);
    
    //module controller(op,funct,beqout,RegDst,ExtOp,ALUSrc,ALUctr,RegWr,DMWr,GPRSrc,NPCSel);
    wire PCSrcM;
    
    
    //module pc(clk,rst,npc,pc);
    
    //module npc(imm_16,imm_26,pc,npc,NPCSel);
    wire [31:0]nPC;
    //module mux(in1,in2,mux_sel,out);//mux_sel='b0 for in1,mux_sel='b1 for in2
    
    //module alu(in_data1,in_data2,ALUctr,out_data,beqout);
    
    //module ext(ExtOp,in_data,out_data);
    
    mux PC_Src(PCPlus4F,PCBranchM,PCSrcM,nPC);
    
endmodule