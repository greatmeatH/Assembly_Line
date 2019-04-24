`timescale 1ns/1ns
module mux_32(in1,in2,mux_sel,out);//mux_sel='b0 for in1,mux_sel='b1 for in2

input [31:0] in1;
input [31:0] in2;
input mux_sel;
output reg [31:0] out;

    always @ (*) begin
        out<=(mux_sel=='b1)?in2:in1;
    end

endmodule