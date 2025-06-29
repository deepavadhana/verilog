
module clk_divider(input clk_50Mhz, rst, output clk_1hz, clk_500hz);
  reg [25:0] counter1;
  reg [16:0] counter2;
  reg tmp1,tmp2;
always @(posedge clk_50Mhz or posedge rst) begin
    if (rst) begin
      counter1 <= 0;
      tmp1 <= 0;
    end else begin
      counter1 <= counter1 + 1;
      if (counter1 == 24999999) begin
        tmp1 <= ~tmp1;
        counter1 <= 0;
      end
    end
  end
  assign clk_1hz=tmp1;
always @(posedge clk_50Mhz or posedge rst) begin
    if (rst) begin
      counter2 <= 0;
      tmp2 <= 0;
    end else begin
      counter2 <= counter2 + 1;
      if (counter2 == 99999) begin
        tmp2 <= ~tmp2;
        counter2 <= 0;
      end
    end
  end
  assign clk_500hz=tmp2;
endmodule
