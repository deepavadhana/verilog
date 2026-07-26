
module goto_repeat;
  bit [3:0] a;
  bit [2:0] arr[$]='{1,2,4,3,4,4,5,3,2,1};
  covergroup cg;
    a: coverpoint a{
      bins b1=(1=>4[->3]=>5);
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
    
