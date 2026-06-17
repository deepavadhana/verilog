class parent;
  int a,b;
  protected int c;
  protected int d=6;
  function int display(int r,int p);
    c=r+p;
    return c;
  endfunction
  protected function void displ();
    $display("value of c=%0d,value of d=%0d",c,d);
  endfunction
endclass
class child extends parent;
  function void disp();
    displ();//this is valid as the protected variables/mtds can be accessed by the child cls ,the rule is protected cannot be accesible outside the class
    $display("value of c=%0d,value of d=%0d",c,d);
  endfunction
endclass
  module protected_var_ex;
    initial begin
      parent p;
      child c;
      int e;
      p=new();
      c=new();
     
     // c.d=8;//this is also not allowed as it is a protected member
      
      
      e=p.display(4,5);
      p.displ();//this is not allowed error at compile time
      c.disp();
    end
  endmodule
