// Code your design here
module array_ordering;
  int arr [8]='{5,6,7,8,2,3,1,4};
  int que[$];
  initial begin
    que.push_back(45);
    que.push_back(26);
    que.push_back(85);
    que.push_back(36);
    que.push_back(15);
    que.push_back(16);
    $display ("QUEUE ELEMENTS-ARRAY ORDERING METHOD");
    arr_que_elements();
    $display("Shuffled Array and Queue elements");
    arr_que_shuffle();
    arr_que_elements();
    $display("Sorted Array and Queue elements");
    arr_que_sort();
    arr_que_elements();
    $display("Resorted Array and Queue elements");
    arr_que_rsort();
    arr_que_elements();
    $display("Reversed Array and Queue elements");
    arr_que_rev();
    arr_que_elements();
  end
   function void arr_que_elements();
      $display("Array elements are :%p",arr);
      $display("Queue elements are :%p",que);
    endfunction
    function void arr_que_shuffle();
      arr.shuffle();
      que.shuffle();
    endfunction
    function void arr_que_sort();
      arr.sort();
      que.sort();
    endfunction
    function void arr_que_rsort();
      arr.rsort();
      que.rsort();
    endfunction
    function void arr_que_rev();
      arr.reverse();
      que.reverse();
    endfunction
    endmodule
