class parent;
  int a,b;
  local int c;
  local int d=6;
  function int display(int r,int p);
    c=r+p;
    return c;
  endfunction
local function void displ();
    $display("value of c=%0d,value of d=%0d",c,d);
  endfunction
endclass
class child extends parent;
  function void disp();
    displ();//this cant be done as the local function cannot be accessed in child class 
    $display("value of c=%0d,value of d=%0d",c,d);
  endfunction
endclass
  module local_var_ex;
    initial begin
      parent p;
      int e;
      p=new();
      e=p.display(4,5);
      p.displ();//this too leads to error
      end
  endmodule
      
