//JK flipflop testbench using task.
module jkff1_tb;
reg  rst,clk,j,k;
wire q,qb;
parameter CYCLE=20;
integer i;

jkff1 jk(rst,clk,j,k,q,qb);

task reset;
begin
	rst=0;
	@(negedge clk);
	rst=1'b1;
	@(negedge clk);
	rst=1'b0;
end
endtask

always #(CYCLE/2)
begin
	clk=~clk;
end

task data_in(input [1:0]d);
begin
	@(negedge clk);
	{j,k}=d;
end
endtask

initial
begin
	clk=0;
	{j,k}=0;

	reset;
	
	$monitor("clk=%b,rst=%b,j=%b,k=%b,q=%b,qb=%b",clk,rst,j,k,q,qb);
	for(i=0;i<4;i=i+1)
	begin
		data_in(i);
		#20;
	end
	$finish;
end
endmodule
	
	
