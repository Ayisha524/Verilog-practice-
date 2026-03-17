module half_subtractor (
    input A,
    input B,
    output Diff,
    output Borrow
);

assign Diff   = A ^ B;      
assign Borrow = ~A & B;     

endmodule

`timescale 1ns/1ps

module tb_half_subtractor;

reg A, B;
wire Diff, Borrow;

half_subtractor uut (
    .A(A),
    .B(B),
    .Diff(Diff),
    .Borrow(Borrow)
);

initial begin
   
    $monitor("Time=%0t | A=%b B=%b | Diff=%b Borrow=%b", $time, A, B, Diff, Borrow);

   
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    $finish;
end

endmodule