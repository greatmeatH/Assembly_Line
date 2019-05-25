`timescale 1ns / 1ps
// update PC 
`include "defines.vh"
module access_mem(
    input wire clock,
    input wire reset,
    
    // control signal
    input MemWriteM,
    input wire[`OP_SIZE] opcodeM, 
    
    // input 
    input wire[`ADDRLENGTH] addr,
    input wire [`DATALENGTH]writeData,
    
    // output
    output reg[`DATALENGTH] readData
    );
   
    reg[3:0] mem_sel;//which byte can be selected

    reg[`DATALENGTH] data_mem;
    reg[`BYTELENGTH] data_mem0[0:`DATA_MEM_NUM-1];
    reg[`BYTELENGTH] data_mem1[0:`DATA_MEM_NUM-1];
    reg[`BYTELENGTH] data_mem2[0:`DATA_MEM_NUM-1];
    reg[`BYTELENGTH] data_mem3[0:`DATA_MEM_NUM-1];
    // four  8bit mem replace one  32bit mem
    always @(*)begin
        if(reset == `RESETABLE) begin
            data_mem <= `ZEROWORD;
        end else if(MemWriteM == 1'b0) begin
            data_mem <= {data_mem3[addr[`DATA_MEM_NUM_LOG2+1:2]],data_mem2[addr[`DATA_MEM_NUM_LOG2+1:2]],
                        data_mem1[addr[`DATA_MEM_NUM_LOG2+1:2]],data_mem0[addr[`DATA_MEM_NUM_LOG2+1:2]]};
                        //the lowest 2bit don't consider 
        end else begin
            data_mem <=`ZEROWORD;
        end
    end
            
    
    //initial $readmemh ("/home/lihang/GNUworks/data_rom.data",data_mem); 
    
   always @ (negedge clock) begin
        if(reset != `RESETABLE && MemWriteM == 1'b1)begin
            //data_mem[addr[16:0]] <= writeData; //  jia she data rom 17 gen di zhi xian
            case(opcodeM)
             `OP_SB:begin
                data_mem <= {writeData[7:0],writeData[7:0],writeData[7:0],writeData[7:0]};
                    case(addr[1:0])
                        2'b00:begin
                            mem_sel <= 4'b1000;
                        end
                        2'b01:begin
                            mem_sel <= 4'b0100;
                        end
                        2'b10:begin
                            mem_sel <= 4'b0010;
                        end
                        2'b11:begin
                            mem_sel <= 4'b0001;
                        end
                        default:begin
                            mem_sel <= `ZEROWORD;
                        end
                    endcase
                 end
             `OP_SH:begin
                data_mem <= {writeData[15:0],writeData[15:0]};
                    case(addr[1:0])
                        2'b00: begin
                            mem_sel <= 4'b1100;
                        end
                        2'b10: begin
                            mem_sel <= 4'b0011;
                        end
                        default:begin
                            mem_sel <= `ZEROWORD;
                        end
                    endcase
                 end
             `OP_SW:begin
                    data_mem <= writeData;
                    mem_sel <= 4'b1111;
                end
            endcase
        end
        else begin
            mem_sel <=4'b1111;
         end
   end
   
   always@(*)begin
        if(reset == `RESETABLE)begin
            readData <= `ZEROWORD;
        end
        else begin
            //readData <= data_mem[addr[16:0]]; // 16 : 0 to be done
            case(opcodeM)
             `OP_LB: begin
                case(addr[1:0])
                    2'b00:begin
                        readData <= {{24{data_mem[31]}},data_mem[31:24]};
                        mem_sel <= 4'b1000;
                    end
                    2'b01:begin
                        readData <= {{24{data_mem[23]}},data_mem[23:16]};
                        mem_sel <= 4'b0100;
                    end
                    2'b10:begin
                        readData <= {{24{data_mem[15]}},data_mem[15:8]};
                        mem_sel <= 4'b0010;
                    end
                    2'b11:begin
                        readData <= {{24{data_mem[31]}},data_mem[31:24]};
                        mem_sel <= 4'b0001;
                    end
                    default:begin
                        readData <= `ZEROWORD;
                    end
                endcase
             end
             `OP_LBU: begin
                case(addr[1:0])
                    2'b00:begin
                        readData <= {{24{1'b0}},data_mem[31:24]};
                        mem_sel <= 4'b1000;
                    end
                    2'b01:begin
                        readData <= {{24{1'b0}},data_mem[23:16]};
                        mem_sel <= 4'b0100;
                    end
                    2'b10:begin
                        readData <= {{24{1'b0}},data_mem[15:8]};
                        mem_sel <= 4'b0010;
                    end
                    2'b11:begin
                        readData <= {{24{1'b0}},data_mem[31:24]};
                        mem_sel <= 4'b0001;
                    end
                    default:begin
                        readData <= `ZEROWORD;
                    end
                endcase
             end
             `OP_LH: begin
                case(addr[1:0])
                    2'b00: begin
                        readData <= {{16{data_mem[31]}},data_mem[31:16]};
                        mem_sel <= 4'b1100;
                    end
                    2'b10: begin
                        readData <= {{16{data_mem[15]}},data_mem[15:0]};
                        mem_sel <= 4'b0011;
                    end
                    default:begin
                        readData <= `ZEROWORD;
                    end
                endcase
                
                
                
             end
             `OP_LHU: begin
                case(addr[1:0])
                    2'b00: begin
                        readData <= {{16{1'b0}},data_mem[31:16]};
                        mem_sel <= 4'b1100;
                    end
                    2'b10: begin
                        readData <= {{16{1'b0}},data_mem[15:0]};
                        mem_sel <= 4'b0011;
                    end
                    default:begin
                        readData <= `ZEROWORD;
                    end
                endcase
             end
            `OP_LW: begin
                readData <= data_mem;
                mem_sel <= 4'b1111;
            end
          endcase
        end
    end

   
endmodule