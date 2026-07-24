// Code your testbench here
// or browse Examples
module conditional_cov;
  bit [2:0] a;
  bit [1:0] b;
  bit clk;
  always #5 clk=~clk;
  covergroup cg ;
    coverpoint a iff (b==2){
      bins b1 = {4};
      bins b2 = {5};}
      endgroup
  cg c=new();
  initial begin
    for(int i=0;i<=10;i++)begin
      a=$random;
      b=$random;
    @(posedge clk);
    if(b==2)
      $write("if b==2 then write the values of bins created");
    
      $display("if b is not equal to 2 then no bins are generated values of a=%0b b=%0b coverage_percentage=%.2f",a,b,c.get_inst_coverage());
    end
    $finish;
  end
endmodule
