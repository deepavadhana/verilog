
module dff (
    input clk,
    input reset,
    input d,
    output reg q
);
  always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module mod7_counter (
    input clk,
    input reset,
    output [2:0] q
);
  wire [2:0] d; 
   dff f0 (.clk(clk), .reset(reset), .d(d[0]), .q(q[0]));
   dff f1 (.clk(clk), .reset(reset), .d(d[1]), .q(q[1]));
   dff f2 (.clk(clk), .reset(reset), .d(d[2]), .q(q[2]));
    assign d[0] = ~q[0];
    assign d[1] = q[0] ^ q[1];
    assign d[2] = (q[2] & ~q[1]) | (q[0] & q[1] & ~q[2]);
endmodule

//Testbench

module tb_mod7_counter;
    reg clk;
    reg reset;
    wire [2:0] q;
  mod7_counter uut (.clk(clk), .reset(reset),.q(q) );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    initial begin
        reset = 1;
        #10 reset = 0;
        #100 $finish;
    end
      initial begin
      $monitor("time=%0t, reset=%b, q=%b", $time, reset, q);
    end
      initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  endmodule
