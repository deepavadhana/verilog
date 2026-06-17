
class transaction;
  static int id;
  byte data;
  static function void disp(int id);
    id=id;
    $display("static function accessing with scoped resolution--id=%0d",id);
  endfunction
  function void auto_disp();
    $display("non staic function cannot be accessed with scoped resolution");
  endfunction
endclass
module scoped_resolution;
  initial begin
    transaction::id=16;
    transaction::disp(transaction::id);
   transaction::data=8'b11010101;------- //non static member cannot be accessed without obj and  with scoped resolution
    transaction::auto_disp();----------- //non static function cannot be accessed without obj and  with scoped resolution
  end
endmodule

ERROR:
"Cannot access non-static class member 'transaction::data' using scope operator '::'." "testbench.sv" 17  21
"Cannot access non-static class member 'auto_disp' using scope operator '::'." "testbench.sv" 18  28
