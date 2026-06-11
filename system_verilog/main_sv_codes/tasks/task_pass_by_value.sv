module pass_by_value;
  task increment(input int x);
    x=x+1;
    $display("Pass by value inside task:%0d",x);
  endtask
  int a=10;
  initial begin
    increment(a);
    $display("Pass by value outside task:%0d",a);
  end
endmodule
