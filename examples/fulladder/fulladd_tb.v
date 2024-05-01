module fulladd_tb;
 	reg a;
 	reg b;
 	reg c;
 	wire sum;
	wire carry;
 
 fulladd u0(
 	.a(a),
 	.b(b),
 	.c(c),
 	.sum(sum),
 	.carry(carry)
 	);
 	
 initial begin
 $dumpfile("test_fulladd.vcd");
 $dumpvars(0,fulladd_tb);
  #10 a=0;b=0;c=0;
  #10 a=0;b=0;c=1;
  #10 a=0;b=1;c=0;
  #10 a=0;b=1;c=1;
  #10 a=1;b=0;c=0;
  #10 a=1;b=0;c=1;
  #10 a=1;b=1;c=0;
  #10 a=1;b=1;c=1;
  #100 $finish;
  end
  endmodule
 
