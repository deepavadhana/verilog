`timescale 1ns / 1ps
module clock_Divider(input clk, rst, output clk_out);
reg [24:0] count;
reg tmp;
always @(posedge clk or posedge rst) begin
    if (rst) 
      begin
        count <= 1;
        tmp <= 0;
      end 
    else 
      begin
        count <= count + 1;
    if (count == 25000000) 
      begin
        tmp <= ~tmp;
        count <= 1;
      end
      end
      end
assign clk_out = tmp;
    endmodule


module seg_counter (input clk, input rst, output reg [3:0] digit, output reg [7:0] seg,output clk_out);
    reg [17:0] counter;
    reg [15:0] digit_count;
    reg [3:0] bcd_in;
  clock_Divider dut (.clk(clk), .rst(rst), .clk_out(clk_out) );
    always @(bcd_in) 
      begin
        case (bcd_in)
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
    always @(posedge clk or posedge rst) 
      begin
        if (rst)
            counter <= 18'd0;
        else
            counter <= counter + 1;
      end
    always @(*) 
      begin
        case (counter[17:16])
            2'b00: 
              begin
                digit <= 4'b0001;
                bcd_in <= digit_count[15:12];
              end
            2'b01:
              begin
                digit <= 4'b0010;
                bcd_in <= digit_count[11:8];
              end
            2'b10: 
              begin
                digit <= 4'b0100;
                bcd_in <= digit_count[7:4];
              end
            2'b11: 
              begin
                digit <= 4'b1000;
                bcd_in <= digit_count[3:0];
              end
            default: 
              begin
                digit <= 4'b0000;
              end
        endcase
      end
   always @(posedge clk_out or posedge rst) 
     begin
        if (rst)
            digit_count <= 16'd0;
        else 
          begin
            if (digit_count[3:0] < 4'b1001)
                digit_count[3:0] <= digit_count[3:0] + 1;
            else 
              begin
                digit_count[3:0] <= 4'b0000;
                if (digit_count[7:4] < 4'b1001)
                    digit_count[7:4] <= digit_count[7:4] + 1;
                else
                  begin
                    digit_count[7:4] <= 4'b0000;
                    if (digit_count[11:8] < 4'b1001)
                        digit_count[11:8] <= digit_count[11:8] + 1;
                    else 
                      begin
                        digit_count[11:8] <= 4'b0000;
                        if (digit_count[15:12] < 4'b1001)
                            digit_count[15:12] <= digit_count[15:12] + 1;
                        else
                            digit_count[15:12] <= 4'b0000;
                      end
                  end
              end
          end
      end

  endmodule

//Testbench

`timescale 1ns / 1ps

module seg_counter_tb;
    reg clk;
    reg rst;
    wire [3:0] digit;
    wire [7:0] seg;
    wire clk_out;
    seg_counter uut (.clk(clk),.rst(rst),.digit(digit),.seg(seg),.clk_out(clk_out) );
    initial
        begin
        clk = 0;
        forever #5 clk = ~clk;
        end
    initial 
        begin
        rst = 1;
        #20;
        rst = 0;
        #1_000000; 
        $finish;
        end
    initial
        begin
      $dumpfile("wave.vcd");
      $dumpvars;
    $monitor("Time=%0t | clk_out=%b | digit=%b | seg=%b", 
                  $time, clk_out, digit, seg);
        end
    endmodule
