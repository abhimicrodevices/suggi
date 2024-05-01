module bitpos(
    input wire [7:0] binary_number,
    output reg [2:0] bit_position
);

    
    initial begin
        bit_position = 3'b000;
    end

   
    always @* begin
        case (binary_number)
            8'b00000001: bit_position = 3'b000; 
            8'b00000010: bit_position = 3'b001;
            8'b00000100: bit_position = 3'b010;
            8'b00001000: bit_position = 3'b011;
            8'b00010000: bit_position = 3'b100;
            8'b00100000: bit_position = 3'b101;
            8'b01000000: bit_position = 3'b110;
            8'b10000000: bit_position = 3'b111;
            
            
            default: bit_position = 3'b000;  
        endcase
    end

endmodule

