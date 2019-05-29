`timescale 1ns / 1ps
// update PC 
`include "defines.vh"
module access_mem(
    input wire clock,
    input wire reset,
    
    // control signal
    input MemWriteM,
    // input 
    input wire [`ADDRLENGTH] addr,
    input wire [`DATALENGTH] writeData,
    input wire [`DATALENGTH] readData_from_ram,
    // output
    output reg [`DATALENGTH] readData,
    
    output reg data_sram_en,
    output reg [3:0] data_sram_wen,
    output reg [`ADDRLENGTH] data_sram_addr,
    output reg [`DATALENGTH] data_sram_wdata
    );
   
   always @ (negedge clock) begin
        if(reset != `RESETABLE && MemWriteM == 1'b1)begin
            data_sram_en<='b1;
            data_sram_wen<='b1111;
            data_sram_addr<=addr;
            data_sram_wdata<=writeData;
        end
   end
   always @ (*) begin
        if(reset != `RESETABLE && MemWriteM=='b0) begin
            data_sram_en<='b1;
            data_sram_wen<='b0000;
            data_sram_addr<=addr;
            readData<=readData_from_ram;
        end else begin
            data_sram_en<='b0;
            readData<=`ZEROWORD;
        end
   end
   
endmodule