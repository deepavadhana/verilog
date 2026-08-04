//we have both unbounded and bounded in new mtd --this is unbounded mailbox
class A;
  int a;
  mailbox mb;
  function new(mailbox mb);
    this.mb=mb;
  endfunction
  task check();
    if (mb==null) begin
      $display("Mailbox not created");
    end
    else begin
      for(int i=0;i<10;i++)begin
        a++;
      mb.put(a);
      $display("Mailbox created ");
      $display("transmission of data =%0d",a);
      end
      end
  endtask
endclass
  module new_mtd;
    A a1;
    mailbox m=new();
    initial begin
      a1=new(m);
      repeat(10) begin
      a1.check();
      end
    end
  endmodule
               
