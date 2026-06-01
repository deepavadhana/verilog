module funtion_static;
  function int increment_count();
    static int count=0;
    count++;
    return count;
  endfunction
  initial begin
    $display("COUNTER 1-%0d",increment_count());
    $display("COUNTER 2-%0d", increment_count());
    $display("COUNTER 3-%0d",increment_count());
  end
endmodule
