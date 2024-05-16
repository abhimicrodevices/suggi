module srff_tb;
  reg clk;
  reg s;
  reg r;
  wire q;
  
  srff u0 (
    .clk(clk),
    .s(s),
    .r(r),
    .q(q)
  );


  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("test_srff.vcd");
    $dumpvars(0, srff_tb);
   
    clk = 0;
    s = 0;
    r = 0;
   
    #20;
    #10;
    s = 0; 
    r = 1;
    #10;
   s = 1; 
   r = 0;
    #10;
    s = 0; 
    r = 0;
  #100 $finish;
  end
endmodule

