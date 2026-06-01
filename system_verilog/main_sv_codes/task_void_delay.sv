// Code your design here
module task_void_delay;
  task msg();
    #10;
    $display("Hello");
  endtask
  initial begin
    msg();
    msg();
  end
endmodule
    
