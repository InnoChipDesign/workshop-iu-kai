module fpga_top
(
    input  [1:0] KEY,
    input  [9:0] SW,

    output [9:0] LEDR
);

    wire [1:0] key;
    assign key = ~ KEY;

    wire [4:0] a, b;
    wire [4:0] result;
    wire       overflow;

    assign a         = SW[9:5];
    assign b         = SW[4:0];
    assign LEDR[4:0] = result;
    assign LEDR[6]   = overflow;

    adder inst_adder
    (
        .a4 ( a[4] ),
        .a3 ( a[3] ),
        .a2 ( a[2] ),
        .a1 ( a[1] ),
        .a0 ( a[0] ), 
        .b4 ( b[4] ),
        .b3 ( b[3] ),
        .b2 ( b[2] ),
        .b1 ( b[1] ),
        .b0 ( b[0] ),
        .overflow (overflow),
        .q4 ( result[4] ),
        .q3 ( result[3] ),
        .q2 ( result[2] ),
        .q1 ( result[1] ),
        .q0 ( result[0] )
    );

endmodule
