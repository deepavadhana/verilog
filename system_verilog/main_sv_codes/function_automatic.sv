// Code your design here
module automatic_function;
  function automatic int counter();
    int count=0;
    count++;
    return count;
  endfunction
  initial begin
    $display("Count 1: %0d",counter());
    $display("Count 2: %0d",counter());
    $display("Count 3: %0d",counter());
  end
endmodule
