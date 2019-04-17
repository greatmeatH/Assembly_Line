`timescale 1ns/1ns
module mips(clk,rst);

    //**********************global wire**********************//
    input clk;
    input rst;
    //**********************global wire**********************//
    
    //**********************fetch wire***********************//
    wire [31:0] PCPlus4F;
    wire [31:0] InstrF;
    wire [31:0] PCF;
    wire [31:0] nPCF;
    //**********************fetch wire***********************//
    
    //**********************decode wire**********************//
    wire [31:0] PCPlus4D;
    wire [31:0] InstrD;
    wire [4:0] RsD;
    wire [4:0] RtD;
    wire [4:0] RdD;
    wire RegWriteD;//register write enable
    wire MemtoRegD;//register write with data from memory
    wire MemWriteD;//memory write enable
    wire [2:0] ALUControlD;//control alu operator: 'b00 for add, 'b01 for logic_or
    wire ALUSrcD;//alu source:'b0 for reg_rt_data, 'b1 for extended_16bit_immediate
    wire RegDstD;//destination of register write: 'b0 for rt, 'b1 for rd
    wire BranchD;//instruction beq signal, Branch&Zero=>choose source of PC
    wire [31:0] RD1;//register data read from rs
    wire [31:0] RD2;//register data read from rt
    wire [31:0] SignImmD;//extended data from 16 bits immediate number
        
    assign RsD=InstrD[25:21];
    assign RtD=InstrD[20:16];
    assign RdD=InstrD[15:11];
    //**********************decode wire**********************//
    
    //**********************execute wire*********************//
    wire [4:0] RsE;
    wire [4:0] RtE;
    wire [4:0] RdE;
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
    wire [31:0] SrcAE;//first source data of alu
    wire [31:0] SrcBE;//second source data of alu
    wire [4:0] WriteRegE;
    wire [31:0] WriteDataE;
    wire [31:0] ALUOutE;//output of alu
    wire ZeroE;//if first source of alu equals to second one
    wire [31:0] SignImm_2E;//extended immediately after moving two spaces to the left
    wire [31:0] PCBranchE;
    //**********************execute wire*********************//
    
    //**********************memory wire**********************//
    wire [31:0] PCBranchM;
    wire PCSrcM;
    wire [31:0] ALUOutM;
    wire RegWriteM;
    wire MemtoRegM;
    wire MemWriteM;
    wire BranchM;
    wire ZeroM;
    wire [31:0] WriteDataM;
    wire [4:0] WriteRegM;
    wire [31:0] ReadDataM;
    //**********************memory wire**********************//
    
    //*********************writeback wire********************//
    wire [4:0] WriteRegW;
    wire [31:0] ResultW;
    wire RegWriteW;
    wire [31:0] ReadDataW;
    wire MemtoRegW;
    wire [31:0] ALUOutW;
    //*********************writeback wire********************//

    //*********************conflict wire*********************//
    wire [1:0] ForwardAE;
    wire [1:0] ForwardBE;
    //*********************conflict wire*********************//
    
    //*********************fetch module**********************//
    mux_32 PC_Src_mux(PCPlus4F,PCBranchM,PCSrcM,nPCF);//choose the source of PC with signal PCSrcM; 0 for PCPlus4F, 1 for PCBranchM;
    
    pc U_pc(clk,rst,nPCF,PCF);
    
    im_4k U_im_4k(PCF[11:2],InstrF);
    
    alu PC_Add_alu(PCF,3'b100,2'b00,PCPlus4F,);
    
    IF_ID U_IF_ID(clk,rst,PCPlus4F,InstrF,PCPlus4D,InstrD);//a set of registers that transfer data from fetch period to decode period
    //*********************fetch module**********************//
    
    //*********************decode module*********************//
    gpr U_gpr(clk,RsD,RtD,WriteRegW,RegWriteW,ResultW,RD1,RD2);//registers
    
    ext U_ext(InstrD[15:0],SignImmD);//extension module
    
    controller U_controller(InstrD[31:26],InstrD[5:0],RegWriteD,MemtoRegD,MemWriteD,ALUControlD,ALUSrcD,RegDstD,BranchD);
    
    ID_IE U_ID_IE(clk,rst,RegWriteD,MemtoRegD,MemWriteD,ALUControlD,ALUSrcD,RegDstD,BranchD,RD1,RD2,RsD,RtD,RdD,
    SignImmD,PCPlus4D,RegWriteE,MemtoRegE,MemWriteE,ALUControlE,ALUSrcE,RegDstE,BranchE,RD1E,RD2E,RsE,RtE,RdE,SignImmE,PCPlus4E);//a set of registers that transfer data from decode period to execute period
    //*********************decode module*********************//
    
    //*********************execute module********************//
    mux_5 Write_Reg_mux(RtE,RdE,RegDstE,WriteRegE);//choose reg to write
    
    dmux_32 Alu_SrcA_mux(RD1E,ResultW,ALUOutM,,ForwardAE,SrcAE);//choose first source of alu: 'b00 for rs, 'b01 for data from memory period(two periods apart), 'b10 for data from alu period(one period apart); controlled by conflict_control module
    
    dmux_32 Alu_WriteData_mux(RD2E,ResultW,ALUOutM,,ForwardBE,WriteDataE);//choose possible second source of alu like Alu_SrcA_mux, output is also been used as data to write memory(sw)
    
    mux_32 Alu_SrcB_mux(WriteDataE,SignImmE,ALUSrcE,SrcBE);//choose second source of alu, 'b0 for rt/redirection data, 'b1 for extended 16 bits immediately
    
    alu U_alu(SrcAE,SrcBE,ALUControlE,ALUOutE,ZeroE);
    
    left_2 PC_Src_left_2(SignImmE,SignImm_2E);//make the 16 bits immediately two places to the left 
    
    alu PC_Branch_alu(SignImm_2E,PCPlus4E,2'b00,PCBranchE);
    
    IE_IM U_IE_IM(clk,rst,RegWriteE,MemtoRegE,MemWriteE,BranchE,ZeroE,ALUOutE,WriteDataE,WriteRegE,PCBranchE,
    RegWriteM,MemtoRegM,MemWriteM,BranchM,ZeroM,ALUOutM,WriteDataM,WriteRegM,PCBranchM);//execute period to memory period
    //*********************execute module********************//
    
    //*********************memory module*********************//
    assign PCSrcM=(BranchM&ZeroM);
    
    dm_4k U_dm_4k(ALUOutM,WriteDataM,MemWriteM,clk,ReadDataM);//data memory
    
    IM_IW U_IM_IW(clk,rst,RegWriteM,MemtoRegM,ReadDataM,WriteDataM,WriteRegM,
    RegWriteW,MemtoRegW,ReadDataW,ALUOutW,WriteRegW);//memory period to writeback period
    //*********************memory module*********************//
    
    //********************writeback module*******************//
    mux_32 Result_Src_mux(ALUOutW,ReadDataW,MemtoRegW,ResultW);//choose data from memory or alu
    //********************writeback module*******************//   
    
    //********************conflict module********************//
    conflict_control U_conflict_control(clk,rst,RsE,RtE,WriteRegE,WriteRegW,RegWriteM,RegWriteW,ForwardAE,ForwardBE);//deal with data conflict
    //********************conflict module********************//     
        
    //module im_4k(addr,dout);
    
    //module dm_4k(addr,din,we,clk,dout);
    
    //module gpr(clk,rs,rt,dst,RegWr,in_data,out_rs,out_rt);
    
    //module controller(op,funct,RegWrite,MemtoReg,MemWrite,ALUControl,ALUSrc,RegDst,Branch);
    
    //module pc(clk,rst,npc,pc);
    
    //module npc(imm_16,imm_26,pc,npc,NPCSel);
    
    //module mux(in1,in2,mux_sel,out);//mux_sel='b0 for in1,mux_sel='b1 for in2
    
    //module dmux_32(in1,in2,in3,in4,mux_sel,out);//mux_sel='b00 for in1, mux_sel='b01 for in2, mux_sel='b10 for in3, mux_sel='b11 for in4
    
    //module alu(in_data1,in_data2,ALUctr,out_data,beqout);
    
    //module ext(in_data,out_data);
    
    //module IF_ID(clk,rst,if_pc,if_instr,id_pc,id_instr);
    
    //module ID_IE(clk,rst,id_RegWrite,id_MemtoReg,id_MemWrite,id_ALUControl,id_ALUSrc,id_RegDst,id_Branch,
    //id_RD1,id_RD2,id_Rs,id_Rt,id_Rd,id_SignImm,id_PCPlus4,ie_RegWrite,ie_MemtoReg,ie_MemWrite,
    //ie_ALUControl,ie_ALUSrc,ie_RegDst,ie_Branch,ie_RD1,ie_RD2,ie_Rs,ie_Rt,ie_Rd,ie_SignImm,ie_PCPlus4);
    
    //module IE_IM(clk,rst,ie_RegWrite,ie_MemtoReg,ie_MemWrite,ie_Branch,ie_Zero,ie_ALUOut,ie_WriteData,ie_WriteReg,ie_PCBranch,
    //RegWrite_im,MemtoReg_im,MemWrite_im,Branch_im,Zero_im,ALUOut_im,WriteData_im,WriteReg_im,PCBranch_im);
    
    //module left_2(in,out);
    
    //module IM_IW(clk,rst,im_RegWrite,im_MemtoReg,im_ReadData,im_ALUOut,im_WriteReg,
    //RegWrite_iw,MemtoReg_iw,ReadData_iw,ALUOut_iw,WriteReg_iw);
    
    //module conflict_control(clk,rst,cc_RsE,cc_RtE,cc_WriteRegM,cc_WriteRegW,cc_RegWriteM,cc_RegWriteW,cc_ForwardAE,cc_ForwardBE);
endmodule