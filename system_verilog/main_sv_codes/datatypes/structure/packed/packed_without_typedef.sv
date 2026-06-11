module structure;
 struct packed{
     int id;
  logic[3:0] data;
   byte addr;}e1;
initial begin
  
  e1.id=12;
  e1.data=4'b0101;
  e1.addr=8'd64;
  $display("employee 1: %0d %0b %0d",e1.id,e1.data,e1.addr);
  e1.id=11;
  e1.data=4'b0111;
  e1.addr=8'd14;
  $display("employee 2: %0d %0b %0d",e1.id,e1.data,e1.addr);
   end
   endmodule
