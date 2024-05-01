module encoder_tb;
    reg [1:0] din;
    reg en;
    wire [3:0] dout;

    encoder u0 (
        .din(din),
        .en(en),
        .dout(dout)
    );

    initial begin
        $dumpfile("test_encoder.vcd");
        $dumpvars(0,encoder_tb);
  
        #10 din = 2'b00; en = 1'b1;
        #10 din = 2'b01; en = 1'b1;
        #10 din = 2'b10; en = 1'b1;
        #10 din = 2'b11; en = 1'b1;

        #100 $finish;
    end
endmodule

 
