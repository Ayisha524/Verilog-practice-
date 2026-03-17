module mux_2x1_behavioral (
    input I0, I1, S,
    output reg Y
);

always @(*) begin
    if (S == 0)
        Y = I0;
    else
        Y = I1;
end

endmodule

`timescale 1ns/1ps

module tb_mux_2x1;

reg I0, I1, S;
wire Y;

mux_2x1 uut (
    .I0(I0),
    .I1(I1),
    .S(S),
    .Y(Y)
);

initial begin
    $monitor("Time=%0t | I0=%b I1=%b S=%b | Y=%b",
              $time, I0, I1, S, Y);

    // Test cases
    I0=0; I1=0; S=0; #10;
    I0=0; I1=1; S=0; #10;
    I0=1; I1=0; S=0; #10;
    I0=1; I1=1; S=0; #10;

      $finish;
end

endmodule