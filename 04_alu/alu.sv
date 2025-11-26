module alu
(
    input  [4:0] a,
    input  [4:0] b,

    input  [1:0] opcode,

    output [4:0] result,
    output       overflow,
    output       illegal_operation // Illegal OpCode
);

endmodule
