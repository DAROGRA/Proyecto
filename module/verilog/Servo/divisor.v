`timescale 1ns / 1ps

module div(clk, clkA);
input clk; 
output reg clkA; 

reg [26:0]counter;
 always @(posedge clk)begin
        counter <= counter + 26'b1;
        if(counter>=10000000)begin
            counter <= 26'b0;
            clkA=!clkA;
        end
    end 
endmodule