class A;
  int a;
  mailbox mb;
  function new(mailbox mb);
    this.mb=mb;
  endfunction
  task load();
    for(int i=0;i<10;i++)begin
        a++;
      mb.put(a);
      $display("Mailbox created ");
      $display("transmission of data =%0d",a);
      $display("No of msgs :%0d ",mb.num());
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
    for(int i=0;i<10;i++)begin
        a++;
      mb.peek(a);
      $display("Peeking of data =%0d",a);
      $display("No of msgs :%0d ",mb.num());
      end
  endtask
task recieve();
    begin
      mb.get(a);
      $display("Recieving of data =%0d",a);
      $display("No of msgs :%0d ",mb.num());
      end
     endtask
endclass
  module peek_mtd;
    A a1;
    B b1;
    mailbox m=new();
    initial begin
      a1=new(m);
      b1=new(m);
      repeat(10) begin
      a1.load();
        b1.trans();
        b1.recieve();
      end
    end
  endmodule
               
