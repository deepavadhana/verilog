
module ripple_carry_adder(input [3:0]a,b,input cin,output [3:0]sum,output carry);
  wire c1,c2,c3;
  fulladder fa1 (.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.carry(c1));
  fulladder fa2 (.a(a[1]),.b(b[1]),.cin(c1),.sum(sum[1]),.carry(c2));
  fulladder fa3 (.a(a[2]),.b(b[2]),.cin(c2),.sum(sum[2]),.carry(c3));
  fulladder fa4 (.a(a[3]),.b(b[3]),.cin(c3),.sum(sum[3]),.carry(carry));
endmodule
  
  
  module fulladder(input a,b,cin,output sum,carry);
    assign sum=a^b^cin;
    assign carry=a&b|b&cin|a&cin;
  endmodule

//Testbench

module ripple_carry_adder_tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0]sum;
  wire carry;
  ripple_carry_adder uut (.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
  initial begin
    $monitor("time=%0t a=%0d b=%0d cin=%0d sum=%0d carry=%0d ",$time,a,b,cin,sum,carry);
    a=0;b=0;cin=0;
    #10
    a=4'b0001;b=4'b1000;cin=0;
    #10
     a=4'b0011;b=4'b0001;cin=1;
    #10
     a=4'b0000;b=4'b1000;cin=0;
    #10
     a=4'b0101;b=4'b0000;cin=1;
    $finish;
  end
  endmodule
