module fsmoe_tb;

  wire z; // Output from fsmoe
  reg x; // Input to fsmoe
  reg clk = 0; // Clock signal
  wire [3:0] state_reg; // Output from fsmoe
  wire [3:0] current_state; // Output from fsmoe

  // Instantiate fsmoe module
  fsmoe u0 (
    .z(z),
    .x(x),
    .clk(clk),
    .state_reg(state_reg),
    .current_state(current_state)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Test sequence
  initial begin
    $dumpfile("test_fsmoe.vcd");
    $dumpvars(0, fsmoe_tb);

    // Initialize inputs
    x = 4'b0000;

    // Test sequence
    
    #10 x = 4'b1001;
    #10 x = 4'b1010;
    #10 x = 4'b1110;

    #100 $finish; // End simulation
  end

endmodule

