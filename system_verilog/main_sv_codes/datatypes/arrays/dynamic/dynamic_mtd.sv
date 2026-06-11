module dynamic_arr;
  byte arr[];
  initial begin
    arr=new[6];
    arr='{2,5,6,7,8};
    $display("Array elements:%p",arr);
    foreach(arr[i])
      $display("Array elements[%0d]:%0d",i,arr[i]);
    arr.delete();
    
    $display("Size of Array elements after deleting:%0d",arr.size());
  arr=new[7];
  arr='{2,5,6,7,3,4,8};
    $display("Array elements:%p",arr);
    foreach(arr[i])
      $display("Array elements[%0d]:%0d",i,arr[i]);
  end
endmodule
