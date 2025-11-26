module equality
(
    input  [4:0] a,
    input  [4:0] b,

    output       equal
);

    // Задание:
    // Реализовать модуль 5-ти битного сравнения на равенство

    assign equal = & ( a ~^ b );

endmodule
