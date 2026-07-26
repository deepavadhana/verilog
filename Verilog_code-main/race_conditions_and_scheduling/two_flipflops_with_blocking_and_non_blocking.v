module non_blocking(input clk,input rst,output reg [3:0] a,b);

  always@(posedge clk or posedge rst) begin
    if(rst) begin
    a<=4'b1110;
    b<=4'b1100;
    end
    else begin
      a<=b;
    b<=a;
  end
  end
endmodule
module blocking(input clk,input rst,output reg [3:0] a,b);

  always@(posedge clk or posedge rst) begin
    if(rst) begin
    a=4'b1110;
    b=4'b1100;
    end
    else begin
      a=b;
    b=a;
  end
  end
endmodule

//TESTBENCH

module tb();
  reg clk,rst;
  wire [3:0]a_in,b_in;
  wire [3:0]a_bin,b_bin;

  always#5 clk=~clk;
  non_blocking uut(.clk(clk),.rst(rst),.a(a_in),.b(b_in));
  blocking dut(.clk(clk),.rst(rst),.a(a_bin),.b(b_bin));
  
  initial begin
    clk=0;
    $monitor("time=%0t  | clk=%0b| a=%0b |b=%0b| a=%0b |b=%0b",$time,clk,a_in,b_in,a_bin,b_bin);
    #30 rst=1;
   
    #50 $finish;
  end
endmodule
    
