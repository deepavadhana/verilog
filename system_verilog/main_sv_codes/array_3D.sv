// Code your design here
module array_3_D ;
  int arr[4][4][4] ='{'{'{2,4,5,6},'{3,5,4,6},'{3,6,7,7},'{1,5,6,3}},
                      '{'{2,4,9,6},'{3,5,2,6},'{3,6,5,7},'{1,5,0,3}},
                      '{'{2,4,5,6},'{3,5,4,6},'{3,6,7,7},'{1,5,6,3}},
                      '{'{2,4,5,6},'{3,5,4,6},'{3,6,7,7},'{1,5,6,3}}};
  initial begin
  foreach(arr[i,j,k])begin
    $display("Array elements : arr[%0d][%0d][%0d]=%0d",i,j,k,arr[i][j][k]);
  end
  end
endmodule
