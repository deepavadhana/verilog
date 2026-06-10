
module casting_datatype;
  integer data;
  int bdata;
  initial begin
    data=8'b0x1011z0;
    $display("before casting : %0b",data);
    $display("size After casting : %0d",$size(data));
    bdata=int'(data);
    $display("After casting : %0b",bdata);

    $display("After casting : %0d",bdata);
    $display("size After casting : %0d",$size(bdata));
  end
endmodule
