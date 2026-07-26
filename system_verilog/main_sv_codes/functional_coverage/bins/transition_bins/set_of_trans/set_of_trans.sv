

module set_of_trans;
  bit [3:0] a;
  bit [2:0] arr[$]='{1,3,4,2,4,3,4,1,5};
  covergroup cg;
    a: coverpoint a{
      bins b1=(1,2=>3,4);
      bins b2=(1,3=>4);
      bins b3=(1=>2);//single value transition
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
    
