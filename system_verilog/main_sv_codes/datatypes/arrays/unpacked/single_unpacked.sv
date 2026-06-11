module single_unpacked;
  bit a[3];
  int b[15];
  byte c[7];
  initial begin
    a='{4,5,0}; //only the lsb bit is returned as bit is 1 bit
    foreach(b[i])begin
      b[i]=$urandom_range(6,16);
    end
    c='{3,4,5,6,784,1,16};//here the 784 is coverted to binary and only 8 bit fom lsb is returned as we use byte
    $display("Array elements:%p %p %p",a,b,c);
    foreach(a[i])
      $display("Array elements[%0d] : [%0d]",i,a[i]);  
    foreach(b[i])
      $display("Array elements[%0d] : [%0d]",i,b[i]);  
    foreach(c[i])
      $display("Array elements[%0d] : [%0d]",i,c[i]);  
  end
endmodule
