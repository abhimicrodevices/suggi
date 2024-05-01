module fsm_tb;

  reg clk = 0; // Clock signal
  reg rst = 0; // Reset signal
  wire [2:0] light; // Output signal (declare as wire)
  wire [1:0] state; // Output signal (declare as wire)

  // Instantiate FSM module
  fsm uut (
    .clk(clk),
    .light(light),
    .state(state)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Reset generation
  initial begin
    #10 rst = 1; // Assert reset
    #20 rst = 0; // Deassert reset
  end

  // Monitor
  always @(posedge clk) begin
    $dumpfile("test_fsm.vcd");
    $dumpvars(0,fsm_tb);
  // End simulation after 100 time units
 
    #100 $finish;
  end

endmodule

