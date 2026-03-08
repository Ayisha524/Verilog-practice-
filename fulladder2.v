module half_adder(input a,b,output sum,carry);
assign sum=a^b;
assign carry=a&b;
endmodule 
 
module full_adder(
input A,B,Cin,
output Sum ,Cout);

wire s1,c1,c2;

half_adder_HA1(A,B,s1,c1);
half_adder_HA2(Cin,s1,Sum,c2);

assign Cout=c1|c2;

endmodule 

//testbench

module tb_full_adder;
    reg A, B, Cin;
    wire Sum, Cout;

    full_adder uut (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout)
    );

    // 3. Stimulus generation
    integer i;
    initial begin        
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i;
            #10;             
            $display("%b %b %b   | %b   %b", A, B, Cin, Sum, Cout);
        end
        
        $finish; 
    end
endmodule