`include "fulladder.v"
module fourbitadder(input [7:0]a, input [7:0]b, output [7:0]sum, output c_out);
wire c0, c1, c2, c3, c4, c5, c6;

fulladder fa0 (.c_out(c0), .sum(sum[0]), .a(a[0]), .b(b[0]), .c_in(1'b0));
fulladder fa1 (.c_out(c1), .sum(sum[1]), .a(a[1]), .b(b[1]), .c_in(c0));
fulladder fa2 (.c_out(c2), .sum(sum[2]), .a(a[2]), .b(b[2]), .c_in(c1));
fulladder fa3 (.c_out(c3), .sum(sum[3]), .a(a[3]), .b(b[3]), .c_in(c2));
fulladder fa4 (.c_out(c4), .sum(sum[0]), .a(a[0]), .b(b[0]), .c_in(c3));
fulladder fa5 (.c_out(c5), .sum(sum[1]), .a(a[1]), .b(b[1]), .c_in(c4));
fulladder fa6 (.c_out(c6), .sum(sum[2]), .a(a[2]), .b(b[2]), .c_in(c5));
fulladder fa7 (.c_out(c_out), .sum(sum[3]), .a(a[3]), .b(b[3]), .c_in(c6));

endmodule
