// Code your design here

module arr_unpacked;
  byte arr [4:0][2:0]='{'{5'b10101,5'b10001,5'b10010},'{5'b11111,5'b10000,5'b00001},'{5'b10101,5'b10001,5'b10010},'{5'b11111,5'b10000,5'b00001},'{5'b11111,5'b10000,5'b00001}};
  initial begin
    foreach(arr[i,j])begin
      $display("Array elements: arr[%0d][%0d]=%0d",i,j,arr[i][j]);
    end
  end
    
endmodule
