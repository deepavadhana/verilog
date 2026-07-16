// Code your design here
module tb;
  integer a;
  integer b;
  logic [3:0] c;
  bit [4:0] d;
  byte e;
  initial begin
  a=$random;
  b=$urandom;
  c=$urandom_range(4,2);
  d=$urandom(4);
  e=$random(4);
  $display("value of a= %0d",a);
  $display("value of b= %0d",b);
  $display("value of c= %0d",c);
  $display("value of d= %0d",d);
  $display("value of e= %0d",e);
  end
endmodule
