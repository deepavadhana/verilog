
class A;
  int a;
  int i;
  mailbox m;
  function new(mailbox m);
    this.m=m;
  endfunction
  task load();
    begin
      for(i=0;i<10;i++)begin
      a++;
        m.put(a);
        $display("Transmission of data=%0d",a);
      end
    end
  endtask
endclass
class B;
  int a;
  mailbox m;
  function new(mailbox m);
    this.m=m;
  endfunction
  task recieve();
    begin
      m.get(a);
      $display("Recieved data=%0d",a);
    end
  endtask
endclass
module unbounded_mailbox;
  A a1;
  B b1;
  mailbox mb=new();
  initial begin
    a1=new(mb);
    b1=new(mb);
    repeat(10) begin
      a1.load();
      b1.recieve();
    end
  end
endmodule
  
