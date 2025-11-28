module testbench;

    logic [4:0] a, b;

    wire  [4:0] result;
    wire        overflow;

    multiplier mult_inst
    (
        .a        ( a        ),
        .b        ( b        ),
        .out      ( result   ),
        .overflow ( overflow )
    );
    
    logic [4:0] expected_result;
    logic       expected_overflow;

    task test
    (
        input [4:0] t_a, t_b
    );

    { a, b } = { t_a, t_b };

    # 1;

    expected_result   = t_a * t_b;
    expected_overflow = expected_result < (32' (t_a) * 32' (t_b));

    $display ("TEST %d * %d = %d (%b) (overflow %b)", a, b, result, result, overflow);

    if (overflow !== expected_overflow)
    begin
        $display ("FAIL %s: Overflow error EXPECTED %b, ACTUAL %b", `__FILE__, expected_overflow, overflow);
        $finish;
    end
    else if (result !== expected_result)
    begin
        $display ("FAIL %s: EXPECTED %d (%b), ACTUAL %d (%b)", `__FILE__, expected_result, expected_result, result, result);
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

    test (  0,  0 );

    test (  1,  2 );
    test (  2,  1 );
    test (  3,  5 );
    test (  0,  8 );

    test (  1,  1 );
    test (  3,  3 );
    test (  5,  5 );
    test ( 63, 63 );
    
    $display;
    $display ("Тест с перебором аргументов умножения:");
    for (int a_i = 0; a_i < (1 << 2); a_i ++)
    for (int b_i = 0; b_i < (1 << 2); b_i ++)
        begin
            test ( a_i, b_i );
        end

    $display;
    $display ("Тест с рандомизированными аргументами");
    for (int i = 0; i < 100; i ++)
        begin
            test ( 5' ($urandom()), 5' ($urandom()) );
        end

    $display ("PASS %s", `__FILE__);
    $finish;
    end

endmodule
