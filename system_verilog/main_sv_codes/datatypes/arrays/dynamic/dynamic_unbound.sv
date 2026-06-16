module dynamic_arr_unbound;
  byte arr[];
  initial begin
    arr=new[6];
    arr='{2,5,6,7,8};
    $display("Array elements:%p",arr);
    foreach(arr[i]) begin
      $display("Array elements[%0d]:%0d",i,arr[i]);
    end
  $display("Size of Array elements:%0d",arr.size());
    $display("Array element at index:%0d",arr[3]);
    $display("Array element at index:%0d",arr[100]);//unbounded index so warning msg will be given
  end
endmodule
