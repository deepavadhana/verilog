
module set_value_enum;
  enum {Sun=0,Mon,Tue,Wed=6,Thur,Fri=9,Sat}days;
initial begin
  days=days.first;
  for(int i=0;i<11;i++)begin
  $display("DAYS:%0s,DAYS_VALUE=%0d",days.name,days);
  days=days.next;
  end
end
endmodule
