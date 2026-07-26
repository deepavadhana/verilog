// Code your design here
module explicit_bin;
  bit [1:0] a;
 
  covergroup cg;
   a1: coverpoint a{
      bins b1={2};
      bins b2={3}; }
  endgroup
  cg c;
  initial begin
    c=new();
    repeat(10) begin
      a=$random;
      c.sample();
      $display("values of a=%0b coverage_percent=%.2f",a,c.get_inst_coverage);
    end
    end
endmodule
    
    
