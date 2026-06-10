module casting_datatype;
  logic [3:0] data;
  byte bdata;
  initial begin
    data=4'b1x1z;
    $display("before casting : %0b",data);
    $display("size After casting : %0d",$size(data));
    bdata=byte'(data);
    $display("After casting : %0b",bdata);

    $display("After casting : %0d",bdata);
    $display("size After casting : %0d",$size(bdata));
  end
endmodule
