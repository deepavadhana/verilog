class A;
  string s;
  string p;
  mailbox #(string) mb;
  function new(mailbox #(string) mb);
    this.mb=mb;
  endfunction 
  task put_mtd();
    s="India";
    p="chennai";
    mb.put(s);
    mb.put(p);
    $display("Transmission of data=%0s %0s",s,p);
     s="Canada";
    p="Sasketchuvan";
    mb.put(s);
    mb.put(p);
    $display("Transmission of data=%0s %0s",s,p);
    s="France";
    p="Paris";
    mb.put(s);
    mb.put(p);
    $display("Transmission of data=%0s %0s",s,p);
  endtask
endclass
  class B;
    string s;
  string p;
  mailbox #(string) mb;
  function new(mailbox #(string) mb);
    this.mb=mb;
  endfunction 
  task get_mtd();
    mb.get(s);
    mb.get(p);
    $display("Recieving of data=%0s %0s",s,p);
  mb.get(s);
    mb.get(p);
    $display("Recieving of data=%0s %0s",s,p);
  mb.get(s);
    mb.get(p);
    $display("Recieving of data=%0s %0s",s,p);
 mb.get(s);
 mb.get(p);
    $display("Recieving of data=%0s %0s",s,p);
  endtask
  endclass
module parameterised_mailbox;
  A a1;
  B b1;
  mailbox #(string) m=new();
  initial begin
    a1=new(m);
    b1=new(m);
    repeat(1) begin
      a1.put_mtd();
      b1.get_mtd();
    end
  end
endmodule
