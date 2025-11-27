module full_adder
(
    input  carry_in,
    input  a,
    input  b,

    output q,
    output carry_out
);

    // Задание:
    // Реализовать модуль полного сумматора используя модули полусумматоров

    // START_SOLUTION

    wire ir, ic1, ic2;

    half_adder ha1 ( a, b, ir, ic1 );

    half_adder ha2 ( ir, carry_in, q, ic2 );

    or ( carry_out, ic1, ic2 );

    // END_SOLUTION

endmodule
