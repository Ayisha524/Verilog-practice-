module mux_4x1_case (
    input I0, I1, I2, I3,
    input [1:0] S,
    output reg Y
);

always @(*) begin
    case (S)
        2'b00: Y = I0;
        2'b01: Y = I1;
        2'b10: Y = I2;
        2'b11: Y = I3;
        default: Y = 1'b0;
    endcase
end

endmodule
`timescale 1ns/1ps

module tb_mux_4x1_case;

reg I0, I1, I2, I3;
reg [1:0] S;
wire Y;

// Instantiate DUT
mux_4x1_case uut (
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .S(S),
    .Y(Y)
);

initial begin
    $monitor("Time=%0t | I=%b%b%b%b S=%b | Y=%b",
              $time, I3, I2, I1, I0, S, Y);

    
    I0=0; I1=1; I2=0; I3=1;

    S=2'b00; #10;
    S=2'b01; #10;
    S=2'b10; #10;
    S=2'b11; #10;

    I0=1; I1=0; I2=1; I3=0;

    S=2'b00; #10;
    S=2'b01; #10;
    S=2'b10; #10;
    S=2'b11; #10;

    $finish;
end

endmodule