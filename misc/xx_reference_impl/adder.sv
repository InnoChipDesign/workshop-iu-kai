module adder
(
    input  a4, a3, a2, a1, a0,
    input  b4, b3, b2, b1, b0,

    output overflow,
    output q4, q3, q2, q1, q0
);

    // Задание:
    // Реализовать модуль 5-ти битного сумматора используя модули half_adder и full_adder

    // START_SOLUTION

    wire c0, c1, c2, c3;

    half_adder ha1 ( a0, b0, q0, c0 );
    full_adder fa1 ( c0, a1, b1, q1, c1       );
    full_adder fa2 ( c1, a2, b2, q2, c2       );
    full_adder fa3 ( c2, a3, b3, q3, c3       );
    full_adder fa4 ( c3, a4, b4, q4, overflow );

    // END_SOLUTION

endmodule
