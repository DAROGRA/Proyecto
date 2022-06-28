`timescale 1ns / 1ps



module servo_radar(clk, servo, ctr);
input clk;
input [2:0]ctr;	
output reg servo;

reg [20:0]contador = 0;

always@(posedge clk)begin
	contador = contador + 1;
	if(contador =='d1_000_000) begin 
	   contador = 0;
	end
	
	case(ctr)
		  3'b000:  servo = (contador < 'd80_000) ? 1:0;
        
        3'b001:  servo = (contador < 'd80_000) ? 1:0;
        
        3'b010:  servo = (contador < 'd119_000) ? 1:0;
		  
        3'b011:  servo = (contador < 'd150_000) ? 1:0;
        
        3'b100:  servo = (contador < 'd182_000) ? 1:0;
        
        3'b101:  servo = (contador < 'd216_000) ? 1:0;
		  
        3'b110:  servo = (contador < 'd248_000) ? 1:0;
		  
		  3'b111:  servo = (contador < 'd275_000) ? 1:0;
        
        default: servo = (contador < 'd275_000) ? 1:0;
    endcase

end
endmodule