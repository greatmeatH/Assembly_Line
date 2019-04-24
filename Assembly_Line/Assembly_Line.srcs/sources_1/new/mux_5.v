`timescale 1ns / 1ns
module mux_5(clk,rst,in1,in2,mux_sel,out);
input wire clk;
input wire rst;
input wire [4:0] in1;
input wire [4:0] in2;
input wire mux_sel;
output reg [4:0] out;

always @ (*) begin
        out<=(mux_sel=='b0)?in1:in2;
end

endmodule
