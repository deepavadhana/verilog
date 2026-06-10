module string_mtds;
  string str= "DEEPAvadhana";
  string duplicate="deepavadhana";
  string temp;
  initial begin
    $display("String length: %0d",str.len());
    $display("Uppercase :%0s",str.toupper());
    $display("Lowercase :%0s",str.tolower());
    temp=str;
    temp.putc(7,"t");
    $display("String after putc: %0s",temp);
    $display("String after getc :%0s",str.getc(7));
    $display("String after comparing with duplicate: %0d",str.compare(duplicate));
    $display("String after comparing with duplicate -caseless: %0d",str.icompare(duplicate));
    $display("Substring of str :%0s",str.substr(0,4));
    $display("Substring of str :%0s",str.substr(5,11));
  end
endmodule
    
    
    
    
