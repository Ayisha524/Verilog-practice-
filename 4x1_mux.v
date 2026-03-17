module mux_4x1_array (
    input [3:0] I,     
    input [1:0] S,     
    output Y
);

assign Y = I[S];      

endmodule

`timescale 1ns/1ps

module tb_mux_4x1_array;

reg [3:0] I;
reg [1:0] S;
wire Y;

// Instantiate DUT
mux_4x1_array uut (
    .I(I),
    .S(S),
    .Y(Y)
);

initial begin
    $monitor("Time=%0t | I=%b S=%b | Y=%b", $time, I, S, Y);

    I = 4'b0000; S = 2'b00; #10;
    I = 4'b1010; S = 2'b00; #10;
    S = 2'b01; #10;
    S = 2'b10; #10;
    S = 2'b11; #10;

    I = 4'b1101; S = 2'b00; #10;
    S = 2'b01; #10;
    S = 2'b10; #10;
    S = 2'b11; #10;

    $finish;
end

endmodule