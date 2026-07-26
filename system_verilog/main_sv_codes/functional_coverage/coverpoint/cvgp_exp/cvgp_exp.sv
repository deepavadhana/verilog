
module expression;
  bit [1:0] a;
  bit [2:0] b; 
  covergroup cg;
  a:  coverpoint a;
  b:  coverpoint b;
  axb:  coverpoint a*b;
  endgroup
  cg c;
  initial begin
    c=new();
    repeat(10) begin
      a=$random;
      b=$random;
      c.sample();
      
      $display("Values of a=%0b b=%0b a*b=%0b full_coverage_percent=%.2f",a,b,a*b,c.get_coverage());
      $display("Values of a=%0b b=%0b a*b=%0b coverage_percent=%.2f",a,b,a*b,c.get_inst_coverage());
    end
  end
    endmodule
      
