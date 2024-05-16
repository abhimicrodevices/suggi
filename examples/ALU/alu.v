module alu(
input [3:0]a,b,
input[1:0]sel,
output reg[7:0]z
);
function [7:0] add;
	input[3:0] a,b;
	begin 
	 add =a+b;
	 end
endfunction

function [7:0] sub;
 	input [3:0] a,b;
 	begin 
 	 sub =a-b;
 	 end
 endfunction
 
 function [7:0] mul;
 	input[3:0] a,b;
 	begin
 	mul =a*b;
 	end
 endfunction
 
 function[7:0] exor;
 	 input [3:0] a,b;
 	 integer i;
 	 begin
 	 for (i=0;i<=4;i=i+1)
 	 exor=a[i]^b[i];
 	 exor[7:4]=4'b0000;
 	 end
 endfunction
 
 always@(a,b,sel)
 	case(sel)
 	2'b00:
 	z=add(a,b);
 	2'b01:
 	z=sub(a,b);
 	2'b10:
 	z=mul(a,b);
 	2'b11:
 	z=exor(a,b);
 	default:
 	z=8'b00000000;
 	endcase
 endmodule
 	
