module forloop_tb;
    reg [6:0] data;
    reg gen_check;
    reg [2:0] crc_in;
    wire [2:0] crc_out;
    wire crc_error;

    forloop u0 (
        .data_in(data),
        .gen_check(gen_check),
        .crc_in(crc_in),
        .crc_out(crc_out),
        .crc_error(error)
    );

    initial begin
        data = 7'b1011000;
        gen_check = 1;  
        crc_in = 3'b000;  
        $dumpfile("test_forloop.vcd");
        $dumpvars(0,forloop_tb);
       
        #10
        gen_check = 0;  
        crc_in = crc_out; 
        #10;
        

        crc_in[0] = ~crc_in[0];
        #100 $finish;
  

       
    end
endmodule

