// Code your design here
module array_all_types;
  int static_1d [0:4];
  int static_2d [0:3][0:5];
  int static_3d [0:2][0:3][0:4];
  bit [5:0] packed_array;
  bit [2:0] packed_unpacked_arr [3:0];
  int dynamic_array[];
  int associative_arr[string];
  int queue_arr[$];
  integer i,j,k;
  initial begin
//static 1D array
    for(i=0;i<5;i++) begin
      static_1d[i]=i*5;
    end
    foreach( static_1d[i]) begin
      $display("Static array 1D [%0d]=%0d",i,static_1d[i]);
    end
//static 2D array
    foreach(static_2d[i,j]) begin
      static_2d[i][j]=i*j;
    end
    foreach( static_2d[i,j]) begin
      $display("Static array 2D [%0d][%0d]=%0d",i,j,static_2d[i][j]);
    end
//static 3D array
    foreach (static_3d[i,j,k]) begin
      static_3d[i][j][k]=i+j+k;
    end
    foreach( static_3d[i,j,k]) begin
      $display("Static array 3D [%0d][%0d][%0d]=%0d",i,j,k,static_3d[i][j][k]);
    end
//packed array
    packed_array=6'b101010;
    $display("packed array=%b",packed_array);
    $display ("packed array [5:2]=%b",packed_array[5:2]);
//packed + unpacked array
    packed_unpacked_arr [0]=3'd6;
    packed_unpacked_arr [1]=3'd4;
    packed_unpacked_arr [2]=3'd3;
    packed_unpacked_arr [3]=3'd2;
    foreach(packed_unpacked_arr[i])begin
      $display("packed and unpacked array[%0d]=%0d",i,packed_unpacked_arr[i]);
    end
//dynamic array
    dynamic_array =new[5];
    dynamic_array='{4,6,7,8,5};
    foreach(dynamic_array[i])begin
      $display("Dynamic array[%0d]=%0d",i,dynamic_array[i]);
    end
    dynamic_array = new[8](dynamic_array);
    $display("After resizing dynamic array[%0d]=%0d",i,dynamic_array[i]);
    $display("size of dynamic array %0d",dynamic_array.size());
//associative array
    associative_arr["blue"]=10;
    associative_arr["green"]=20;
    associative_arr["yellow"]=30;
    associative_arr["red"]=40;
    $display("Associative array : blue=%0d",associative_arr["blue"]);
    $display("Associative array : yellow=%0d",associative_arr["yellow"]);
    $display("Associative array : red=%0d",associative_arr["red"]);
    if(associative_arr.exists("blue") )begin
       $display("Associative array : blue exists");
    end
//queue
       queue_arr.push_back(10);
       queue_arr.push_back(20);
       queue_arr.push_back(30);
       queue_arr.push_back(40);
       $display("queue array =%p",queue_arr);
       $finish;
       end
       endmodule
