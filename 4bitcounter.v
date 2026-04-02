module up_counter_4bit (
    input clk,
    input rst,
    input en,
    output reg [3:0] count
);

always @(posedge clk) begin
    if (rst)
        count <= 4'b0000;     
    else if (en)
        count <= count + 1;  
    else
        count <= count;       
end

endmodule
`timescale 1ns/1ps

module tb_up_counter_4bit;

    reg clk;
    reg rst;
    reg en;
    wire [3:0] count;

    
    up_counter_4bit uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(count)
    );

    
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        rst = 1;
        en  = 0;

        
        #10 rst = 0;

        
        #10 en = 1;

        
        #50;

        
        en = 0;
        #20;

        
        en = 1;
        #30;

        
        rst = 1;
        #10 rst = 0;

        #30;

        
        $finish;
    end

    
    initial begin
        $monitor("Time = %0t | rst = %b | en = %b | count = %b", 
                  $time, rst, en, count);
    end

endmodule
//synchronous up counter