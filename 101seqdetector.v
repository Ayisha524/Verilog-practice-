module seq_detector_101(
input clk,
input rst,
input x,
output reg z);
reg [1:0] state,next_state;
parameter S0=2'b00,
          S1=2'b01,
          S2=2'b10;
always@(posedge clk)begin
   if(rst)
     state<=S0;
   else
     state<=next_state;
always@(*)begin
    case(state)
      S0:begin
        if(x)next_state=S1;
        else next_state=S0;
        z=0;
      end
      S1:begin
         if(x)next_state=S1;
         else next_state=S2;
         z=0;
      end
      S2:begin
         if(x) begin 
         next_state=S1;
         z=1;
         end
         else next_state=S0;
         z=0;
      end
    default begin
     next_state=S0;
     z=0;
     end 
endcase
endmodule
`timescale 1ns/1ps

module tb_seq_detector_101;

    reg clk;
    reg rst;
    reg x;
    wire z;

    // Instantiate DUT
    seq_detector_101 uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .z(z)
    );

    
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        x = 0;

        #10 rst = 0;

        
        #10 x = 1;
        #10 x = 0;
        #10 x = 1; 
        #10 x = 0;
        #10 x = 1; 

        #20;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | x=%b | z=%b", $time, x, z);
    end

endmodule
     
          