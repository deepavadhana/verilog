
class parent;
  int a,b;
  int c;
  int d=6;
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
  module public_var_ex;
    initial begin
      parent p;
      child c;
      int e;
      p=new();
      c=new();
     
      c.d=8;
      
      e=p.display(4,5);
      p.displ();
      c.disp();
    end
  endmodule
//here the o/p is value of c=9,value of d=6
              // value of c=0,value of d=8
//as we created both parent and child object seperately the value of c is 0 in child
//so if we want its value then we need to declare obj of child cls and access it
