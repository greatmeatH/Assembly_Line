`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2019 07:20:18 AM
// Design Name: 
// Module Name: mips
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.vh"
module mips(
    input wire clock,
    input wire reset
    );
    
        //  wires
    wire [`PCSIZE] PCPlus4F;
    wire [`PCSIZE] PCBranchD;
    wire [`PCSIZE] PCF;
    wire [`INSTRSIZE] InstrI;
    wire StallF;
    
    wire StallD;
    wire PCSrcD;
    wire [`INSTRSIZE]InstrD;
    wire [`PCSIZE] PCPlus4D;
    
    wire[`R_SIZE] rs;
    wire[`R_SIZE] rt;
    wire[`R_SIZE] rd;
    wire[`IMI_SIZE] im;
    wire[`R_SIZE] sa;   //hjw
    wire[`OP_SIZE] opcode;
    wire[`OP_SIZE] funccode;

    wire [`EXTENDSIGNAL_SIZE] SigExtendSignalD;
    wire RegWriteD;
    wire MemtoRegD;
    wire MemWriteD;
    wire [`ALUCONTROL_SIZE] ALUControlD;
    wire ALUSrcD;
    wire RegDstD;
    wire BranchD;
    wire ShiftSrcD; //hjw
    
    wire RegWriteW;                 // 
    
  //  wire[`DATALENGTH] WD3;          //
   
    wire[`DATALENGTH] RD1;          //
    wire[`DATALENGTH] RD2;          //
    
    wire ForwardAD;                  //
    wire ForwardBD;                 //
    wire [`ADDRLENGTH]ALUOutM;      //
    wire[`DATALENGTH] RD1_out;      //
    wire[`DATALENGTH] RD2_out;      //

    wire[`DATALENGTH] SignImmD;     //
    
    wire[`DATALENGTH] SignImmD_shift2; //
    
    wire FlushE;            //
    wire RegWriteE;
    wire MemtoRegE;
    wire MemWriteE;
    wire[`ALUCONTROL_SIZE] ALUControlE;
    wire ALUSrcE;
    wire RegDstE;
    wire ShiftSrcE; //hjw
    wire [`DATALENGTH]RD1E;
    wire [`DATALENGTH]RD2E;
    wire [`R_SIZE]RsE;
    wire [`R_SIZE]RtE;
    wire [`R_SIZE]RdE;
    wire [`DATALENGTH]SignImmE;
    
    wire [`R_SIZE] WriteRegE;       //
    
    wire[1:0] ForwardAE;
    wire[`DATALENGTH] ResultW;
    wire [`DATALENGTH] SrcAE;
    
    wire [`DATALENGTH] WriteDataE;
    wire [`DATALENGTH] SrcBE;
    
    wire[`R_SIZE] ShiftsE;  //hjw
    
    wire [1:0]ForwardBE;
    
    wire [`DATALENGTH] ALUOutE;
    
    wire RegWriteM;
    wire MemtoRegM;
    wire MemWriteM;
   // wire [`DATALENGTH]ALUOutM;
    wire [`DATALENGTH]WriteDataM;
    wire [`R_SIZE] WriteRegM;
    
    wire [`DATALENGTH] ReadDataM;
    
    wire MemtoRegW;
    wire [`DATALENGTH] ReadDataW;
    wire [`DATALENGTH] ALUOutW;
    wire [`R_SIZE] WriteRegW;
    /* below is part1 : get instructment*/
    // get_pc
    get_pc get_pc0(.clock(clock),.reset(reset),.StallF(StallF),.PCSrcD(PCSrcD),.PCPlus4F(PCPlus4F),.PCBranchD(PCBranchD),.PCF(PCF));
    // PC_ALU
    PC_ALU PC_ALU0(.PCF(PCF),.PCPlus4F(PCPlus4F));
    // get_instr
    get_instr get_instr0(.clock(clock),.reset(reset),.instr_addr(PCF),.InstrI(InstrI));
    /* get instructment part is over */
    
    // instr_decode
    instr_decode instr_decode0(.clock(clock),.reset(reset),.StallD(StallD),.PCSrcD(PCSrcD),.InstrI(InstrI),.PCPlus4F(PCPlus4F),.InstrD(InstrD),.PCPlus4D(PCPlus4D));
    
    /* below is part2 : decode*/
    //decode 
    decode decode0(.clock(clock),.reset(reset),.InstrD(InstrD),.rs(rs),.rt(rt),.rd(rd),.sa(sa),.im(im),.opcode(opcode),.funccode(funccode));
    // control_unit
    control_unit control_unit0(.clock(clock),.reset(reset),.opcode_in(opcode),.funccode_in(funccode),.SigExtendSignalD(SigExtendSignalD),.RegWriteD(RegWriteD),.MemtoRegD(MemtoRegD),.MemWriteD(MemWriteD),.ALUControlD(ALUControlD),.ALUSrcD(ALUSrcD),.RegDstD(RegDstD),.BranchD(BranchD),.ShiftSrcD(ShiftSrcD));  //hjw
    // regfile
    regfile regfile0(.clock(clock),.reset(reset),.RegWriteW(RegWriteW),.A1(rs),.A2(rt),.A3(WriteRegW),.WD3(ResultW),.RD1(RD1),.RD2(RD2));
    // get_PCSrcD
    get_PCSrcD get_PCSrcD0(.reset(reset),.ForwardAD(ForwardAD),.ForwardBD(ForwardBD),.RD1(RD1),.RD2(RD2),.ALUOutM(ALUOutM),.BranchD(BranchD),.RD1_out(RD1_out),.RD2_out(RD2_out),.PCSrcD(PCSrcD));
    // sig_extend
    sig_extend sig_extend0(.clock(clock),.reset(reset),.SigExtendSignalD(SigExtendSignalD),.im(im),.SignImmD(SignImmD));
    // shift_unit
    shift_unit shift_unit0(.clock(clock),.reset(reset),.SignImmD(SignImmD),.SignImmD_shift2(SignImmD_shift2));
    // get_PCBranchD
    get_PCBranchD get_PCBranchD0(.clock(clock),.reset(reset),.SignImmD_shift2(SignImmD_shift2),.PCPlus4D(PCPlus4D),.PCBranchD(PCBranchD));
    /* decode part is over*/
    
    // decode_exe
    decode_exe decode_exe0(.clock(clock),.reset(reset),.RegWriteD(RegWriteD),.MemtoRegD(MemtoRegD),.MemWriteD(MemWriteD),.ALUControlD(ALUControlD),.ALUSrcD(ALUSrcD),.RegDstD(RegDstD),.ShiftSrcD(ShiftSrcD),.FlushE(FlushE),.RD1D(RD1_out),.RD2D(RD2_out),.RsD(rs),.RtD(rt),.RdD(rd),.SignImmD(SignImmD),
                            .RegWriteE(RegWriteE),.MemtoRegE(MemtoRegE),.MemWriteE(MemWriteE),.ALUControlE(ALUControlE),.ALUSrcE(ALUSrcE),.RegDstE(RegDstE),.ShiftSrcE(ShiftSrcE),.RD1E(RD1E),.RD2E(RD2E),.RsE(RsE),.RtE(RtE),.RdE(RdE),.SignImmE(SignImmE));   //hjw
    
    /* below is part3 : exe*/
    // get_WriteRegE
    get_WriteRegE get_WriteRegE0(.clock(clock),.reset(reset),.RegDstE(RegDstE),.RtE(RtE),.RdE(RdE),.WriteRegE(WriteRegE));
    // get_SrcAE
    get_SrcAE get_SrcAE0(.clock(clock),.reset(reset),.ForwardAE(ForwardAE),.RD1E(RD1E),.ResultW(ResultW),.ALUOutM(ALUOutM),.SrcAE(SrcAE));
    // get_SrcBE
    get_SrcBE get_SrcBE0(.clock(clock),.reset(reset),.ALUSrcE(ALUSrcE),.WriteDataE(WriteDataE),.SignImmE(SignImmE),.SrcBE(SrcBE));
    //get_ShiftSrc  //hjw
    get_ShiftSrc get_ShiftSrc0(.clock(clock),.reset(reset),.ShiftSrcE(ShiftSrcE),.SrcAE(SrcAE),.SignImmE(SignImmE),.ShiftsE(ShiftsE));    //hjw
    // get_WriteDataE
    get_WriteDataE get_WriteDataE0(.clock(clock),.reset(reset),.ForwardBE(ForwardBE),.RD2E(RD2E),.ResultW(ResultW),.ALUOutM(ALUOutM),.WriteDataE(WriteDataE));
    // SrcAE_SrcBE_ALU
    SrcAE_SrcBE_ALU SrcAE_SrcBE_ALU0(.clock(clock),.reset(reset),.ALUControlE(ALUControlE),.ShiftsE(ShiftsE),.SrcAE(SrcAE),.SrcBE(SrcBE),.ALUOutE(ALUOutE));
    /* exe part is over*/
    
    // exe_accessMem
    exe_accessMem exe_accessMem0(.clock(clock),.reset(reset),.RegWriteE(RegWriteE),.MemtoRegE(MemtoRegE),.MemWriteE(MemWriteE),.ALUOutE(ALUOutE),.WriteDataE(WriteDataE),.WriteRegE(WriteRegE),.RegWriteM(RegWriteM),.MemtoRegM(MemtoRegM),.MemWriteM(MemWriteM),.ALUOutM(ALUOutM),.WriteDataM(WriteDataM),.WriteRegM(WriteRegM));
    
    /* below is part4 : access memory*/
    
    // access_mem
    access_mem access_mem0(.clock(clock),.reset(reset),.MemWriteM(MemWriteM),.addr(ALUOutM),.writeData(WriteDataM),.readData(ReadDataM));
    /* access memory part is over*/
    
    // accessMem_writeback
    accessMem_writeback accessMem_writeback0(.clock(clock),.reset(reset),.RegWriteM(RegWriteM),.MemtoRegM(MemtoRegM),.ReadDataM(ReadDataM),.ALUOutM(ALUOutM),.WriteRegM(WriteRegM),.RegWriteW(RegWriteW),.MemtoRegW(MemtoRegW),.ReadDataW(ReadDataW),.ALUOutW(ALUOutW),.WriteRegW(WriteRegW));
    /* below is part5 : writeback*/
    
    // get_ResultW
    get_ResultW get_ResultW0(.clock(clock),.reset(reset),.MemtoRegW(MemtoRegW),.ReadDataW(ReadDataW),.ALUOutW(ALUOutW),.ResultW(ResultW));
    /* writeback part is over*/
    
    
    /* below is conflict part*/
    
    // hazard unit
    hazard_unit hazard_unit0(.clock(clock),.reset(reset),.RegWriteW(RegWriteW),.RegWriteM(RegWriteM),.MemtoRegM(MemtoRegM),.RegWriteE(RegWriteE),.MemtoRegE(MemtoRegE),.BranchD(BranchD),.WriteRegW(WriteRegW),.WriteRegM(WriteRegM),.WriteRegE(WriteRegE),.RsE(RsE),.RtE(RtE),.RsD(rs),.RtD(rt),
                                .ForwardAE(ForwardAE),.ForwardBE(ForwardBE),.ForwardAD(ForwardAD),.ForwardBD(ForwardBD),.FlushE(FlushE),.StallD(StallD),.StallF(StallF));
    /* confict part is over*/
endmodule
