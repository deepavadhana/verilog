//here scope resolution is used only to access the static functions/members not the non static functions/members
//because the static are belong to the class itself so it doesnt need any object to access it directly :: can be used to access it  
class transaction;
  static int id;//static member
  byte data;
  static function void disp(int id);//static function
    id=id;
    $display("static function accessing with scoped resolution--id=%0d",id);
  endfunction
  function void auto_disp();
    $display("non staic function cannot be accessed with scoped resolution");
  endfunction
endclass
module scoped_resolution;
  initial begin
    transaction::id=16;//here the static member is only accessed using scope resolution 
    transaction::disp(transaction::id);//here static function is alone accessed by the scope resolution
  end
endmodule
    
//see the next code 
