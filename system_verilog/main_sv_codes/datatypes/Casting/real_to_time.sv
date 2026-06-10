module casting_datatype;
  real data;
  time tdata;
  initial begin
    data=8.095;
    $display("before casting : %0.3f",data);
    $display("size After casting : %0d",$size(data));
    tdata=time'(data);

    $display("After casting : %0t",tdata);
    $display("size After casting : %0d",$size(tdata));
  end
endmodule
