// Code your design here
module task_static;
  task increment();
    static int x=1;
    x++;
    $display("RESULT:%0d",x);
  endtask
  initial begin
    increment();
    increment();
    increment();
  end
endmodule
