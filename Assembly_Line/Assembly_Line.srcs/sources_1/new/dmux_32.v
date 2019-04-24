`timescale 1ns / 1ns
module dmux_32(in1,in2,in3,in4,mux_sel,out);
input wire [31:0] in1;
input wire [31:0] in2;
input wire [31:0] in3;
input wire [31:0] in4;
input wire [1:0] mux_sel;
output reg [31:0] out;

always@(*) begin
    out<=(mux_sel=='b00)?in1:(mux_sel=='b01)?in2:(mux_sel=='b10)?in3:in4;
end
endmodule
