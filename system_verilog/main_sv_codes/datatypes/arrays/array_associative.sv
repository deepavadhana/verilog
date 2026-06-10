// Code your design here
module associative_array;
  bit [7:0] arr [int];
  int index;
  initial begin 
    arr[5]=2;
    arr[6]=3;
    arr[2]=0;
    arr[4]=12;
    arr[3]=14;
    arr[1]=11;
    arr[8]=16;
    
    foreach (arr[i]) begin
      $display("Array elements :array[%0d] = %0d", i, arr[i]);
    end
      $display("Array size : %0d",arr.size());
    $display("Number of elements in array : %0d",arr.num());
    index=6;
    $display("Previous index of arr : %0d",arr.prev(index));
    $display("Next index of arr : %0d",arr.next(index));
    arr.delete();
    $display("Delete array");
    if(arr.exists(3))
      $display("Element exists in array");
    else
      $display("Element does not exists in array");
  end
endmodule
    
    
    
  
  
