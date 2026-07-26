// Code your design here
module part_select;
  bit [2:0] a;
  covergroup cg;
   a0: coverpoint a[0];
   a1: coverpoint a[1:0];
   a2: coverpoint a[2:1];
  endgroup
  cg c;
  initial begin
    c=new();
    repeat (10) begin
      a=$random;
      c.sample();
      $display("Values of a0=%0b, a1=%0b ,a2=%0b",a[0],a[1:0],a[2:1]);
      $display("Coverage_percent=%.2f ,full_coverage_percent=%.2f",c.get_inst_coverage,c.get_coverage);
    end
  end
endmodule
    
