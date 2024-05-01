module decoder_tb;
reg  x,y,z;
wire f;

decoder u0(
 	.x(x),
 	.y(y),
 	.z(z),
 	.f(f)
 	);
 	
initial
 begin
 #10 x=0;
 #10 y=0;
 #10 z=0;
 #100 $finish;
 end
 initial
 begin
 
 $monitor($time,"x=%b,y=%b,z=%b,f=%b",x,y,z,f);
 #5 x=1;
 #5 y=1;
 #5 z=1;
 #5 x=0;
 #5 z=0;
 end
 endmodule
 
