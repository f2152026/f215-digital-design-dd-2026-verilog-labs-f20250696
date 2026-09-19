module tb;

  reg  [1:0] A, B;
  wire       GT, LT, EQ;

  integer a, b;
  integer errors;

  comp2 DUT (
    .A  (A),
    .B  (B),
    .GT (GT),
    .LT (LT),
    .EQ (EQ)
  );

  initial begin
    errors = 0;

    for (a = 0; a < 4; a = a + 1) begin
      for (b = 0; b < 4; b = b + 1) begin
        A = a;
        B = b;
        #1;

        if ((GT + LT + EQ) != 1) begin
          $display("FAIL: A=%0d B=%0d | GT=%b LT=%b EQ=%b",
                   A, B, GT, LT, EQ);
          errors = errors + 1;
        end
      end
    end

    if (errors == 0)
      $display("PASS: all 16 combinations passed");
    else
      $display("FAIL: %0d error(s)", errors);

    $finish;
  end

endmodule