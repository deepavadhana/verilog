//here as i assigned string and id to the childA class the values will not get update to the parent class and childA as the childA extends parent class 
//and the childB gets updated because childA contains the string and id so it consider it as its parent class so it display the o/p,
//so the better way is dont assign same properties to the extending child classes
class parent_class;
  string str;
  int id;
  function void display1();
    $display("parent class : str=%0s , id=%0d",str,id);
  endfunction
endclass
class childA extends parent_class;
  string str;
  int id;
  function void displayA();
    $display("childA class : str=%0s , id=%0d",str,id);
  endfunction
endclass
class childB extends childA;
  function void displayB();
    $display("childB class : str=%0s , id=%0d",str,id);
  endfunction
endclass
class childC extends childB;
  function void displayC();
    $display("childC class : str=%0s , id=%0d",str,id);
  endfunction
endclass
module inheritance;
  childC c;
  initial begin
    c=new();
    c.str="DEEPA";
    c.id=11;
    c.displayB();
    c.displayA();
    c.display1();
    c.displayC();
    
  end
endmodule
    
