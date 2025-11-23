module adder (
    input  [4:0] a,
    input  [4:0] b,

    output [5:0] out
);
    assign out = a + b;
endmodule
