module alu_tb;

reg [3:0] a, b;
reg [1:0] sel;
wire [7:0] z;

alu u0 (
    .a(a),
    .b(b),
    .sel(sel),
    .z(z)
);

initial begin
    a = 4'b0000;
    b = 4'b0000;
    sel = 2'b00;

    $dumpfile("test_alu.vcd");
    $dumpvars(0, alu_tb);

    #5 a = 4'b1111; b = 4'b1110;
    #10 sel = 2'b01;
    #10 sel = 2'b10;
    #10 sel = 2'b11;
    #100 $finish;
end

endmodule

