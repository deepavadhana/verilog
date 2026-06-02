// Code your design here
module break_continue;
  int arr[10];
int i;
  initial begin
   foreach(arr[i])begin
  if(i==3) begin
   continue;
  $display("continuing the array");
  end
  if(i==8) begin
     break;
  $display("breaking the array");
  end
  arr[i] = i;
      $display("array[%0d]=%0d",i,arr[i]);
    end
  end
  
endmodule
