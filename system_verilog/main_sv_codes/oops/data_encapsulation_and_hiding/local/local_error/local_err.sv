class parent;
  int a,b;
  local int c;
  local int d=6;
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
  module local_var_ex;
    initial begin
      parent p;
      int e;
      p=new();
      e=p.display(4,5);
      p.displ();//cant access the local variable  c and d outside the class
      
    end
  endmodule
      
