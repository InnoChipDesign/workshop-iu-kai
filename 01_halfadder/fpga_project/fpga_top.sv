module fpga_top
(
    input  [1:0] KEY,
    input  [9:0] SW,

    output [9:0] LEDR
);

    wire [1:0] key;
    assign key = ~ KEY;

    half_adder inst_ha
    (
        .a         ( SW[0]   ),
        .b         ( SW[1]   ),
        .q         ( LEDR[0] ),
        .carry_out ( LEDR[1] )
    );

endmodule
