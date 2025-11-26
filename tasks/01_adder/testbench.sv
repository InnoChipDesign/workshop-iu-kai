module testbench;

    logic [4:0] a, b;
    wire  [5:0] sum;

    wire a4, a3, a2, a1, a0;
    wire b4, b3, b2, b1, b0;
    wire q5, q4, q3, q2, q1, q0;

    adder inst_adder
    (
        .a4 ( a4 ), .a3 ( a3 ), .a2 ( a2 ), .a1 ( a1 ), .a0 ( a0 ),
        .b4 ( b4 ), .b3 ( b3 ), .b2 ( b2 ), .b1 ( b1 ), .b0 ( b0 ),

        .overflow ( ),
        .q4 ( q4 ), .q3 ( q3 ), .q2 ( q2 ), .q1 ( q1 ), .q0 ( q0 )
    );

    assign { a4, a3, a2, a1, a0 } = a;
    assign { b4, b3, b2, b1, b0 } = b;

    assign sum = { q5, q4, q3, q2, q1, q0 };

    task test
    (
        input [4:0] t_a, t_b, t_sum,
        input       overflow
    );

        { a, b } = { t_a, t_b };

        # 1;

        $display ("TEST %d + %d = %d", a, b, sum);

        if (sum !== t_sum)
        begin
            $display ("FAIL %s: EXPECTED sum %d, ACTUAL sum %d", `__FILE__, t_sum, sum);
            $finish;
        end

    endtask

    initial
    begin
        `ifdef __ICARUS__
            // Uncomment the following line
            // to generate a VCD file and analyze it using GTKwave

            // $dumpvars;
        `endif

        for (int a_i = 0; a_i < (1 << 2); a_i ++)
        for (int b_i = 0; b_i < (1 << 2); b_i ++)
        begin
            test ( a_i, b_i );
        end

        $display ("PASS %s", `__FILE__);
        $finish;
    end

endmodule
