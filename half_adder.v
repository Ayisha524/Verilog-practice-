module half_adder(
input a,
input b,
output sum,
output carry);
assign sum=a^b;
assign carry=a&b;
endmodule

//testbench
module half_adder_tb;
reg a,b;
wire sum,carry;
half_adder_uut(.a(a),.b(b),.sum(sum),.carry(carry));
initial begin
    A = 0; B = 0;
    #10;

    A = 0; B = 1;
    #10;

    A = 1; B = 0;
    #10;

    A = 1; B = 1;
    #10;
 $finish;
end
endmodule 

