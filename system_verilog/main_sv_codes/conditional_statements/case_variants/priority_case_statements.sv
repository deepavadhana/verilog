// Code your design here
module priority_case;
  initial begin
    int a;
//case 1: normal condition
    a=2;
    priority case(a)
      1: $display("1");
      2: $display("2");
      3: $display("3");
      default:$display("default");
    endcase
//case 2: multiple conditions are true
    a=10;
    priority case(a)
      10: $display("10");
      10: $display("10");
      3: $display("3");
      default:$display("default");
    endcase
//case 3: none of the conditions are true
     a=5;
    priority case(a)
      (a<2): $display("5");
      (a<3): $display("5");
      (a>10): $display("5");
    endcase
  end 
endmodule
