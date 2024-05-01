module pencoder_tb;

  reg enable;
  reg [7:0] data_in;
  wire [2:0] data_out;

 
  pencoder u0 (
    .enable(enable),
    .data_in(data_in),
    .data_out(data_out)
  );

 initial begin
    
    enable = 1;

    
    data_in = 8'b00000010; 

    
    $dumpfile("test_pencoder.vcd");
    $dumpvars(0, pencoder_tb); 

    
    #1000;

   $finish;
  end

endmodule

