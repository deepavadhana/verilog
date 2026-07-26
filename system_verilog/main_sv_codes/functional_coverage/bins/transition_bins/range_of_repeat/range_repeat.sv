
module range_of_repeat;
  bit [3:0] a;
  bit [2:0] arr[$]='{2,2,3,2,2,2,4,2,4,4,4,5};
  covergroup cg;
    a: coverpoint a{
      bins b1=(2[*3:5]);
      bins b2=(4[*3]);
      //use bracket for trans bins
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
    
