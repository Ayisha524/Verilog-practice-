module full_subtractor (
    input A,
    input B,
    input Bin,        
    output Diff,
    output Bout       
);


assign Diff = A ^ B ^ Bin;

assign Bout = (~A & B) | (~A & Bin) | (B & Bin);

endmodule

`timescale 1ns/1ps

module tb_full_subtractor;

reg A, B, Bin;
wire Diff, Bout;

full_subtractor uut (
    .A(A),
    .B(B),
    .Bin(Bin),
    .Diff(Diff),
    .Bout(Bout)
);

initial begin
    $monitor("Time=%0t | A=%b B=%b Bin=%b | Diff=%b Bout=%b",
              $time, A, B, Bin, Diff, Bout);

   
    A=0; B=0; Bin=0; #10;
    A=0; B=0; Bin=1; #10;
    A=0; B=1; Bin=0; #10;
    A=0; B=1; Bin=1; #10;
    A=1; B=0; Bin=0; #10;
    A=1; B=0; Bin=1; #10;
    A=1; B=1; Bin=0; #10;
    A=1; B=1; Bin=1; #10;

    $finish;
end

endmodule