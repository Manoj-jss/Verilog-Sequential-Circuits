//Test bench of SR latch
module srlatch1_tb;
reg s,r;
wire q,qb;
integer i;

srlatch1 sr(s,r,q,qb);

task initalize;
begin
	{s,r}=0;
end
endtask

task data_in(input [1:0]a);
begin
	{s,r}=a;
end
endtask

initial 
	begin
		initalize;
		//output 
		$monitor("S=%b,R=%b,Q=%b,Qb=%b",s,r,q,qb);
		//for data in
		for(i=0;i<4;i=i+1)
		begin
			data_in(i);
			#10;
		end
		$finish;
	end
	
endmodule
