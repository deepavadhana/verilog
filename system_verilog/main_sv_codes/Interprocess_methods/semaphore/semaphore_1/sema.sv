module semaphore_example_1;
  semaphore sem=new(6);
  initial begin
    sem.get(3);
    $display("SEmaphore key for the process 1 at the time:%0t",$time);
    #5;
    sem.put(3);
    $display(" Recieved SEmaphore key for the process 1 at the time:%0t",$time);
  end
  initial begin
    #10;
    sem.get(2);
    $display("SEmaphore key for the process 2 at the time:%0t",$time);
    #3;
    sem.put(2);
    $display(" Recieved SEmaphore key for the process 2 at the time:%0t",$time);
  end
endmodule
