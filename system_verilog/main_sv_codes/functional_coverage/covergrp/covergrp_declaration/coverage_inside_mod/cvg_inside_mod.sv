
class packet;
  rand bit [1:0] a;
  rand bit [1:0] b;
endclass
module packet_coverage;
   packet p;
covergroup cgp(ref bit [1:0] a, ref bit [1:0] b);
    coverpoint a;
    coverpoint b;
  endgroup
    cgp cg;
  initial begin
    p=new();
    cg=new(p.a,p.b);
    repeat(10)begin
      p.randomize();
      cg.sample();
     $display("Values of a=%0b b=%0b coverage_percentage=%.2f",p.a,p.b,cg.get_inst_coverage());
      $display("Values of a=%0b b=%0b full_coverage_percentage=%.2f",p.a,p.b,cg.get_coverage());
    end
  end
  endmodule
    
