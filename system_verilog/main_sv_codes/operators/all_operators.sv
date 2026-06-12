// Code your testbench here
// or browse Examples
module operators;
  bit [3:0] x =4'b1010;
  bit [3:0] y =4'b1011;
  int a=10,b=15;
  bit result;
  bit [7:0] conc_result;
  bit [11:0] repli_result;
  initial begin
    //arithmetic operations
    $display("ADD:%0d",a+b);
    $display("SUB:%0d",a-b);
    $display("MUL:%0d",a*b);
    $display("DIV:%0d",a/b);
    $display("REM:%0d",a%b);
   //Concatenation operations
    conc_result={x,y};
    $display("Concatenation:%0b",conc_result);
    //Replication operations
    repli_result={3{x,y}};
    $display("Replication:%0b",repli_result);
    //bitwise operations
    $display("AND:%0b",x&y);
    $display("OR:%0b",x|y);
    $display("XOR:%0b",x^y);
    $display("NOT:%0b",~x);
    //Reduction operations
    $display("AND:%0b,%0b",&x,&y);
    $display("OR:%0b,%0b",|x,|y);
    $display("XOR:%0b,%0b",^x,^y);
    $display("NOT:%0b,%0b",~&x,~&y);
    //Logical operations
    $display("AND : %0d",(a>0)&&(b>0));
    $display("OR : %0d",(a>0)||(b>0));
    $display("NOT : %0d",!(a>b));
    //Equality operators
    $display("Not Equal:%0b",x!==y);
    $display("Equal:%0b",x==y);
    //Conditional operations
    $display("True:%0b",a>0?1:0);
    $display("False:%0b",a>b?1:0);
    //Relational operations
    $display("Greater:%0b",a>b);
    $display("Smaller:%0b",a<b);
    $display("Greater than and equal to:%0b",a>=b);
    $display("Smaller than and equal to:%0b",a<=b);
    //Shift operations
    $display("Shift left:%0b",x<<1);
    $display("Shift right:%0b",x>>1);
    $display("Shift left:%0b",y<<1);
    $display("Shift right:%0b",y>>1);
    $display("Arithmetic Shift left:%0b",x<<<1);
    $display("Arithmetic Shift right:%0b",x>>>1);
    $display("Arithmetic Shift left:%0b",y<<<1);
    $display("Arithmetic Shift right:%0b",y>>>1);
  end
endmodule
