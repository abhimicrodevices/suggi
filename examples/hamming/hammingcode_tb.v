module hammingcode_tb;

    // Inputs
    reg [3:0] data_in;

    // Outputs
    wire [6:0] code_out;
    wire error;

    // Instantiate the module under test (uut)
    hammingcode uut (
        .data_in(data_in),
        .code_out(code_out),
        .error(error)
    );

    // Testbench code
    initial begin
        // Initialize inputs and monitor outputs
        $monitor("Time=%0t data_in=%b code_out=%b error=%b", $time, data_in, code_out, error);

        // Test cases
        data_in = 4'b0000; #10;
        $display("Test case 1: data_in=%b, code_out=%b, error=%b", data_in, code_out, error);

        data_in = 4'b0001; #10;
        $display("Test case 2: data_in=%b, code_out=%b, error=%b", data_in, code_out, error);

        data_in = 4'b0010; #10;
        $display("Test case 3: data_in=%b, code_out=%b, error=%b", data_in, code_out, error);

        data_in = 4'b0100; #10;
        $display("Test case 4: data_in=%b, code_out=%b, error=%b", data_in, code_out, error);

        data_in = 4'b1000; #10;
        $display("Test case 5: data_in=%b, code_out=%b, error=%b", data_in, code_out, error);

        data_in = 4'b1111; #10;
        $display("Test case 6: data_in=%b, code_out=%b, error=%b", data_in, code_out, error);

        // Add more test cases if needed
        #100 $finish;
    end

endmodule

