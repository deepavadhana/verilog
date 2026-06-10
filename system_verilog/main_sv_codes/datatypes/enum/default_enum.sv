module default_value_enum;
  enum {Sun,Mon,Tue,Wed,Thur,Fri,Sat}days;
initial begin
  days=days.first;
  for(int i=0;i<7;i++)begin
  $display("DAYS:%0s,DAYS_VALUE=%0d",days.name,days);
  days=days.next;
  end
end
endmodule
