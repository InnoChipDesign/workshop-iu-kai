module alu
(
    input  [4:0] a,
    input  [4:0] b,

    input  [1:0] opcode,

    output [4:0] result,
    output       overflow,
    output       illegal_operation // Illegal OpCode
);

    // Задание:
    // Реализовать модуль АЛУ используя модули adder, equality, multiplier и mux_4to1_5bit

    // START_SOLUTION

    wire [4:0] result_add, result_mult, res_equal5bit;
    wire       result_equal;
    wire       overflow_add, overflow_mult, result_overflow;

    adder_5bit inst_add5bit (a, b, overflow_add,  result_add   );
    equality   inst_equal   (a, b,                result_equal );
    multiplier inst_mult    (a, b, overflow_mult, result_mult  );

    assign overflow          = (opcode == 2'b00 & overflow_add) | (opcode == 2'b10 & overflow_mult);
    assign illegal_operation = opcode == 2'b11;
    assign res_equal5bit     = { 4'b0, result_equal };

    mux_4to1_5bit inst_mux
    (
        .in0    ( result_add    ),
        .in1    ( res_equal5bit ),
        .in2    ( result_mult   ),
        .in3    ( '1            ),
        .select ( opcode        ),
        .result ( result        )
    );

    // END_SOLUTION

endmodule

// START_SOLUTION
module adder_5bit
(
    input  [4:0] a,
    input  [4:0] b,

    output       overflow,
    output [4:0] result
);

    adder inst_adder
    (
        a[4], a[3], a[2], a[1], a[0],
        b[4], b[3], b[2], b[1], b[0],

        overflow,
        result[4], result[3], result[2], result[1], result[0]
    );

endmodule
// END_SOLUTION
