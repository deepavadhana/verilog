

class parent;
  int a,b;
  protected int c;
  protected int d=6;
  function int display(int r,int p);
    c=r+p;
    return c;
  endfunction
  function void displ();
    $display("value of c=%0d,value of d=%0d",c,d);
  endfunction
endclass
class child extends parent;
  function void disp();
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
     
     // c.d=8;here we cant access the protected variable of the parent with help of the child object 
      
      
      e=p.display(4,5);
      p.displ();
      c.disp();
    end
  endmodule
