module testbench;

    logic a, b;

    wire  q;
    wire  carry_out;

    half_adder ha_inst
    (
        .a         ( a         ),
        .b         ( b         ),
        .q         ( q         ),
        .carry_out ( carry_out )
    );
    
    logic expected_q;
    logic expected_carry_out;

    task test
    (
        input t_a, t_b
    );

    { a, b } = { t_a, t_b };

    # 1;

    { expected_carry_out, expected_q } = t_a + t_b;

    $display ("TEST %d + %d = %b", a, b, { carry_out, q });

    if (carry_out !== expected_carry_out)
    begin
        $display ("FAIL %s: carry_out error EXPECTED %b, ACTUAL %b", `__FILE__, expected_carry_out, carry_out);
        $finish;
    end
    else if (q !== expected_q)
    begin
        $display ("FAIL %s: q EXPECTED %d, ACTUAL %d", `__FILE__, expected_q, q);
        $finish;
    end

    endtask

    initial
    begin
    `ifdef __ICARUS__
            // Раскомментируйте строку ниже для генерации VCD файла,
            // который можно открыть в Surfer или GTKwave для анализа временной диаграммы

            // $dumpvars;
    `endif

    test ( 0, 0 );
    test ( 0, 1 );
    test ( 1, 0 );
    test ( 1, 1 );

    $display ("PASS %s", `__FILE__);
    $finish;
    end

endmodule
