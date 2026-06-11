// Code your testbench here
// or browse Examples
module multi_packed;
  bit[3:0][2:0]arr;
  initial begin
    arr=12'h342f;
 $display("Array elements=%p",arr);
      foreach(arr[i])begin
      foreach(arr[i,j])begin
      
      $display("Array elements[%0d][%0d]=%0b",i,j,arr[i][j]);
      end
    end
  end
endmodule
  
