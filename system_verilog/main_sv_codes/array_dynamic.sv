// Code your design here
module dynamic_array;
  int arr[];
  initial begin
    arr=new[5];
    arr='{2,3,4,5,5};
    foreach(arr[i])
    $display("Array elements to display: arr[%0d]=%0d",i,arr[i]);
    arr=new[8](arr);
    foreach(arr[i]) begin
    $display("Array elements to display after resizing: arr[%0d]=%0d",i,arr[i]);end
    $display("Array size: %0d",arr.size());
    arr=new[6];
    foreach(arr[i]) begin
    $display("Array elements to display after resizing: arr[%0d]=%0d",i,arr[i]);end
    $display("Array size: %0d",arr.size());
    
  end
endmodule
