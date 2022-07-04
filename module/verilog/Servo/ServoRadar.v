`timescale 1ns / 1ps



module ServoRadar(clk, pwm, ctr);
input clk;
input [2:0]ctr;
output reg pwm;

reg [20:0]contador = 0;

always@(posedge clk)begin
	contador = contador + 1;
	if(contador =='d1_000_000) begin
	   contador = 0;
	end

	case(ctr)
		  3'b000:  pwm = (contador < 'd80_000) ? 1:0;

        3'b001:  pwm = (contador < 'd80_000) ? 1:0;

        3'b010:  pwm = (contador < 'd119_000) ? 1:0;

        3'b011:  pwm = (contador < 'd150_000) ? 1:0;

        3'b100:  pwm = (contador < 'd182_000) ? 1:0;

        3'b101:  pwm = (contador < 'd216_000) ? 1:0;

        3'b110:  pwm = (contador < 'd248_000) ? 1:0;

		  3'b111:  pwm = (contador < 'd275_000) ? 1:0;

        default: pwm = (contador < 'd275_000) ? 1:0;
    endcase

end
endmodule
