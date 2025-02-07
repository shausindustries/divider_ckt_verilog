`timescale 1ns / 1ps
module mux_21(a,b,s,o);

input a,b,s;
output o;
wire t1,t2,t3;

not g1(t1,s);
and g2(t2,a,t1);
and g3(t3,a,s);
or g4(o,t2,t3);
endmodule