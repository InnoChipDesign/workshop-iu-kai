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
    output [7:0] HEX5,
);

    wire eq_result;

    equality inst_equal
    (
        .a     ( SW[9:5]   ),
        .b     ( SW[4:0]   ),
        .equal ( eq_result ),
    );

    assign LEDR = { 10 { eq_result } };

endmodule
