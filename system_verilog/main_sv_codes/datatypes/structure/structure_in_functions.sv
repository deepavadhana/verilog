module struct_in_function;
  typedef struct{ 
    string name;
    int id;
    byte data;
  }emp;
  
  function void print(emp e);
      $display("Emp details: %p",e);
    endfunction
  function emp student(string name,int id,byte data);
        emp e;
        e.name=name;
        e.id=id;
        e.data=data;
        return e;
      endfunction
      initial begin
        emp ea,eb;
        
        ea=student("Deepa",11,8'b10001110);
        eb=student("Chitra",13,8'b11101110);
        print(ea);
        print(eb);
      end
      endmodule
        
        
  
