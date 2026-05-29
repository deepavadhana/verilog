// Code your design here
module all_loops;
  int arr[5]='{10,20,30,40,50};
  int i,j,k,count;
  initial begin
     //for loop
    for(int i=0;i<($size(arr));i=i+1) begin
      if(i==2)begin
        $display("i=%0d",i);
       continue;
      end
      if(i==4)begin
        $display("i=%0d",i);
       break;
      end
      $display("for loop:i=%0d",i);
    end
    //foreach loop
    foreach(arr[i])begin
      if(arr[i]==30)begin
        $display("value=%0d",arr[i]);
        continue;
      end
      if (arr[i]==50) begin
        $display("value=%0d",arr[i]);
        break;
      end 
      $display("foreach loop:value=%0d",arr[i]);
    end
    //while loop
    j=0;
    while(j<6)begin
      j++;
      if(j==2) begin
       $display("j=%0d",j);
       continue;
       end 
       if(j==5) begin
        $display("j=%0d",j);
        break;
        end
      $display("while loop :j=%0d",j);
      end
    //do while loop
    k=0;
    do begin 
        k++;
        if(k == 2) begin
        $display("k=%0d",k);
        continue;
         end
         if(k == 4) begin
         $display("k=%0d",k);
         break;
         end
      $display("do while loop: k=%0d", k);
         end
         while(k < 10);
    //repeat loop
      count=0;
    repeat(5) begin
      count++;
      if(count==2)begin
        $display("count=%0d",count);
        continue;
        end
       if(count==4)begin
        $display("count=%0d",count);
        break;
        end
      $display("repeat loop: count=%0d",count);
    end
    //forever loop
     count=0;
    forever begin
      #5;
      count++;
      if(count==2)begin
        $display("count=%0d time=%0t",count,$time);
        continue;
        end
       if(count==4)begin
         $display("count=%0d time=%0t",count,$time);
         break;
         end
         $display("forever loop: count=%0d time=%0t",count,$time);
         end
        $finish;
        end
        endmodule
      
      
    
