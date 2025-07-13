module lcd_driver(
    input clk,
    input rst,
    input [7:0] char_in,
    output reg [7:0] lcd_data,
    output reg lcd_en,
    output reg lcd_rs
);

    reg [3:0] state = 0;
    reg [19:0] delay = 0;
    reg [7:0] current_char = 8'h20; // space
    reg [4:0] cursor_pos = 0;  // up to 20 columns
    reg write_pending = 0;

    localparam DELAY_MAX = 20'd500_000;  // ~10ms delay for safety

    always @(posedge clk) begin
        if (rst) begin
            state <= 0;
 delay <= 0;
            lcd_en <= 0;
            lcd_rs <= 0;
            lcd_data <= 8'h00;
            current_char <= 8'h20;
            cursor_pos <= 0;
            write_pending <= 0;
        end

        else begin
            case (state)
                // Initialization sequence
                0: begin lcd_data <= 8'h38; lcd_rs <= 0; lcd_en <= 1; state <= 1; end
                1: if (delay < DELAY_MAX) delay <= delay + 1;
                   else begin lcd_en <= 0; delay <= 0; state <= 2; end

                2: begin lcd_data <= 8'h0C; lcd_rs <= 0; lcd_en <= 1; state <= 3; end
                3: if (delay < DELAY_MAX) delay <= delay + 1;
                   else begin lcd_en <= 0; delay <= 0; state <= 4; end

                4: begin lcd_data <= 8'h06; lcd_rs <= 0; lcd_en <= 1; state <= 5; end
                5: if (delay < DELAY_MAX) delay <= delay + 1;
                   else begin lcd_en <= 0; delay <= 0; state <= 6; end

                6: begin lcd_data <= 8'h01; lcd_rs <= 0; lcd_en <= 1; state <= 7; end // Clear
7: if (delay < DELAY_MAX) delay <= delay + 1;
                   else begin lcd_en <= 0; delay <= 0; state <= 8; end

                // Wait for UART character
                8: begin
                    if (char_in != current_char) begin
                        current_char <= char_in;
                        write_pending <= 1;
                        state <= 9;
                    end
                end

                // Set cursor position based on cursor_pos
                9: begin
                    lcd_data <= 8'h80 + cursor_pos;
                    lcd_rs <= 0;
                    lcd_en <= 1;
                    state <= 10;
                end
                10: if (delay < DELAY_MAX) delay <= delay + 1;
                    else begin lcd_en <= 0; delay <= 0; state <= 11; end

                // Write character to LCD
                11: begin
                    lcd_data <= current_char;
                    lcd_rs <= 1;
lcd_en <= 1;
                    state <= 12;
                end
                12: if (delay < DELAY_MAX) delay <= delay + 1;
                    else begin
                        lcd_en <= 0;
                        delay <= 0;
                        write_pending <= 0;
                        cursor_pos <= (cursor_pos == 15) ? 0 : cursor_pos + 1;
                        state <= 8;
                    end
            endcase
        end
    end
endmodule
