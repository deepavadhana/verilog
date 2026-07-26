// Code your design here
function bit [3:0] sum (int a,int b);
  int c;
  c=a+b;
  return c;
  endfunction
module function_cvgp();
  int add;
  class val;
    rand bit [1:0] a;
    rand bit [1:0] b;
  endclass
  val v;
  covergroup cvg;
   a: coverpoint v.a;
   b: coverpoint v.b;
    func: coverpoint sum(v.a,v.b);
  endgroup
    cvg c;
    initial begin
      c=new();
      v=new();
      repeat(10) begin
        void'(v.randomize());
        add=sum(v.a,v.b);
        c.sample();
        $display("Values of a=%0b b=%0b add=%0b",v.a,v.b,add);
        $display("Coverage_percent=%.2f",c.get_inst_coverage());
      end
    end
      endmodule
