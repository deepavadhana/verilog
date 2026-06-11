// Code your design here
module arr_packed_unpacked_combined;
  bit [3:0]arr[2:0][3:0]='{'{4'b0000,4'b1010,4'b1111,4'b1010},'{4'b0000,4'b1010,4'b1111,4'b1010},'{4'b0000,4'b1010,4'b1111,4'b1010}};
  initial begin
    foreach(arr[i,j])
      $display("Array elements:arr[%0d][%0d]=%0d",i,j,arr[i][j]);
  end
  
endmodule
