`timescale 1ns / 1ns
module left_2(in,out);
    input wire [31:0] in;
    output reg [31:0] out;
    
    always@(*) begin
        out<={in[29:0],2'b00};
    end
    
endmodule
