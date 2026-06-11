// Code your design here
module unique_case;
  initial begin
    int a;
//case 1: normal condition
    a=2;
    unique case(a)
      1: $display("1");
      2: $display("2");
      3: $display("3");
      default:$display("default");
    endcase
//case 2: multiple conditions are true
    a=10;
    unique case(a)
      10: $display("10");
      10: $display("10");
      3: $display("3");
      default:$display("default");
    endcase
//case 3: none of the conditions are true
     a=5;
    unique case(a)
      (a<2): $display("5");
      (a<3): $display("5");
      (a>10): $display("5");
    endcase
  end 
endmodule

| Feature / Condition                      | `unique case`                                  | `priority case`                      |
| ---------------------------------------- | ---------------------------------------------- | ------------------------------------ |
| Main Meaning                             | Exactly one case item should match             | Case items checked in priority order |
| Hardware Style                           | Parallel decoder / mutually exclusive logic    | Priority encoder logic               |
| One matching item                        | ✅ Allowed                                      | ✅ Allowed                            |
| Multiple matching items                  | ❌ Warning/Error                                | ✅ Allowed                            |
| Which item executes when multiple match? | First matching item executes + overlap warning | First matching item executes only    |
| No matching item + no default            | ❌ Warning/Error                                | ❌ Warning/Error                      |
| Overlap checking                         | ✅ Yes                                          | ❌ No                                 |
| Priority checking                        | ❌ No                                           | ✅ Yes                                |
| Missing match detection                  | ✅ Yes                                          | ✅ Yes                                |
| Default recommended?                     | Yes                                            | Yes                                  |
| Compiler Optimization                    | Parallel optimization possible                 | Maintains priority chain             |
| RTL Usage                                | FSM, opcode decoder, mux select                | Interrupt priority, arbitration      |
