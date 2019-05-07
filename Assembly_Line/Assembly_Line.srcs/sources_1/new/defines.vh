
module defines();

`define WRITEABLE 1'b1
`define UNWRITEABLE 1'b0

`define RESETABLE 1'b1
`define RESETUNABLE 1'b0

`define ZEROWORD 32'h00000000

`define INSTRLENGTH 31:0
`define DATALENGTH 31:0 
`define ADDRLENGTH 31:0

`define INSTR_MEM_NUM 131071
`define DATA_MEM_NUM 131071

`define INSTRSIZE 31:0
`define PCSIZE 31:0

`define OP_SIZE 5:0
`define R_SIZE 4:0
`define IMI_SIZE 15:0
//`define SIG_IMI_SIZE 31:0

`define ALUCONTROL_SIZE 4:0  //hjw
`define EXTENDSIGNAL_SIZE 1:0   //hjw


`define REGNUM 32

// opcode
`define OP_LW 6'b100011
`define OP_ORI 6'b001101
`define OP_ADDI 6'b001000
`define OP_ADDIU 6'b001001
`define OP_ALL_ZERO 6'b000000
`define OP_ANDI 6'b001100  //hjw
`define OP_XORI 6'b001110  //hjw
`define OP_LUI 6'b001111  //hjw
// opcode over
// funccode
`define FUNC_ADD 6'b100000
`define FUNC_ADDU 6'b100001
`define FUNC_SUBU 6'b100011
`define FUNC_SUB 6'b100010
`define FUNC_SLT 6'b101010
`define FUNC_AND 6'b100100  //hjw
`define FUNC_OR 6'b100101  //hjw
`define FUNC_XOR 6'b100110  //hjw
`define FUNC_NOR 6'b100111  //hjw
`define FUNC_SLL 6'b000000  //hjw
`define FUNC_SLLV 6'b000100  //hjw
`define FUNC_SRA 6'b000011  //hjw
`define FUNC_SRAV 6'b000111  //hjw
`define FUNC_SRL 6'b000010  //hjw
`define FUNC_SRLV 6'b000110  //hjw
// funccode over
// ALU code
`define ALU_SLEEP 5'b00000  //hjw
`define ALU_ADD 5'b00010
`define ALU_OR 5'b00001
`define ALU_XOR 5'b00100  //hjw
`define ALU_NOR 5'b00101  //hjw
`define ALU_SUB 5'b00110
`define ALU_SLT 5'b00111
`define ALU_AND 5'b00011  //hjw
`define ALU_SLL 5'b01000  //hjw
`define ALU_SRA 5'b01001  //hjw
`define ALU_SRL 5'b01010  //hjw
// ALU code over

endmodule