// Code your design here
module fork_join_event;
  event data_ready;
  initial begin
    fork 
      begin
        $display("[%0t]parent 1 executes",$time);
      end
      begin
        #10 $display("[%0t]parent 2 executes",$time);
        ->data_ready;
      end
         begin
        @data_ready;
        $display("[%0t]parent 3 executes",$time);
       
      end
    join
      begin
            $display ("all parent gets executed");
      end
  end
endmodule

           
