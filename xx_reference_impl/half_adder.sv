module half_adder
(
    input  a,
    input  b,

    output q,
    output carry_out
);

    // Задание:
    // Реализовать модуль полусумматора используя логические элементы (or, and, xor, not, и т.д.)

    xor(q, a, b);
    
    and(carry_out, a, b);

endmodule
