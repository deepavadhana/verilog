
class packet;
  rand bit [1:0] a;
  rand bit [1:0] b;
  covergroup cgp;
    coverpoint a;
    coverpoint b;
  endgroup
  function new();
    cgp=new();
  endfunction
endclass
 
module packet_coverage;
   packet p=new();
  initial begin
    repeat(10)begin
      p.randomize();
      p.cgp.sample();
    
      $display("Values of a=%0b b=%0b coverage_percentage=%.2f",p.a,p.b,p.cgp.get_inst_coverage());
      $display("Values of a=%0b b=%0b full_coverage_percentage=%.2f",p.a,p.b,p.cgp.get_coverage());
    end
  end
  endmodule
    
