module hammingcode (
    input [3:0] data_in,   // Input 4-bit data to be encoded
    output reg [6:0] code_out, // Output 7-bit Hamming code
    output reg error           // Output error flag
);

    reg [6:0] hamming_code; // Internal register for the encoded Hamming code
    reg [2:0] syndrome;     // Syndrome bits to detect errors

    always @(data_in) begin
        // Calculate Hamming code
        hamming_code[0] = data_in[3];                       // D3
        hamming_code[1] = data_in[2];                       // D2
        hamming_code[2] = data_in[1];                       // D1
        hamming_code[4] = data_in[0];                       // D0

        hamming_code[6] = hamming_code[0] ^ hamming_code[2] ^ hamming_code[4]; // P1
        hamming_code[5] = hamming_code[0] ^ hamming_code[1] ^ hamming_code[4]; // P2
        hamming_code[3] = hamming_code[0] ^ hamming_code[1] ^ hamming_code[2]; // P4

        // Output encoded Hamming code
        code_out = hamming_code;
    end

    always @(*) begin
        // Syndrome calculation based on received code_out
        syndrome[0] = code_out[0] ^ code_out[2] ^ code_out[4] ^ code_out[6]; // S1
        syndrome[1] = code_out[1] ^ code_out[2] ^ code_out[5] ^ code_out[6]; // S2
        syndrome[2] = code_out[3] ^ code_out[4] ^ code_out[5] ^ code_out[6]; // S4

        // Error detected if any syndrome bit is 1
        error = |syndrome;
    end

endmodule

