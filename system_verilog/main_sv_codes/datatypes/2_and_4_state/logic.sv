
module data_types;
  logic a;
  logic [3:0] b;
  initial begin
    $display("Before initialisation :%0b",a);
    $display("Before initialisation :%0b",b);
    a=1;
    b=4'b0101;
    $display("After initialisation :%0b",a);
    $display("After initialisation :%0b",b);
    a=0;
    b=4'b0xz1;
    $display("After initialisation :%0b",a);
    $display("After initialisation :%0b",b);
    a=0;
    b=4'b1xz1;
    $display("After initialisation :%0b",a);
    $display("After initialisation :%0b",b);
  end 
endmodule
