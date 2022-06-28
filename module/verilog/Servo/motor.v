`timescale 1ns / 1ps

module motor(clk, servo);
input clk;
output servo;

wire c;
wire [2:0]sal;

div divisor(.clk(clk), .clkA(c));
contador contar(.clk(c), .salida(sal));
servo_radar giro(.clk(clk), .ctr(sal), .servo(servo));

endmodule
