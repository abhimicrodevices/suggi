module demux_tb;

  reg i0, i1, i2, i3, sel1, sel2;
  wire y; 
  demux u0 (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .sel1(sel1),
    .sel2(sel2),
    .y(y)
  );

  initial begin
    $dumpfile("test_demux.vcd");
    $dumpvars(0,demux_tb);

    #10;
    i0 = 1'b1; 
    i1 = 1'b0; 
    i2 = 1'b0; 
    i3 = 1'b0; 
    sel1 = 1'b0; 
    sel2 = 1'b0;
    
    #10;
    i0 = 1'b0; 
    i1 = 1'b1; 
    i2 = 1'b0; 
    i3 = 1'b0; 
    sel1 = 1'b0; 
    sel2 = 1'b1;
   
    #10
    i0 = 1'b0; 
    i1 = 1'b0; 
    i2 = 1'b1; 
    i3 = 1'b0; 
    sel1 = 1'b1; 
    sel2 = 1'b0;
    
    #10;
    i0 = 1'b0;
    i1 = 1'b0;
    i2 = 1'b0; 
    i3 = 1'b1; 
    sel1 = 1'b1;
    sel2 = 1'b1;
   

    #200 $finish;
  end

endmodule

