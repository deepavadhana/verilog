// Code your testbench here
// or browse Examples
module casting_datatype;
  bit [3:0] data;
  byte bdata;
  initial begin
    data=4'b1010;
    $display("before casting : %0b",data);
    $display("size before casting : %0d",$size(data));
    bdata=byte'(data);
    $display("After casting : %0b",bdata);
    $display("size After casting : %0d",$size(bdata));
  end
endmodule
    
