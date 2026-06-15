virtual class animal ;
  string name;
  pure virtual function void sound();
  pure virtual task habitat();
  endclass
    class cat extends animal;
      function void sound();
      $display("cat makes meow sound");
      endfunction
      task habitat();
      $display("cat lives as pet animal");
      endtask
    endclass
     class dog extends animal;
      virtual function void sound();
       $display("dog makes bark sound");
      endfunction
      virtual task habitat();
        $display("dog lives as pet animal");
      endtask
    endclass
     class lion extends animal;
      virtual function void sound();
       $display("lion makes roar sound");
      endfunction
      virtual task habitat();
        $display("lion lives as wild animal");
      endtask
    endclass
      module pure_virtual_func_task;
        cat c;
        lion l;
        dog d;
        animal a;
        initial begin
          c=new();
          l=new();
          d=new();
          a=c;
       a.sound();
       a.habitat();
          a=d;
       a.sound();
       a.habitat();
          a=l;
       a.sound();
       a.habitat();  
       end
      endmodule
        
    
  
