`timescale 1ns / 1ps
module full_sub(a,b,c,bo,d);
input a,b,c;
output bo,d;
wire t1,t2,t3,t4,t5;

xor x1(t1,a,b);
xor x2(d,t1,c);
not n1(t2,a);
and a1(t3,t1,b);
and a2(t4,b,c);
and a3(t5,t2,c);
or o1(bo,t3,t4,t5);
endmodule
