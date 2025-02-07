`timescale 1ns / 1ps
module bit2comp(
    input a0, a1,  // Input bits of a
    input b0, b1,  // Input bits of b
    output g, l, e // Outputs for greater, less, and equal
);

    wire g0, g1;        // Wires for greater conditions for each bit
    wire l0, l1;        // Wires for less conditions for each bit
    wire e0, e1;        // Wires for equality conditions for each bit
    wire abar0, abar1;  // Wires for ~a
    wire bbar0, bbar1;  // Wires for ~b
    wire t1_0, t2_0, t1_1, t2_1; // Temporary wires for equality

    // NOT gates to create abar and bbar
    not (abar0, a0);
    not (bbar0, b0);
    not (abar1, a1);
    not (bbar1, b1);

    // Bit 1 (Most Significant Bit)
    // a1 > b1: g1 = a1 & ~b1
    and (g1, a1, bbar1);
    // a1 < b1: l1 = ~a1 & b1
    and (l1, abar1, b1);
    // a1 == b1: e1 = (a1 & b1) | (~a1 & ~b1)
    and (t1_1, a1, b1);
    and (t2_1, abar1, bbar1);
    or (e1, t1_1, t2_1);

    // Bit 0 (Least Significant Bit)
    // a0 > b0: g0 = a0 & ~b0
    and (g0, a0, bbar0);
    // a0 < b0: l0 = ~a0 & b0
    and (l0, abar0, b0);
    // a0 == b0: e0 = (a0 & b0) | (~a0 & ~b0)
    and (t1_0, a0, b0);
    and (t2_0, abar0, bbar0);
    or (e0, t1_0, t2_0);

    // Combine the individual bit comparison results for the final greater (g), less (l), and equal (e)
    // g = g1 | (e1 & g0)
    wire e1_g0;
    and (e1_g0, e1, g0);
    or (g, g1, e1_g0);

    // l = l1 | (e1 & l0)
    wire e1_l0;
    and (e1_l0, e1, l0);
    or (l, l1, e1_l0);

    // e = e1 & e0 (both bits must be equal)
    and (e, e1, e0);

endmodule