
module union_packed;
  typedef union packed{
    byte id;
    byte data;
  }employee;
  initial begin
    employee e1,e2;
    e1.id=28;
    e1.data=8'h23;
    $display("Employee :%0d %0d",e1.id,e1.data);
    e2.id=21;
    e2.data=8'h33;
    $display("Employee :%0d %0d",e2.id,e2.data);
    $display("size of union %0d",$bits(employee));
  end
endmodule
//here the output is 35 35 
                   //51 51
//why this is happened means the union will take the largest size of the property as the mem and 
//allocate it so here the id and data is compared and here the data has more value which is 35 in decimal hence this is declared as the entire size of the union
//again in second assignment , data is bigger so it is assigned 
