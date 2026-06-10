module casting_datatype;
  real data;
  int bdata;
  initial begin
    data=134567.87;
    $display("before casting : %0b",data);
    $display("size before casting : %0d",$bits(data));
    bdata=int'(data);
    $display("After casting : %0b",bdata);

    $display("After casting : %0d",bdata);
    $display("size After casting : %0d",$size(bdata));
  end
endmodule
