module arr_find_mtd;
  string arr[6]={"deepa","chitra","guna","sumitra","yazhini","swami"};
  string result[$];
  string check;
  int a[$];
  initial begin
    result=arr.find(check) with (check<"guna");
    $display("Array find 1 :%p",result);
    a=arr.find_index(check) with (check>"guna");
    $display("Array find 2 :%p",a);
    result=arr.find_first(check) with (check>"guna"&&check<"yazhini");
    $display("Array find 3 :%p",result);
    a=arr.find_first_index(check) with (check>"guna"&&check<"yazhini");
    $display("Array find 4 :%p",a);
    result=arr.find_last(check) with (check<"sumitra"&&check>"deepa");
    $display("Array find 5 :%p",result);
    a=arr.find_last_index(check) with (check<"guna");
    $display("Array find 6 :%p",a);
  end
  endmodule
    
  
