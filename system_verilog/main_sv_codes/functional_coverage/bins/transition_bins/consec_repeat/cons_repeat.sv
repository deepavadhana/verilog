// Code your design here
module consec_repeat;
  bit [3:0] a;
  bit [2:0] arr[$]='{2,2,4,4};
  covergroup cg;
    a: coverpoint a{
      bins b1=(2[*2]);
      bins b2=(4[*3]);//use bracket for trans bins
    }
  endgroup
  cg c;
  initial begin
    c=new();
    foreach (arr[i])begin
      a=arr[i];
      c.sample();
      $display("values=%0b coverage_percent=%.2f",a,c.get_inst_coverage());
    end
  end
endmodule
    
