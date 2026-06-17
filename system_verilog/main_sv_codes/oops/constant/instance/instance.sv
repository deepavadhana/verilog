class transaction;
  bit [31:0] data;
  const int id;//instant constant no value declared-will be declared later
  function new();
    data = 100;
    id = 1; //value declared here hence afer this declarartion the id is locked and cannot be changed back
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
  //tr.id=9;  //this will be err
    tr.display();
  end
endmodule
