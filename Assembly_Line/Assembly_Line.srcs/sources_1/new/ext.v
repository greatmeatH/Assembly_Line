`timescale 1ns/1ns
module ext(in_data,out_data);//sign

    input [15:0] in_data;
    output reg [31:0] out_data;

    always@(*) begin
        out_data={{16{in_data[15]}},in_data};
    end

endmodule