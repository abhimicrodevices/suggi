module branch_tb;

    reg [1:0] branch_condition;
    wire predicted_branch;

    
    branch u0 (
        .branch_condition(branch_condition),
        .predicted_branch(predicted_branch)
    );

    
    initial begin
        
        $dumpfile("test_branch.vcd");
        $dumpvars(0, branch_tb);

        
        branch_condition = 2'b00; 
        #5 branch_condition = 2'b01; 
        #5 branch_condition = 2'b00; 
        #5 branch_condition = 2'b11;

       
        #100 $finish;
    end

endmodule

