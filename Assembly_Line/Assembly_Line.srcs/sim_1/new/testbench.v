`timescale 1ns / 1ns
module testbench();
    reg clk;
    reg rst;
    reg [31:0] result;
    mips my_mips(clk,rst);
    
    initial begin
        $readmemh("/home/hejunwen/Assembly_Line/Assembly_Line.data/code.txt",my_mips.U_im_4k.im);
        $readmemh("/home/hejunwen/Assembly_LIne/Assembly_Line.data/cal_data.txt",my_mips.U_gpr.gpr);
        $readmemh("/home/hejunwen/Assembly_Line/Assembly_Line.data/dm_data.txt",my_mips.U_dm_4k.dm);
            rst=1;
            clk=0;
            #30 rst=0;
        $monitor("Time %t,R16=%h",$time,my_mips.U_gpr.gpr[16]);
    end
    
    always
        #20 clk=~clk;
        
endmodule
