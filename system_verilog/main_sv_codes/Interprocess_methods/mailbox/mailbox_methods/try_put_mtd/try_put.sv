class A;
  int a;
  mailbox mb;
  function new(mailbox mb);
    this.mb=mb;
  endfunction
  task load();
    for(int i=0;i<3;i++)begin
        a++;
      if(mb.try_put(a))begin
      $display("Mailbox created ");
      $display("transmission of data =%0d",a);
    end
      else 
        $display("NO transmission data");
      
    end
      
  endtask
endclass
class B;
  int a;
  mailbox mb;
  function new(mailbox mb);
    this.mb=mb;
  endfunction
  task trans();
    begin
      mb.get(a);
      $display("Recieving of data =%0d",a);
      $display("No of msgs :%0d ",mb.num());
      end
      endtask
endclass
  module try_put_mtd;
    A a1;
    B b1;
    mailbox m=new();
    initial begin
      a1=new(m);
      b1=new(m);
      repeat(10) begin
      a1.load();
      b1.trans();
      end
    end
  endmodule
               
