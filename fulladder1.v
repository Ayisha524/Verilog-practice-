module full_adder(
input A,
input B,
input Cin,
output Sum,
output Cout);

assign Sum=A^B^Cin;
assign Cout=(A&B) | (Cin&(A^B));

endmodule 

//testbench
module full_adder_tb;
reg A,B,Cin;
wire Sum,Cout;

full_adder_uut(
.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
integer i;
initial begin
for(i=0;i<8;i=i+1)begin
{A,B,Cin}=i;
#10;
$display("%b %b %b | %b %b ",A,B,Cin,Sum,Cout);
end 
$finish;
endmodule