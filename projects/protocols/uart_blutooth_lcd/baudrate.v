module baudrate_generator #(parameter DIVISOR = 325)(
    input clk,
    input rst,
    output reg tick
);
    reg [15:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            tick <= 0;
        end else if (counter == DIVISOR - 1) begin
            counter <= 0;
            tick <= 1;
        end else begin
            counter <= counter + 1;
            tick <= 0;
        end
    end
endmodule
