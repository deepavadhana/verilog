// Code your testbench here
// or browse Examples
module single_packed;
  bit [3:0]abc;
  int pqr;
  byte xyz;
  initial begin
    abc= 4'b0110;
    pqr=67;
    xyz=8'b00111000;
    $display("abc=%0d",abc);
    $display("pqr=%0d",pqr);
    $display("xyz=%0d",xyz);
    foreach(abc[i])
      $display("abc[%0d]=%0b",i,abc[i]);
    foreach(pqr[i])
      $display("pqr[%0d]=%0b",i,pqr[i]);
    foreach(xyz[i])
      $display("xyz[%0d]=%0b",i,xyz[i]);
  end
endmodule
