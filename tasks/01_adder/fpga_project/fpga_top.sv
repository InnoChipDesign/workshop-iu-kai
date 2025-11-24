module fpga_top
(
    input  [1:0] KEY,
    input  [9:0] SW,

    output [9:0] LEDR
);

    adder inst_adder (
        .a4( SW[9]   ),
        .a3( SW[8]   ),
        .a2( SW[7]   ),
        .a1( SW[6]   ),
        .a0( SW[5]   ),
        .b4( SW[4]   ),
        .b3( SW[3]   ),
        .b2( SW[2]   ),
        .b1( SW[1]   ),
        .b0( SW[0]   ),
        .q5( LEDR[5] ),
        .q4( LEDR[4] ),
        .q3( LEDR[3] ),
        .q2( LEDR[2] ),
        .q1( LEDR[1] ),
        .q0( LEDR[0] )
    );

endmodule
