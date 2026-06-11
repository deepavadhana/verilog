// Code your design here
module function_without_return;
  function int add(input int a,b);
    add=a+b;
  endfunction
  initial begin
    $display("Function_without_return: %0d",add(10,20));
  end
endmodule
