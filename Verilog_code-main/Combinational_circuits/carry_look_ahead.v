module carry_look_ahead(input [3:0] a,input [3:0] b,input co,output [3:0] sum,output [3:0] carry);
  wire [3:0]g,p;
  assign g[0]=a[0]&b[0];
  assign g[1]=a[1]&b[1];
  assign g[2]=a[2]&b[2];
  assign g[3]=a[3]&b[3];
  assign p[0]=a[0]^b[0];
  assign p[1]=a[1]^b[1];
  assign p[2]=a[2]^b[2];
  assign p[3]=a[3]^b[3];
  
  assign sum[0]=p[0]^co;
  assign sum[1]=p[1]^carry[0];
  assign sum[2]=p[2]^carry[1];
  assign sum[3]=p[3]^carry[2];

  
  assign carry[0]=(p[0]&co)|g[0];
  assign carry[1]=(p[1]&carry[0])|g[1];
  assign carry[2]=(p[2]&carry[1])|g[2];
  assign carry[3]=(p[3]&carry[2])|g[3];
endmodule
//TESTBENCH
// Code your testbench here
// or browse Examples
module tb;
  wire [3:0] sum;
  wire[3:0] carry;
  reg [3:0] a,b;
  reg co;
  carry_look_ahead uut (.a(a),.b(b),.co(co),.sum(sum),.carry(carry));
  initial begin
    $monitor ("time=%0t sum=%0d carry=%0d" ,$time,sum,carry[3]);
    a=0;b=0;co=0;
    #10
    a=4'b0010;b=4'b0101;co=1;
    #10
     a=4'b0010;b=4'b1101;co=0;
    #10
     a=4'b0010;b=4'b1100;co=1;
    $finish;
  end
endmodule
    
