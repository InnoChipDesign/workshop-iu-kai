module fpga_top
(
    input  [1:0] KEY,
    input  [9:0] SW,

    output [9:0] LEDR,

    output [7:0] HEX0,
    output [7:0] HEX1,
    output [7:0] HEX2,
    output [7:0] HEX3,
    output [7:0] HEX4,
    output [7:0] HEX5
);

    wire [1:0] key;
    assign key = ~ KEY;

    assign { HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 } = '1;

    multiplier inst_mult
    (
        .a        ( SW[9:5]   ),
        .b        ( SW[4:0]   ),
        .out      ( LEDR[4:0] ),
        .overflow ( LEDR[6]   )
    );

endmodule
