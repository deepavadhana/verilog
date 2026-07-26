// Code your design here
module simple_cov;
  bit [3:0] a;
  bit [3:0] arr[4]='{2,4,11,5};
  
  covergroup cg;
    coverpoint a;
  endgroup
  cg c;
  initial begin
    c=new();
    for(int i=0;i<10;i++) begin
      a=arr[i];
      c.sample();
      $display("Values of a=%0d",a);
      $display("coverage_percent=%.2f, full_coverage_percent=%.2f",c.get_inst_coverage,c.get_coverage);
    end
  end
endmodule
  
