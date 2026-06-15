class packet;
 string a;
 int b;
 virtual task  display();
 a="deepa";
 b=4;
$display("a=%0s,b=%0d",a,b);
 endtask 
endclass
class pack extends packet;
  string c;
  int d;
 task display();
 c="guna";
 d=8;
 $display("c=%0s,d=%0d",c,d);
 endtask
endclass
module virtual_task;
  packet p1;
  pack p2;
initial begin
   p2=new();
   p1=p2;
   $display("contents of p1");
   p1.display();
  end
endmodule
