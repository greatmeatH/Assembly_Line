`timescale 1ns/1ns
module ext(ExtOp,in_data,out_data);

input ExtOp;//'b0 for zero,'b1 for sign
input [15:0] in_data;
output [31:0] out_data;

assign out_data=(ExtOp=='b0)?{16'b0,in_data}:{{16{in_data[15]}},in_data};

endmodule