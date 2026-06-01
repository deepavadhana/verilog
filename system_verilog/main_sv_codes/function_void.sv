module function_void ;
  function void greet();
    $display("Hi");
  endfunction
  initial begin
    greet();
  end
endmodule
