//JK Flipflop using parameters
module jkff1(rst,clk,j,k,q,qb);
input rst,clk,j,k;
output reg q;
output qb;

parameter HOLD=2'b00;
parameter RESET=2'b01;
parameter SET=2'b10;
parameter TOGGLE=2'b11;


always@(posedge clk)
begin
	if(rst)
	q<=1'b0;
	else
		case({j,k})
			HOLD:q<=q;
			RESET:q<=1'b0;
			SET:q<=1'b1;
			TOGGLE:q<=~q;
		endcase
end

assign qb=~q;

endmodule
