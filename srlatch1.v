//This is a simple SR latch using NOR gates
module srlatch1(s,r,q,qb);
	input s,r;
	output q,qb;

	nor n1(q,r,qb);
	nor n2(qb,s,q);

endmodule
