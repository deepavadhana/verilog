module mod7_counter (
    input clk,
    input reset,
    output reg [2:0] count
);
 always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 3'b000;
        else if (count == 3'b110) 
            count <= 3'b000;
        else
            count <= count + 1;
    end
   endmodule

//Testbench

module mod7_counter_tb;
  reg clk;
  reg reset;
  wire [2:0] count;
  mod7_counter counter_inst( .clk(clk),  .reset(reset),.count(count) );
  always #5 clk = ~clk; 
    initial begin
        clk = 0;
        reset = 1; 
        #10 reset = 0;
        #100 $finish; 
    end
  always @(posedge clk) begin
    $display("Count = %b", count);
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
 endmodule
