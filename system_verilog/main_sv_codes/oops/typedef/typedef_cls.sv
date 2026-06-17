typedef class fruit2;//forward declarartion -that is the cls is declared firstly but not its def -this may lead to err ,hence using typedef its definition is given later which is safe
  class fruit1;
    fruit2 f;
  endclass
  class fruit2;
    fruit1 f;
  endclass
  module typedef_type;
    initial begin
      fruit1 obj1;
      fruit2 obj2;
      obj1=new();
      obj2=new();
      $display("typedef class-avoid compile error");
      obj1.f=obj2;
      obj2.f=obj1;
     $display("obj1.f = %p", obj1.f);
     $display("obj2.f = %p", obj2.f);
      
    end
      endmodule
