module structure;
typedef struct packed{
     int id;
  logic[3:0] data;
  byte addr;}employee;
initial begin
  employee e1,e2;
  e1.id=12;
  e1.data=4'b0101;
  e1.addr=8'd64;
  $display("employee 1: %0d %0b %0d",e1.id,e1.data,e1.addr);
  e2.id=11;
  e2.data=4'b0111;
  e2.addr=8'd14;
  $display("employee 2: %0d %0b %0d",e2.id,e2.data,e2.addr);
   end
   endmodule
