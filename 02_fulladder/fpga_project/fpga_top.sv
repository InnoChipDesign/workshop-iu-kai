module fpga_top
(
    input  [1:0] KEY,
    input  [9:0] SW,

    output [9:0] LEDR
);

    wire [1:0] key;
    assign key = ~ KEY;

    full_adder inst_fa
    (
        .carry_in  ( SW[2]   ),
        .a         ( SW[0]   ),
        .b         ( SW[1]   ),
        .q         ( LEDR[0] ),
        .carry_out ( LEDR[1] )
    );

endmodule
