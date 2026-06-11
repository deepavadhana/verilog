// Code your design here
module task_pass_by_ref;
  task increment(ref int x);
    x=x+1;
  endtask
  int a=20;
initial begin
  increment(a);
  $display("pass by reference : %0d",a);
end
endmodule
