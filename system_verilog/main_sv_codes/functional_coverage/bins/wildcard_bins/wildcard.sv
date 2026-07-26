module wildcard_bins;
  bit [3:0] a;
  bit [3:0] arr[$]='{4'b1000,4'b1001,4'b1010,4'b1011};
  covergroup cg;
    a: coverpoint a{
      wildcard bins b1={4'b100x};
      wildcard bins b2={4'b101x};
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
    
