module semaphore_example2;
  semaphore sem =new(6);
  initial begin
    sem.get(4);
    $display("first process:thread in the first process:%0t",$time);
    #5;
    sem.put(2);
    $display("first process:thread in the first process:%0t",$time);
  end
   initial begin
     sem.get(5);//this process will never start as the first process gets only 4 keys so if the keys are unavailable it will not start ,hence the display statement of 
     $display("second process:thread in the second process:%0t",$time);
    #15;
     sem.put(4);
     $display("second process:thread in the second process:%0t",$time);
  end
endmodule
