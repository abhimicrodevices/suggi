module bitpos_tb;

    reg [7:0] binary_number;
    wire [2:0] bit_position;

    
    bitpos u0(
        .binary_number(binary_number),
        .bit_position(bit_position)
    );

    
    initial begin
        
        $dumpfile("test_bitpos.vcd");
        $dumpvars(0, bitpos_tb);

        
        binary_number = 8'b00000001; 
        #5 binary_number = 8'b00000010;
        #5 binary_number = 8'b00000100; 
        #5 binary_number = 8'b00001000; 
        
        #100 $finish;
    end

endmodule

