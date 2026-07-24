
module clk_cvg;
  bit clk;
  bit [2:0] a;
  bit  b;
  always #5 clk = ~clk;
  covergroup cg @(posedge clk);
    coverpoint a;
    coverpoint b;
  endgroup
  cg c=new();
  initial begin
    repeat(10) begin
      @(posedge clk);
        a=$random;
        b=$random;
          // this line is not needed as we use posedge clk
        //c.sample()
        $display ("Values of a=%0b b=%0b coverage_percent=%.2f",a,b,c.get_inst_coverage());
        $display ("Values of a=%0b b=%0b full_coverage_percent=%.2f",a,b,c.get_coverage());
      end
        
    $finish;
  end
    endmodule
