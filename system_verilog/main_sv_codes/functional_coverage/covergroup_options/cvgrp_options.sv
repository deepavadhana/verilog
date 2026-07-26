// Code your design here
class cov_op;
  rand bit [2:0] a;
  rand bit [3:0] b;
endclass
cov_op s;
  covergroup cg;
    a1: coverpoint s.a{
      bins b1={1};
      bins b2={3};
      option.at_least=2;}
     a2: coverpoint s.a{
      option.weight=2;}
     a3: coverpoint s.b{
      option.auto_bin_max=2;}
  endgroup
cg c;
module cov_option;
   initial begin
  s=new();
  c=new();
 
    repeat(10) begin
      void'(s.randomize());
      c.sample();
      $display("Value of coverage_percentage=%.2f",c.get_coverage());
      $display("Value of  c1 -coverage_percentage=%.2f",c1.get_inst_coverage());
      $display("Value of  c2 -coverage_percentage=%.2f",c2.get_inst_coverage());
      $display("Value of  c3 -coverage_percentage=%.2f",c3.get_inst_coverage());
    end
  end
endmodule
