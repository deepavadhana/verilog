// Code your testbench here
// or browse Examples
class error;
  bit [3:0] err_data;
  int err_id;
  function new(bit [3:0] err_data,int err_id);
    this.err_data=err_data;
    this.err_id=err_id;
  endfunction
endclass
class transaction;
  bit [3:0] trans;
  error err;
  function new();
    trans=4'b1010;
    err=new(4'b1111,43);
  endfunction
  function void display();
    $display("trans:%0b,error:err_data=%0d,err_id=%0d",trans,err.err_data,err.err_id);
  endfunction
  function deep_copy(transaction copy);
    this.trans=copy.trans;
    this.err.err_data=copy.err.err_data;
    this.err.err_id=copy.err.err_id;
  endfunction
endclass
  module deep_copy_mtd;
    transaction tr1,tr2;
    initial begin
    tr1=new();
    $display("Displaying tr1 and tr2 -tr2 is copy of tr1");
    $display("displaying tr1");
    tr1.display();
    tr2=new();
    tr2.deep_copy(tr1);
    $display("displaying tr2");
    tr2.display();
    $display("changing only properties of tr1 and tr2");
    tr1.trans=4'b1010;
    tr2.trans=4'b1100;
    $display("Before changes err in tr1");
    tr1.display();
    $display("Before changes err in tr2");
    tr2.display();
    tr1.trans=4'b1000;
    tr1.err.err_data=4'b1110;
    tr1.err.err_id=56;
    $display("After changes of err in tr1 ,err in tr2 also will be changed but tr2 properties remains same");
    $display("changes in tr1");
    tr1.display();
    $display("changes in tr2");
    tr2.display();
    tr2.err.err_data=4'b0010;
    tr2.err.err_id=16;
    $display("After changes of err in tr2 ,err in tr1 alone will be changed");
    $display("changes in tr2");
    tr2.display();
    $display("changes in tr1");
    tr1.display();
    end
    endmodule
