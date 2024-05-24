module forloop(
    input wire [6:0] data_in,
    input wire gen_check,     
    input wire [2:0] crc_in,   
    output reg [2:0] crc_out,  
    output reg crc_error     
);
    integer i;
    reg [6:0] crc;  

    always @(data_in or gen_check or crc_in) 
    	begin
        if (gen_check) 
        begin
       
            crc = {data_in[3:0], 3'b000};  
            for (i = 6; i >= 3; i = i - 1) 
            begin
                if (crc[i]) 
                begin
                    crc = crc ^ (7'b1011000 >> (6 - i)); 
                end
            end
            crc_out = crc[2:0];
            crc_error = 0;  
        end 
        else 
        begin
          crc = {data_in[3:0], crc_in};  
            for (i = 6; i >= 3; i = i - 1) 
            begin
                if (crc[i]) begin
                    crc = crc ^ (7'b1011000 >> (6 - i));  
                end
            end
            crc_error = (crc[2:0] != 3'b000); 
            crc_out = 3'b000;  
        end
    end
endmodule

