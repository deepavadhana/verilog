// Code your design here
module cross_coverage_var;
  bit [1:0] a;
  bit [1:0] b;
  covergroup cg;
    a1: coverpoint a;
    a2: coverpoint b;
    a3: cross a,b;
  endgroup 
  cg c;
  initial begin
    c=new();
    repeat(20) begin
      a=$random;
      b=$random;
      c.sample();
      $display("Vaues of a=%0b b=%0b coverage_percentage=%.2f",a,b,c.get_inst_coverage());
    end
  end
endmodule
