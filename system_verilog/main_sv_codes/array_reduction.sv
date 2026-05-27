// Code your design here
module arr_que_reduction_mtds;
  int arr[8]='{3,4,6,1,2,5,8,9};
  int que[$];
  initial begin 
    que.push_back(44);
    que.push_back(40);
    que.push_back(41);
    que.push_back(48);
    que.push_back(64);
    $display("ARRAY AND QUEUE REDUCTION METHODS");
    arr_que_display();
    $display("AND-array=%0h,queue=%0h", arr.and(),que.and() );
    $display("OR-array=%0h,queue=%0h", arr.or(),que.or() );
    $display("XOR-array=%0h,queue=%0h", arr.xor(),que.xor() );
    $display("SUM-array=%0d,queue=%0d", arr.sum(),que.sum() );
    $display("PRODUCT-array=%0d,queue=%0d", arr.product(),que.product() );
    
  end
  
    function void arr_que_display();
      $display("Array=%p",arr);
      $display("Queue=%p",que);
    endfunction
    
endmodule
  
