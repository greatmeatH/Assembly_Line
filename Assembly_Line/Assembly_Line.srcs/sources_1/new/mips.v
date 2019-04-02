`timescale 1ns/1ns
module mips(clk,rst);

    //**********************global wire**********************//
    input clk;
    input rst;
    //**********************global wire**********************//
    
    //**********************fetch wire***********************//
    wire [31:0]PCPlus4F;
    wire [31:0]InstrF;
    wire [31:0]PCF;
    wire [31:0]nPCF;
    //**********************fetch wire***********************//
    
    //**********************decode wire**********************//
    wire [31:0]PCPlus4D;
    wire [31:0]InstrD;
    //**********************decode wire**********************//
    
    //**********************execute wire*********************//    
    //**********************execute wire*********************//
    
    //**********************memory wire**********************//
    wire [31:0]PCBranchM;
    wire PCSrcM;
    //**********************memory wire**********************//
    
    //*********************writeback wire********************//
    //*********************writeback wire********************//

    
    //*********************fetch module**********************//
    mux PC_Src_mux(PCPlus4F,PCBranchM,PCSrcM,nPCF);//choose the source of PC with signal PCSrcM; 0 for PCPlus4F, 1 for PCBranchM;
    
    pc U_pc(clk,rst,nPCF,PCF);
    
    im_4k U_im_4k(PCF,InstrF);
    
    alu PC_Add_alu(PCF,'b100,'b0,PCPlus4F);
    
    IF_ID U_IF_ID(clk,rst,PCPlus4F,InstrF,PCPlus4D,InstrD);
    //*********************fetch module**********************//
    
    //*********************decode module*********************//
    
    //*********************decode module*********************//
    
    //*********************execute module********************//    
    //*********************execute module********************//
    
    //*********************memory module*********************//
    //*********************memory module*********************//
    
    //********************writeback module*******************//
    //********************writeback module*******************//        
        
    //module im_4k(addr,dout);
    
    //module dm_4k(addr,din,we,clk,dout);
    
    //module gpr(clk,rs,rt,rd,dst,RegWr,RegDst,in_data,out_rs,out_rt);
    
    //module controller(op,funct,beqout,RegDst,ExtOp,ALUSrc,ALUctr,RegWr,DMWr,GPRSrc,NPCSel);
    
    //module pc(clk,rst,npc,pc);
    
    //module npc(imm_16,imm_26,pc,npc,NPCSel);
    
    //module mux(in1,in2,mux_sel,out);//mux_sel='b0 for in1,mux_sel='b1 for in2
    
    //module alu(in_data1,in_data2,ALUctr,out_data,beqout);
    
    //module ext(ExtOp,in_data,out_data);
    
    //module IF_ID(clk,rst,if_pc,if_instr,id_pc,id_instr);
    
endmodule