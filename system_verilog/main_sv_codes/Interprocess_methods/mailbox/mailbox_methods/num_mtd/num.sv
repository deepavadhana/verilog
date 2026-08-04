class A;
  int a;
  mailbox mb;
  function new(mailbox mb);
    this.mb=mb;
  endfunction
  task trans();
    for(int i=0;i<10;i++)begin
        a++;
      mb.put(a);
      $display("Mailbox created ");
      $display("transmission of data =%0d",a);
      $display("No of msgs :%0d ",mb.num());
      end
      
  endtask
endclass
  module new_mtd;
    A a1;
    mailbox m=new();
    initial begin
      a1=new(m);
      repeat(10) begin
      a1.trans();
      end
    end
  endmodule
               
