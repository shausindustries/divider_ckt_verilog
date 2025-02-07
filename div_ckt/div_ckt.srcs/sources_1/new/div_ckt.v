`timescale 1ns / 1ps
module divckt(a0,a1,a2,a3,b0,b1,q0,q1,r0,r1,r2,blag);
input a0,a1,a2,a3;
input b0,b1;
output q0,q1;
output r0,r1,r2;
output blag;
wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16;

half_sub H1(.a(a1),.b(b1),.bo(c0),.d(c1));
full_sub F1(.a(c0),.b(a0),.c(b0),.bo(c2),.d(c3));
half_sub H2(.a(a2),.b(b1),.bo(c4),.d(c5));
full_sub F2(.a(a1),.b(b0),.c(c4),.bo(c6),.d(c7));
bit2comp C1(.a0(a0),.a1(a1),.b0(b0),.b1(b1),.g(q0),.l(c8));
mux_21 M1(.a(c1),.b(c5),.s(c8),.o(c9));
mux_21 M2(.a(c3),.b(c7),.s(c8),.o(c10));
mux_21 M5(.a(c2),.b(c6),.s(c8),.o(c16));
bit2comp C2(.a0(c10),.a1(a3),.b0(b0),.b1(b1),.g(q1),.l(c11));
mux_21 M3(.a(b0),.b(1'b0),.s(c11),.o(c12));
mux_21 M4(.a(b1),.b(1'b0),.s(c11),.o(c13));
half_sub H3(.a(c10),.b(b0),.bo(c14),.d(r0));
full_sub F3(.a(c14),.b(a3),.c(c13),.bo(c15),.d(r1));
full_sub F4(.a(c15),.b(c9),.c(c16),.bo(bflag),.d(r2));
endmodule
