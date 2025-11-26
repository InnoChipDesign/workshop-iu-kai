module testbench;

  logic [4:0] a, b;

  wire        equal;

  equality inst_equal
    (.a (a), .b (b), .equal (equal));

  task test
    (
      input [4:0] t_a, t_b, 
      input       t_equal
    );

    { a, b } = { t_a, t_b };

    # 1;

    $display ("TEST %d == %d is %b", a, b, equal);

    if (equal !== t_equal)
      begin
        $display ("FAIL %s: EXPECTED %b, ACTUAL %b", `__FILE__, t_equal, equal);
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

    test (  0,  0,  1);

    test (  1,  2,  0);
    test (  2,  1,  0);
    test (  3,  5,  0);
    test (  0,  8,  0);

    test (  1,  1,  1);
    test (  3,  3,  1);
    test (  5,  5,  1);
    test ( 63, 63,  1);

    for (int a_i = 0; a_i < (1 << 2); a_i ++)
    for (int b_i = 0; b_i < (1 << 2); b_i ++)
      begin
          test ( a_i, b_i, a_i === b_i );
      end

    $display ("PASS %s", `__FILE__);
    $finish;
  end

endmodule
