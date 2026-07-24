
class packet;
  rand bit [1:0] a;
  rand bit [1:0] b;
endclass
packet p = new();
covergroup cgp;
    coverpoint p.a;
    coverpoint p.b;
  endgroup
module packet_coverage;
  cgp cg=new();
  initial begin
     repeat(10)begin
      p.randomize();
      cg.sample();
     $display("Values of a=%0b b=%0b coverage_percentage=%.2f",p.a,p.b,cg.get_inst_coverage());
      $display("Values of a=%0b b=%0b full_coverage_percentage=%.2f",p.a,p.b,cg.get_coverage());
    end
  end
  endmodule
    
