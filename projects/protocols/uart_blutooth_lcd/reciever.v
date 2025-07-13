
module uart_receiver(
    input clk,
    input rst,
    input tick,
    input rx,
    output reg [7:0] data_out,
    output reg ready
);
    reg [3:0] sample_count = 0;
    reg [2:0] bit_count = 0;
    reg [7:0] shift_reg = 0;
    reg [1:0] state = 0;

    localparam IDLE = 0, START = 1, DATA = 2, STOP = 3;

    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            sample_count <= 0;
            bit_count <= 0;
            ready <= 0;
        end else begin
            ready <= 0;
            if (tick) begin
                case (state)
                    IDLE: if (~rx) begin
                        sample_count <= 0;
                        state <= START;
                    end
                    START: if (sample_count == 7) begin
                        sample_count <= 0;
                        bit_count <= 0;
                        shift_reg <= 0;
                        state <= DATA;
                    end else sample_count <= sample_count + 1;

                    DATA: if (sample_count == 15) begin
                        shift_reg <= {rx, shift_reg[7:1]};
                        sample_count <= 0;
                        if (bit_count == 7)
                            state <= STOP;
                        else
                            bit_count <= bit_count + 1;
                    end else sample_count <= sample_count + 1;

                    STOP: if (sample_count == 15) begin
                        state <= IDLE;
                        data_out <= shift_reg;
                        ready <= 1;
                        sample_count <= 0;
                    end else sample_count <= sample_count + 1;
                endcase
            end
        end
    end
endmodule

