module decoder(
input x,y,z,
output reg f,
 output reg[3:0] r1,r2
);
task decoder;
	input p,q,enable;
	output d0,d1,d2,d3;
	begin 
		if(enable==0)
		 {d3,d2,d1,d0} =4'b1111;
		 else
		 begin
		 case({p,q})
		 	2'b00:{d3,d2,d1,d0}=4'b1110;
		 	2'b01:{d3,d2,d1,d0}=4'b1101;
		 	2'b10:{d3,d2,d1,d0}=4'b1011;
		 	2'b11:{d3,d2,d1,d0}=4'b0111;
		 	default:{d3,d2,d1,d0}=4'b1111;
		 	endcase
		 end
	end
endtask

task nandgate;
	input w,x,y,z;
	output f;
	begin
	if(!w || !x || !y || !z)
		f=1;
		else
		f=0;
	end
endtask
 always@(x,y,z)
 begin
 	decoder(y,z,~x,r1[0],r1[1],r1[2],r1[3]);
 	decoder(y,z,x,r2[0],r2[1],r2[2],r2[3]);
 	nandgate(r1[1],r1[3],r2[0],r2[2],f);
end
endmodule
