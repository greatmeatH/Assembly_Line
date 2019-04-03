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
    wire [5:0]RsD;
    wire [5:0]RtD;
    wire [5:0]RdD;
    wire RegWriteD;
    wire MemtoRegD;
    wire MemWriteD;
    wire [2:0]ALUControlD;
    wire ALUSrcD;
    wire RegDstD;
    wire BranchD;
    wire [31:0]RD1;
    wire [31:0]RD2;
    wire [31:0]SignImmD;
        
    assign RsD=InstrD[25:21];
    assign RtD=InstrD[20:16];
    assign RdD=InstrD[15:11];
    //**********************decode wire**********************//
    
    //**********************execute wire*********************//
    wire [5:0]RsE;
    wire [5:0]RtE;
    wire [5:0]RdE;
    wire RegWriteE;
    wire MemtoRegE;
    wire MemWriteE;
    wire [2:0] ALUControlE;
    wire ALUSrcE;
    wire RegDstE;
    wire BranchE;
    wire [31:0] RD1E;
    wire [31:0] RD2E;
    wire [31:0] SignImmE;
    wire [31:0] PCPlus4E;
        
    //**********************execute wire*********************//
    
    //**********************memory wire**********************//
    wire [31:0]PCBranchM;
    wire PCSrcM;
    //**********************memory wire**********************//
    
    //*********************writeback wire********************//
    wire [4:0]WriteRegW;
    wire [31:0]ResultW;
    wire RegWriteW;
    //*********************writeback wire********************//

    
    //*********************fetch module**********************//
    mux PC_Src_mux(PCPlus4F,PCBranchM,PCSrcM,nPCF);//choose the source of PC with signal PCSrcM; 0 for PCPlus4F, 1 for PCBranchM;
    
    pc U_pc(clk,rst,nPCF,PCF);
    
    im_4k U_im_4k(PCF,InstrF);
    
    alu PC_Add_alu(PCF,'b100,'b0,PCPlus4F);
    
    IF_ID U_IF_ID(clk,rst,PCPlus4F,InstrF,PCPlus4D,InstrD);
    //*********************fetch module**********************//
    
    //*********************decode module*********************//
    gpr U_gpr(clk,RsD,RtD,WriteRegW,RegWriteW,ResultW,RD1,RD2);
    
    ext U_ext(InstrD[15:0],SignImmD);
    
    controller U_controller(InstrD[31:26],InstrD[5:0],RegWriteD,MemtoRegD,MemWriteD,ALUControlD,ALUSrcD,RegDstD,BranchD);
    
    ID_IE U_ID_IE(clk,rst,RegWriteD,MemtoRegD,MemWriteD,ALUControlD,ALUSrcD,RegDstD,BranchD,RD1,RD2,RsD,RtD,RdD,
    SignImmD,PCPlus4D,RegWriteE,MemtoRegE,MemWriteE,ALUControlE,ALUSrcE,RegDstE,BranchE,RD1E,RD2E,RsE,RtE,RdE,SignImmE,PCPlus4E);
    //*********************decode module*********************//
    
    //*********************execute module********************//    
    //*********************execute module********************//
    
    //*********************memory module*********************//
    //*********************memory module*********************//
    
    //********************writeback module*******************//
    //********************writeback module*******************//        
        
    //module im_4k(addr,dout);
    
    //module dm_4k(addr,din,we,clk,dout);
    
    //module gpr(clk,rs,rt,dst,RegWr,in_data,out_rs,out_rt);
    
    //module controller(op,funct,RegWrite,MemtoReg,MemWrite,ALUControl,ALUSrc,RegDst,Branch);
    
    //module pc(clk,rst,npc,pc);
    
    //module npc(imm_16,imm_26,pc,npc,NPCSel);
    
    //module mux(in1,in2,mux_sel,out);//mux_sel='b0 for in1,mux_sel='b1 for in2
    
    //module alu(in_data1,in_data2,ALUctr,out_data,beqout);
    
    //module ext(in_data,out_data);
    
    //module IF_ID(clk,rst,if_pc,if_instr,id_pc,id_instr);
    
    //module ID_IE(clk,rst,id_RegWrite,id_MemtoReg,id_MemWrite,id_ALUControl,id_ALUSrc,id_RegDst,id_Branch,
    //id_RD1,id_RD2,id_Rs,id_Rt,id_Rd,id_SignImm,id_PCPlus4,ie_RegWrite,ie_MemtoReg,ie_MemWrite,
    //ie_ALUControl,ie_ALUSrc,ie_RegDst,ie_Branch,ie_RD1,ie_RD2,ie_Rs,ie_Rt,ie_Rd,ie_SignImm,ie_PCPlus4);
    
endmodule