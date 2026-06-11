module multi_unpacked;
  byte arr[2][3];
  int b[2:0][3:0];
  initial begin
    arr='{'{4,3,2},'{2,3,1}};
    foreach(b[i,j])begin
      b[i][j]=$urandom_range(100,105);
    end
    $display("Array elements=%p %p",arr,b);
      
    foreach(arr[i,j])begin
      $display("Array elements [%0d][%0d]=[%0d]",i,j,arr[i][j]);
    end
    foreach(b[i,j])begin
      $display("Array elements [%0d][%0d]=[%0d]",i,j,b[i][j]);
    end
  end
endmodule
