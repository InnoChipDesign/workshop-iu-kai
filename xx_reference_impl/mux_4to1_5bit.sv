module mux_4to1_5bit
(
    input  [4:0] in0,
    input  [4:0] in1,
    input  [4:0] in2,
    input  [4:0] in3,

    input  [1:0] select,

    output logic [4:0] result
);

    // Задание:
    // Реализовать модуль 5-ти битного мультиплексора 4-в-1

    // START_SOLUTION

    always_comb
    begin
        case (select)
            2'd0: result = in0;
            2'd1: result = in1;
            2'd2: result = in2;
            2'd3: result = in3;
        endcase
    end
    
    // END_SOLUTION

endmodule
