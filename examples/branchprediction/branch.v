module branch(
    input wire [1:0] branch_condition,
    output reg predicted_branch
);

    reg [1:0] counter_state;

   
    initial begin
        counter_state = 2'b00;
    end

    
    always @(posedge branch_condition) begin
        case (counter_state)
            2'b00: begin
                if (branch_condition == 2'b00)
                    counter_state <= 2'b01;
            end
            2'b01: begin
                if (branch_condition == 2'b01)
                    counter_state <= 2'b10;
                else
                    counter_state <= 2'b00;
            end
            2'b10: begin
                if (branch_condition == 2'b10)
                    counter_state <= 2'b01;
                else
                    counter_state <= 2'b11;
            end
            2'b11: begin
                if (branch_condition == 2'b11)
                    counter_state <= 2'b10;
            end
        endcase
    end

    
    always @* begin
        case (counter_state)
            2'b00, 2'b01: predicted_branch = 1'b0;
            2'b10, 2'b11: predicted_branch = 1'b1;
        endcase
    end

endmodule

