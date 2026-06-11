module task_automatic;
  task automatic increment();
    int x=1;
    x++;
    $display("automatic result:",x);
  endtask
  initial begin
    increment();
     increment();
     increment();
  end 
endmodule
