module illegal_bin;
  bit [1:0] a;
  bit [1:0] arr[$]='{0,2,3,1};
 covergroup cg;
   a1: coverpoint a{
     illegal_bins b1={2,3} ; }
  endgroup
  cg c;
  initial begin
    c=new();
    foreach(arr[i])begin
      a=arr[i];
      c.sample();
      $display("values of a=%0b coverage_percent=%.2f",a,c.get_inst_coverage);
    end
    end
endmodule
