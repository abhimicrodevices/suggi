module jkff_tb;

reg clk;
reg j;
reg k;
wire q;
wire qn;

jkff u0 (
    .clk(clk),
    .j(j),
    .k(k),
    .q(q),
    .qn(qn)
);

initial begin
    $dumpfile("test_jkff.vcd");
    $dumpvars(0, jkff_tb);
    clk = 0;
    j = 0;
    k = 0;
    #10; // Initial stabilization time
    // Set initial values
    j = 1;
    k = 0;
    #10;
    j = 0;
    k = 1;
    #10;
    j = 1;
    k = 1;
    #100; // Simulation duration
    $finish;
end

always #5 clk = ~clk; // Clock toggle

endmodule

