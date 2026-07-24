
module coverage_event;
  bit [1:0] a;
  event e;
  covergroup cg @(e.triggered);
    coverpoint a;
  endgroup
  cg c=new();
  initial begin
    repeat(10) begin
      ->e;
      a=$random;
      $display("VAlues of a=%0b coverage_percent=%.2f",a,c.get_inst_coverage);
      $display("VAlues of a=%0b full_coverage_percent=%.2f",a,c.get_coverage);
    end
  end
    endmodule
