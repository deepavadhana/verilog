module single_port(
  input clk,
  input[7:0]din,
  input [4:0] addr,
  input wen,
  output reg [7:0]dout);
  reg[7:0]mem[0:31];
  reg [7:0]addr_reg;
  always@(posedge clk) begin
    if(wen)
       mem[addr]<=din;
  else 
      addr_reg<=addr;
  end
    assign dout=mem[addr_reg];
endmodule

//TESTBENCH

module ram_tb;
  reg clk,wen;
  reg[7:0]din;
  reg [4:0] addr;
  wire [7:0]dout;
  
  single_port uut(.clk(clk),.wen(wen),.din(din),.addr(addr),.dout(dout));
  initial clk=0;
  always#5 clk=~clk;
  initial begin
     $dumpfile("single_port.vcd");
    $dumpvars(0,ram_tb);
   
   wen=0;din=0;addr=0;
    #10 wen=1;
    for( int i=0;i<8;i=i+1)begin
      din=i*i;
    addr=i;
      #10;
    end
    #10 wen=0;
    for(int i=0;i<8;i=i+1)begin
      addr=i;
      #10
      $display("read_operation[%0d]:Data=%0d",i,dout);
    end
    #100$finish;
  end
  endmodule
    
    
  
  
