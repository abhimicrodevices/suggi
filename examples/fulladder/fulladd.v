module fulladd(
 input a,
 input b,
 input c,
 output  reg sum,
 output  reg carry
 );
 always@(a or b or c)
 begin
  sum <= a ^ b ^ c;
  carry <= (a&b) | (b&c) | (c&a);
  end
  endmodule
