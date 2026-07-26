module race_condition(input [3:0]x,y,input clk,output reg [3:0]z);
  always@(posedge clk)
    z<=x;
  always@(posedge clk)
    z<=y;
endmodule

//TESTBENCH

module tb;
  reg [3:0]x,y;
  reg clk;
  wire [3:0]z;
  race_condition uut(.clk(clk),.x(x),.y(y),.z(z));
  always#5 clk=~clk;
  initial begin
    #10; $monitor("time=%0t | clk=%0b | z=%0b",$time,clk,z);
    clk=0; x=4'b0000;y=4'b0000;
    
    #10; x=4'b0010;y=4'b0011;
    #10; x=4'b0001;y=4'b0100;
    #10; x=4'b0110;y=4'b1110;
    #10; x=4'b0101;y=4'b0010;
    
    #30 $finish;  
  end
endmodule
