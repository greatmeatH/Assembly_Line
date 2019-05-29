
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

`define ALUCONTROL_SIZE 2:0



`define REGNUM 32
// opcode
`define OP_LW 6'b100011
`define OP_ORI 6'b001101
`define OP_ADD 6'b000000
// opcode over

// ALU code
`define ALU_ADD 3'b010
`define ALU_OR 3'b001
// ALU code over
endmodule