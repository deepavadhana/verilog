module typedef_value_enum;
  typedef enum {Sun,Mon,Tue,Wed,Thur,Fri,Sat}week;
  week day;
initial begin
  $display("CURRENT DAY:%0s,DAYS_VALUE=%0d",day.name(),day);
  day=day.last();
  $display("DAYS:%0s,DAYS_VALUE=%0d",day.name(),day);
  day=day.first();
  $display("DAYS:%0s,DAYS_VALUE=%0d",day.name(),day);
  day=Thur;
  day=day.next();
  $display("DAYS:%0s,DAYS_VALUE=%0d",day.name(),day);
  day=Thur;
  day=day.prev();
  $display("DAYS:%0s,DAYS_VALUE=%0d",day.name(),day);
  
  
  $display("TOTAL NO OF DAYS %0d",day.num());

end
endmodule
