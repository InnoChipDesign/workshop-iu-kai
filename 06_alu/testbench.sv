module testbench;

    logic [4:0] a, b;
    logic [1:0] opcode;

    wire  [4:0] result;
    wire        overflow;
    wire        illegal_operation;

    alu alu_inst
    (
        .a                 ( a                 ),
        .b                 ( b                 ),
        .opcode            ( opcode            ),
        .result            ( result            ),
        .overflow          ( overflow          ),
        .illegal_operation ( illegal_operation )
    );
    
    logic [4:0] expected_result;
    logic       expected_overflow;
    logic       expected_ill_op;

    task test
    (
        input [4:0] t_a, t_b,
        input [1:0] t_opcode
    );

    { a, b, opcode } = { t_a, t_b, t_opcode };

    # 1;

    expected_result = (
        t_opcode === 2'b00 ? (t_a +   t_b) :
        t_opcode === 2'b01 ? (t_a === t_b) :
        t_opcode === 2'b10 ? (t_a *   t_b) :
        '1
    );
    expected_overflow = (
        t_opcode === 2'b00 ? expected_result < (32' (t_a) + 32' (t_b)) :
        t_opcode === 2'b10 ? expected_result < (32' (t_a) * 32' (t_b)) :
        '0
    );
    expected_ill_op = t_opcode === 2'b11;

    if (opcode === 2'b00)
        $display ("TEST %d +  %d = %d (%b)", a, b, result, result);
    else if (opcode === 2'b01)
        $display ("TEST %d == %d = %d (%b)", a, b, result, result);
    else if (opcode === 2'b10)
        $display ("TEST %d *  %d = %d (%b)", a, b, result, result);
    else
        $display ("TEST %d xx %d = %d (%b)", a, b, result, result);

    if (overflow !== expected_overflow)
    begin
        $display ("FAIL %s: Overflow error EXPECTED %b, ACTUAL %b", `__FILE__, expected_overflow, overflow);
        $finish;
    end
    else if (illegal_operation !== expected_ill_op)
    begin
        $display ("FAIL %s: Illegal Op error EXPECTED %b, ACTUAL %b", `__FILE__, expected_ill_op, illegal_operation);
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

    test (  0,  0,  1);

    test (  1,  2,  0);
    test (  2,  1,  0);
    test (  3,  5,  0);
    test (  0,  8,  0);

    test (  1,  1,  1);
    test (  3,  3,  1);
    test (  5,  5,  1);
    test ( 63, 63,  1);

    $display ("Тест с перебором аргументов сложения:");
    for (int a_i = 0; a_i < (1 << 2); a_i ++)
    for (int b_i = 0; b_i < (1 << 2); b_i ++)
        begin
            test ( a_i, b_i, 2'b00 );
        end

    $display ("Тест с перебором аргументов сравнения:");
    for (int a_i = 0; a_i < (1 << 2); a_i ++)
    for (int b_i = 0; b_i < (1 << 2); b_i ++)
        begin
            test ( a_i, b_i, 2'b01 );
        end
    
    $display ("Тест с перебором аргументов умножения:");
    for (int a_i = 0; a_i < (1 << 2); a_i ++)
    for (int b_i = 0; b_i < (1 << 2); b_i ++)
        begin
            test ( a_i, b_i, 2'b10 );
        end
    
    $display ("Тест с перебором аргументов некорректной операции:");
    for (int a_i = 0; a_i < (1 << 2); a_i ++)
    for (int b_i = 0; b_i < (1 << 2); b_i ++)
        begin
            test ( a_i, b_i, 2'b11 );
        end
    
    $display ("Тест с рандомизированными аргументами");
    for (int i = 0; i < 100; i ++)
        begin
            test ( 5' ($urandom()), 5' ($urandom()), 2' ($urandom()));
        end

    $display ("PASS %s", `__FILE__);
    $finish;
    end

endmodule
