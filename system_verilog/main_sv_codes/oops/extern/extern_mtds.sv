
class transaction ;
  int id;
  byte data;
  extern function void display();
  extern task void data_display();
  endclass
    function void transaction::display();
      $display("using extern function--id=%0d",id);
               endfunction
 task transaction::data_display();
   $display("using extern task--data=%0b",data);
            endtask
               
   module transaction_extern;
     initial begin
     transaction tr;
       tr=new();
     tr.id=10;
     tr.data=8'b10101000;
     tr.display();
     tr.data_display();
     end
   endmodule
     
      
