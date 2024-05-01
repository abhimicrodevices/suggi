module fsm(
  input clk,
  output reg [2:0] light,
  output reg [1:0] state
);

parameter s0 = 0, s1 = 1, s2 = 2;
parameter red = 3'b100, yellow = 3'b010, green = 3'b001;

reg [2:0] next_state;

always @(posedge clk) begin
    case (state)
        s0: next_state <= s1;
        s1: next_state <= s2;
        s2: next_state <= s0;
        default: next_state <= s0;
    endcase
end

always @(posedge clk) begin
    state <= next_state;
end

always @(*) begin
    case (state)
        s0: light = red;
        s1: light = yellow;
        s2: light = green;
        default: light = red;
    endcase
end

endmodule

