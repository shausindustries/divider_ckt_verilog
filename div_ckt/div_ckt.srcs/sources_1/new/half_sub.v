`timescale 1ns / 1ps
module half_sub(a,b,bo,d);
input a,b;
output bo,d;
wire t1;

xor x1(d,a,b);
not n1(t1,a);
and a1(bo,t1,b);

endmodule
