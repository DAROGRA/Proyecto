`timescale 1ns / 1ps

module contador(clk, salida);
input clk; 
output reg [2:0]salida;


always@(posedge clk) begin
	if(clk)
		salida <= salida + 1;
		else
				salida <= 0;
end
endmodule
