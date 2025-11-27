module fpga_top
(
    input  [1:0] KEY,
    input  [9:0] SW,

    output [9:0] LEDR
);

    alu inst_alu
    (
        .a                 ( SW[9:5]   ),
        .b                 ( SW[4:0]   ),
        .opcode            ( KEY       ),
        .result            ( LEDR[4:0] ),
        .overflow          ( LEDR[6]   ),
        .illegal_operation ( LEDR[9]   )
    );

endmodule
