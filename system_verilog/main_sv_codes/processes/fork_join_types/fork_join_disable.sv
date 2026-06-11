
module fork_join;
  initial begin
    fork
      $display("hi");
      $display("deepa");
      $display("!");
    join_none
    disable fork;
      $display("complete");
      end
      endmodule
