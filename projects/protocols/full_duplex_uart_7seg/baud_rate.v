module baudrate #(
  parameter M=5,
  parameter N=27
)(
  input clk_50Mhz,
  input rst,
  output tick);
  reg [M-1:0] counter;
  wire [M-1:0] next;
  always@(posedge clk_50Mhz or posedge rst)begin
    if(rst)
      counter<=0;
      else 
        counter<=next;
    end
  assign next=((counter==(N-1))?0:counter+1);
  assign tick=((counter==(N-1))?1'b1:1'b0);
endmodule
