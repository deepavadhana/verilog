// Code your design here
module static_automatic_function;
  function int static_func();
    static int count=0;
    count++;
    return count;
  endfunction
  function automatic int counter();
    int count=0;
    count++;
    return count;
  endfunction
  initial begin
    $display("COUNT 1:%0d",static_func());
    $display("COUNT 2:%0d",static_func());
    $display("COUNT 3:%0d",static_func());
    $display("COUNT 1:%0d",counter());
    $display("COUNT 2:%0d",counter());
    $display("COUNT 3:%0d",counter());
  end
endmodule
    
