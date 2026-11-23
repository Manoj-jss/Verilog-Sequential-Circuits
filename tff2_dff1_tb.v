//T flipflop using D flipflop's testbench
module tff2_dff1_tb;
	reg t,clk,rst;
	wire q,qb;
	
	tff2_dff1 uut(rst,clk,t,q,qb);
	
	always 
	begin
		#5 clk=~clk;
	end
	
	task reset;
	begin
		rst=0;
		@(negedge clk);
		rst=1'b1;
		@(negedge clk);
		rst=1'b0;
	end
	endtask
	
	initial 
		begin
			$monitor("clk=%b,rst=%b,t=%b,q=%b,qb=%b",clk,rst,t,q,qb);
			
			reset;
			
			t=1'b0;#10;
			t=1'b1;#10;
			$finish;
		end
endmodule
			
