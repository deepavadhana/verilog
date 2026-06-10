// Code your design here
module same_element_index;
  int arr[10]='{0,1,4,3,4,1,6,8,8,9};
  int que[$],qsize;
  initial begin
    que=arr.find with(item==item.index);
    //que=arr.find(x) with(x=x.index);
    qsize=que.size;
    $display("same element and index is:",que);
    $display("count of same element and index is : %0d",qsize);
  end
endmodule
  
    
