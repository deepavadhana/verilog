// Code your design here
class seq;
  rand bit [3:0] value;
  rand bit check;
  constraint cons {value== get_value(check);}
  function bit [3:0] get_value(bit check);
    return( check? 'd10:'d20);
  endfunction
endclass
module function_constr;
  seq s=new();
  initial begin
    repeat(10)
      begin
        $display("Value =%0d ,check =%0d",s.value,s.check);
      end
  end
endmodule
