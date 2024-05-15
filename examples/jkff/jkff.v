module jkff (
    input clk,
    input  j,
    input  k,
    output reg q = 1'b0,
    output reg qn = 1'b1
);

always @(posedge clk) begin
    case ({j, k})
        2'b00: begin 
            q <= q;
            qn <= qn;
        end
        2'b01: begin 
            q <= 1'b0;
            qn <= 1'b1;
        end
        2'b10: begin 
            q <= 1'b1;
            qn <= 1'b0;
        end
        2'b11: begin 
            q <= ~q;
            qn <= ~qn;
        end
    endcase
end

endmodule

