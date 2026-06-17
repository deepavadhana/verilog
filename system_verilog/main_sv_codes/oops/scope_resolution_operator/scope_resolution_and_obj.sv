
class transaction;
  static int id;
  byte data;
  static function void disp(int id);
    id=id;
    $display("static function accessing with scoped resolution--id=%0d",id);
  endfunction
  function void auto_disp();
    $display("non staic function cannot be accessed with scoped resolution hence accessed with the object --data =%0b",data);
  endfunction
endclass
module scoped_resolution;
  initial begin
    transaction tr;
    tr=new();
    transaction::id=16;
    transaction::disp(transaction::id);
    tr.data=8'b10101011;
    tr.auto_disp();
   end
endmodule
