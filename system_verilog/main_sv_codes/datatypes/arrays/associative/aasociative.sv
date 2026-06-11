module associative_arr;
  int arr[*];
  string b[string];
  initial begin
    arr='{1:3,2:10,4:11,16:0};
    b='{"This":"lets","is":"win","true":"together"};
    $display("Size of arr:%0p",arr.size()); 
    $display("Size of arr:%0p",b.size()); 
   
    $display("Array elements:%p",arr);
    foreach(b[i])
      $display("Array elements[%0s]:%0s",i,b[i]); 
    
  end
endmodule
