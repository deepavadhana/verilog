module coverage_ex;
  bit [1:0] a;
  bit [1:0] b;
  covergroup cg;
    coverpoint a;
    coverpoint b;
  endgroup
  cg cgp;
  initial begin
    cgp=new();
   
    repeat(10) begin
     a=$urandom_range(0,3);
     b=$random % 4;
      
      cgp.sample();
    
    $display("Values of a=%0b b=%0b coverage_percentage=%.2f",a,b,cgp.get_inst_coverage());
    $display("Values of a=%0b b=%0b full_coverage_percentage=%.2f",a,b,cgp.get_coverage());
  end
  end
endmodule
