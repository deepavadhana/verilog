module struct_typedef;
  typedef struct{
    shortint age;
    string data;
    byte id;
  }format;
  format details;
  initial begin
    details.data="DEEPA";
    details.id=0011;
    details.age=18;
    $display("Details name=%0s",details.data);
    $display("Details id=%0d",details.id);
    $display("Details age=%0d",details.age);
    $display("size of datatypes used",$bits(details));
  end
endmodule
