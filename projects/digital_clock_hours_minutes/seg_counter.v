
module seg_counter (
    input clk_1hz, clk_50Mhz,
    input rst, 
    output reg [3:0] out, 
    output reg [7:0] seg
);
    reg [17:0] mux_counter;
    reg [23:0] digit_count;  
    reg [3:0] val;
    
    always @(*) begin
        case (val)
            4'b0000: seg <= 8'b00000011;
            4'b0001: seg <= 8'b10011111;
            4'b0010: seg <= 8'b00100101;
            4'b0011: seg <= 8'b00001101;
            4'b0100: seg <= 8'b10011001;
            4'b0101: seg <= 8'b01001001;
            4'b0110: seg <= 8'b01000001;
            4'b0111: seg <= 8'b00011111;
            4'b1000: seg <= 8'b00000001;
            4'b1001: seg <= 8'b00001001;
            default: seg <= 8'b11111111;
        endcase
    end
always @(posedge clk_50Mhz or posedge rst) begin
        if (rst)
            mux_counter <= 18'd0;
        else
            mux_counter <= mux_counter + 1;
    end
always @(mux_counter[17:16]) begin
        case (mux_counter[17:16])
            2'b00: begin
                out <= 4'b0001;
                val <= digit_count[3:0]; 
            end
            2'b01: begin
                out <= 4'b0010;
                val <= digit_count[7:4];  
            end
            2'b10: begin
                out <= 4'b0100;
                val <= digit_count[23:20];  
            end
            2'b11: begin
                out <= 4'b1000;
                val <= digit_count[19:16];  
            end
        endcase
    end
always @(posedge clk_1hz or posedge rst) begin
        if (rst)
            digit_count <= 24'd0;
        else begin
            if (digit_count[11:8] < 4'd9)
                digit_count[11:8] <= digit_count[11:8] + 1;
            else begin
                digit_count[11:8] <= 4'd0;
                if (digit_count[15:12] < 4'd5)
                    digit_count[15:12] <= digit_count[15:12] + 1;
                else begin
                    digit_count[15:12] <= 4'd0;
                    if (digit_count[19:16] < 4'd9) begin
                        if (digit_count[23:20] != 4'd2 || digit_count[19:16] < 4'd3)
                            digit_count[19:16] <= digit_count[19:16] + 1;
                        else begin
                            digit_count[19:16] <= 4'd0;
                            digit_count[23:20] <= 4'd0;
                        end
                    end
                    else begin
                        digit_count[19:16] <= 4'd0;
                        if (digit_count[23:20] < 4'd2)
                            digit_count[23:20] <= digit_count[23:20] + 1;
                        else
                            digit_count[23:20] <= 4'd0;
                    end
                end
            end
        end
    end

endmodule
