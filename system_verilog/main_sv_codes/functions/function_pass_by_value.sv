module function_value;
  function int increment(int x);
    x=x+1;
    return x;
  endfunction
  int a=10;
  int result;
  initial begin
    result=increment(a);
    $display("Pass by value- value,result: %0d %0d",a,result);
  end
endmodule
