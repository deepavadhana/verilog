
class A;
  int a;
  int i;
  mailbox mb;
  function new(mailbox mb1);
    this.mb=mb1;
  endfunction
  task loop_trans();
    for(i=0;i<3;i++) begin
      if(mb.num()>=2)begin
        $display("mailbox is full");
    end
      else begin
        a++;
        mb.put(a);
        $display("Transmission of data: %0d",a);
      end
    end
  endtask
endclass
  class B;
    int a;
    int i;
    mailbox mb;
    function new (mailbox mb2);
      this.mb=mb2;
      endfunction
      task rec_loop();
        begin
        mb.get(a);
        $display("Recieved data=%0d",a);
        end
      endtask
      endclass
      module mailbox_class;
        A a1;
        B b1;
        mailbox m=new(2);
        initial begin
          a1=new(m);
          b1=new(m);
          repeat(3) begin
            a1.loop_trans();
            b1.rec_loop();
          end
        end
      endmodule
          
          
          
    
