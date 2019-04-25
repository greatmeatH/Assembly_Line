`timescale 1ns / 1ps
// update PC 
`include "defines.vh"
module access_mem(
    input wire clock,
    input wire reset,
    
    // control signal
    input MemWriteM,
    
    // input 
    input wire[`ADDRLENGTH] addr,
    input wire [`DATALENGTH]writeData,
    
    // output
    output reg[`DATALENGTH] readData
    );
   
    reg[`DATALENGTH]  data_mem[0:`DATA_MEM_NUM-1];
    initial $readmemh ("/home/lihang/GNUworks/data_rom.data",data_mem);
    
   always @ (posedge clock) begin
        if(reset != `RESETABLE && MemWriteM == 1'b1)begin
            data_mem[addr[16:0]] <= writeData; //  jia she data rom 17 gen di zhi xian
        end 
   end
   
   always@(*)begin
        if(reset == `RESETABLE)begin
            readData <= `ZEROWORD;
        end
        else begin
            readData <= data_mem[addr[16:0]]; // 16 : 0 to be done
        end
   end
   
endmodule