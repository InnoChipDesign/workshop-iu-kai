module multiplier
(
    input  [4:0] a,
    input  [4:0] b,

    output       overflow,
    output [4:0] out
);

    // Задание:
    // Реализовать модуль 5-ти битного умножителя с флагом переполнения

    // START_SOLUTION

    logic [4:0] and_res0, and_res1, and_res2, and_res3, and_res4;

    logic [9:0] ires0, ires1, ires2, ires3, ires4;

    logic [9:0] result;

    always_comb
    begin
        and_res0 = a & { 5 { b[0] }};
        and_res1 = a & { 5 { b[1] }};
        and_res2 = a & { 5 { b[2] }};
        and_res3 = a & { 5 { b[3] }};
        and_res4 = a & { 5 { b[4] }};

        ires0 = { 4'b0, and_res0       };
        ires1 = { 3'b0, and_res1, 1'b0 };
        ires2 = { 2'b0, and_res2, 2'b0 };
        ires3 = { 1'b0, and_res3, 3'b0 };       
        ires4 = {       and_res4, 4'b0 };

        result = ires0 + ires1 + ires2 + ires3 + ires4;
    end

    assign overflow = | ( result[9:5] );
    assign out      =     result[4:0];

    // END_SOLUTION

endmodule
