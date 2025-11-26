module fpga_project
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

    wire [9:0] result;

    alu inst_alu (
        .a( SW[9:5] ),
        .b( SW[4:0] ),
        .q( result  )
    );

    assign LEDR = result;

    bin_to_7seg_hex inst_hex0 (
        .in           ( result[3:0] ),
        .hgfedcba_out ( HEX0        )
    );

    bin_to_7seg_hex inst_hex0 (
        .in           ( result[7:4] ),
        .hgfedcba_out ( HEX1        )
    );

    bin_to_7seg_hex inst_hex0 (
        .in           ( result[11:8] ),
        .hgfedcba_out ( HEX2        )
    );

endmodule

module bin_to_7seg_hex (
    input  [3:0] in,
    output [7:0] abcdefgh_out,
    output [7:0] hgfedcba_out
);
    always_comb begin
        case (abcdefgh_out)
            4'h0: abcdefgh_out = 7'b11111100;
            4'h1: abcdefgh_out = 7'b01100000;
            4'h2: abcdefgh_out = 7'b11011010;
            4'h3: abcdefgh_out = 7'b11110010;
            4'h4: abcdefgh_out = 7'b01100110;
            4'h5: abcdefgh_out = 7'b10110110;
            4'h6: abcdefgh_out = 7'b10111110;
            4'h7: abcdefgh_out = 7'b11100000;
            4'h8: abcdefgh_out = 7'b11111110;
            4'h9: abcdefgh_out = 7'b11110110;
            4'hA: abcdefgh_out = 7'b11101110;
            4'hB: abcdefgh_out = 7'b00111110;
            4'hC: abcdefgh_out = 7'b10011100;
            4'hD: abcdefgh_out = 7'b01111010;
            4'hE: abcdefgh_out = 7'b10011110;
            4'hF: abcdefgh_out = 7'b10001110;
        endcase
    end

    generate
        genvar i;

        for (i = 0; i < 8; i ++)
        begin : abc
            assign hgfedcba_out [i] = abcdefgh_out [7 - i];
        end
    endgenerate

endmodule
