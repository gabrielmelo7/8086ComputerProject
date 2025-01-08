`timescale 1ps/1ps
module fullnot(input[7:0]a, output [7:0]y);
assign #1 y[0] = ~a[0];
assign #1 y[1] = ~a[1];
assign #1 y[2] = ~a[2];
assign #1 y[3] = ~a[3];
assign #1 y[4] = ~a[4];
assign #1 y[5] = ~a[5];
assign #1 y[6] = ~a[6];
assign #1 y[7] = ~a[7];
endmodule