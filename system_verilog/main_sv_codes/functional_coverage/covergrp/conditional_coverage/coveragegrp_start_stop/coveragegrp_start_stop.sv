
class coverage_class;
  randc bit [1:0] a;
  randc bit [1:0] b;
endclass

coverage_class c;
covergroup cg;
  coverpoint c.a;
  coverpoint c.b;
endgroup
 cg cgp;
module conditional_coverage;
   initial begin
    c=new();
    cgp=new();
    cgp.start();

  for (int i = 0; i < 5; i++) begin
      void'(c.randomize());
      cgp.sample();
      $display("a=%d ; b=%d ; coverage = %0.2f", c.a, c.b, cgp.get_inst_coverage());
    end
      if(cgp.get_inst_coverage()>65)
        cgp.stop();
       $display("If coverage%% is greater than 65%%, stop executing covergroup");
     
    end
    endmodule
    
