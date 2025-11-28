module fpga_top
(
    input  [1:0] KEY,
    input  [9:0] SW,

    output [9:0] LEDR
);

    wire [1:0] key;
    assign key = ~ KEY;

    equality eq_inst
    (
        .a     ( SW[9:5] ),
        .b     ( SW[4:0] ),
        .equal ( LEDR[0] )
    );

endmodule
