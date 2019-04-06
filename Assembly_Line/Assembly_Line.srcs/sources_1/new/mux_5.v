`timescale 1ns / 1ns
module mux_5(in1,in2,mux_sel,out);
input wire [4:0] in1;
input wire [4:0] in2;
input wire mux_sel;
output wire [4:0] out;

assign out=(mux_sel=='b1)?in1:in2;

endmodule
