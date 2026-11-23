//T flipflop using D flipflop
module tff2_dff1(rst,clk,t,q,qb);
input t,clk,rst;
output reg q;
output qb;
wire w1;

xor x1(w1,t,qb);

always@(posedge clk)
begin
if(rst)
q<=1'b0;
else
q<=w1;
end 

assign qb=~q;

endmodule
