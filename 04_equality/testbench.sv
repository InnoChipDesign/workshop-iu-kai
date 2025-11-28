module testbench;

    logic [4:0] a, b;

    wire result;

    equality eq_inst
    (
        .a     ( a                 ),
        .b     ( b                 ),
        .equal ( result            )
    );
    
    logic expected_result;

    task test
    (
        input [4:0] t_a, t_b
    );

    { a, b } = { t_a, t_b };

    # 1;

    expected_result = t_a === t_b;

    $display ("TEST %d == %d = %d", a, b, result);
    
    if (result !== expected_result)
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

    test (  0,  0);

    test (  1,  2);
    test (  2,  1);
    test (  3,  5);
    test (  0,  8);

    test (  1,  1);
    test (  3,  3);
    test (  5,  5);
    test ( 63, 63);

    $display ("Тест с перебором аргументов:");
    for (int a_i = 0; a_i < (1 << 2); a_i ++)
    for (int b_i = 0; b_i < (1 << 2); b_i ++)
        begin
            test ( a_i, b_i );
        end

    $display ("PASS %s", `__FILE__);
    $finish;
    end

endmodule
