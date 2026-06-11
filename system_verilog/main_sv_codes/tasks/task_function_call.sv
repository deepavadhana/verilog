module task_function_call;
  function int multiply(input int a,b);
    multiply=a*b;
  endfunction
  function int squaring_sum(input int  x,y);
    squaring_sum=multiply(x,x)+multiply(y,y);
  endfunction
  task sub_task();
    $display("Execute the main task");
  endtask
  task main_task();
    int result;
    result=squaring_sum(5,4);
    $display("Result=%0d",result);
    sub_task();
    $display("end of the sub_task");
  endtask
  initial begin
    main_task();
  end
endmodule
    
