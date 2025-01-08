`include "fullnot.v"
`include "fourbitadder.v"
module subtractor(input[7:0]a, input[7:0]b, output[7:0]sub, output c_out);
wire [7:0]not_result;
wire [7:0]twoc_b;
wire c1;
fullnot fn(.a(b), .y(not_result));
fourbitadder f1(.a(not_result), .b(8'b00000001), .sum(twoc_b), .c_out(c1));
fourbitadder f2(.a(a), .b(twoc_b), .sum(sub), .c_out(c_out));
endmodule