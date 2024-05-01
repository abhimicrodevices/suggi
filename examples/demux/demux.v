module demux(
 	input  i0,
 	input  i1,
 	input  i2,
 	input  i3,
 	input sel1,
 	input  sel2,
 	output reg y
 	);
 always @(i0 or i1 or i2 or i3 or sel1 or sel2)
 begin
  	case({sel1,sel2})
  	2'b00:
  	y <= i0;
  	2'b01:
  	y <= i1;
  	2'b10:
  	y <=i2;
  	2'b11:
  	y <= i3;
  	default: y <= 1'bx;
  endcase
  end
 endmodule
 	 
