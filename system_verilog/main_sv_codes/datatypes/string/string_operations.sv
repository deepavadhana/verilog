module string_operations;
  string str1= "DEEPAvadhana";
  string str2="deepavadhana";
  initial begin
    if (str1==str2)
      $display("Both string are equal");
    else
      $display("Both string are unequal");
    if(str1!==str2)
      $display("Both string are unequal");
    else
      $display("Both string are equal");
    if(str1>str2)
      $display("String1 is greater");
    if(str1<str2)
      $display("String2 is greater");
    if(str1>=str2)
      $display("String1 is equal or greater");
    if(str1<=str2)
      $display("String2 is equal or greater");
    $display("Concatenate both strings :%0s",{str1,str2});
    $display("Replication of str1 :%0s",{2{str1}});
  end
endmodule
    
    
    
    
