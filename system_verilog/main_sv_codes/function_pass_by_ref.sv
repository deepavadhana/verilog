module function_by_ref;
  function void increment(ref int x);
    x=x+1;
  endfunction
  int a=10;
  initial begin
    increment(a);
    $display("Pass by ref,ref: %0d %0d",a);
    end
endmodule
