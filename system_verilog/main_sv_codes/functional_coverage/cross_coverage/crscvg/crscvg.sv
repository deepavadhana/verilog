// Code your design here
class packet;
  rand bit [1:0] a;
  rand bit [1:0] b;
covergroup cg;
  a1: coverpoint a;
  a2: coverpoint b;
  a3: cross a1,a2;
endgroup
 function new();
    cg = new();
  endfunction

endclass

module cross_coverage;
  packet p;
initial begin
  p=new();

  repeat(10) begin
    void'(p.randomize());
    p.cg.sample();
    $display("Values of a=%0b b=%0b coverage_percent=%.2f",p.a,p.b,p.cg.get_inst_coverage());
  end
  
end
endmodule
