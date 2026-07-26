
module dual_port(
  input clk,
  input wen_a,wen_b,
  input [7:0] din_a,din_b,
  input [4:0] addr_a,addr_b,
  output reg [7:0] dout_a,dout_b);
  reg [7:0]mem[31:0];
  always@(posedge clk)begin
    if(wen_a)
      mem[addr_a]<=din_a;
    else
      dout_a<=mem[addr_a];
    if(wen_b)
      mem[addr_b]<=din_b;
    else
      dout_b<=mem[addr_b];
  end
endmodule

TESTBENCH

module dual_port_tb;
  reg clk,wen_a,wen_b;
  reg [7:0] din_a,din_b;
  reg [4:0] addr_a,addr_b;
  wire [7:0] dout_a,dout_b;
  dual_port uut (.clk(clk),.wen_a(wen_a),.wen_b(wen_b),.din_a(din_a),.din_b(din_b),.addr_a(addr_a),.addr_b(addr_b),.dout_a(dout_a),.dout_b(dout_b));
  initial begin clk=0;
  forever#5 clk=~clk;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    wen_a=0;wen_b=0;
    din_a=0;din_b=0;
    addr_a=0;addr_b=0;
    #10
        wen_a=1;wen_b=1;
    din_a=8'd40;din_b=8'd30;
    addr_a=5'd10;addr_b=5'd20;
    #10
     wen_a=0;wen_b=0;
    addr_a=5'd10;addr_b=5'd20;
    #10
    $display("read operation : data_a=%0d data_b=%0d",dout_a,dout_b);
    #10 
     wen_a=0;wen_b=1;
     din_a=8'd50;
    addr_a=5'd20;addr_b=5'd20;
     $display("read operation :  data_b=%0d",dout_b);
    #10
    $finish;
  end
endmodule
