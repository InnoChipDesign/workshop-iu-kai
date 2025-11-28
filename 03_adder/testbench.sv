module testbench;

    logic [4:0] a, b;
    logic [1:0] opcode;

    wire  [4:0] result;
    wire        overflow;

    adder adder_inst
    (
        .a4 ( a[4] ),
        .a3 ( a[3] ),
        .a2 ( a[2] ),
        .a1 ( a[1] ),
        .a0 ( a[0] ), 
        .b4 ( b[4] ),
        .b3 ( b[3] ),
        .b2 ( b[2] ),
        .b1 ( b[1] ),
        .b0 ( b[0] ),
        .overflow (overflow),
        .q4 ( result[4] ),
        .q3 ( result[3] ),
        .q2 ( result[2] ),
        .q1 ( result[1] ),
        .q0 ( result[0] )
    );
    
    logic [4:0] expected_result;
    logic       expected_overflow;

    task test
    (
        input [4:0] t_a, t_b
    );

    { a, b } = { t_a, t_b };

    # 1;

    expected_result   = t_a + t_b;
    expected_overflow = expected_result < (32' (t_a) + 32' (t_b));

    $display ("TEST %d + %d = %d (%b)", a, b, result, result);

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
