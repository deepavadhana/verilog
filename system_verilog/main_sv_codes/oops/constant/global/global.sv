class transaction;
  bit [31:0] data;
  const int id=6;//global constant value declared and locked forever
  function new();
    data = 100;
    //id = 1; //this may bring err 
  endfunction
  
  function void display();
    $display("data = %0d and id = %0d", data, id);
  endfunction
endclass

module class_example;
  transaction tr;
  
  initial begin
    tr = new();
    tr.data = 200;
   // tr.id=9;//this will be err
    tr.display();
  end
endmodule
