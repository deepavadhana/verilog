// Code your design here
module priority_if_condition;
  initial begin
    int a;
    //case 1 : normal condition
    a=2;
    priority if (a<10)
      $display("a<10"); 
    else if (a>12)
      $display("a>12");
    else 
      $display("a>20");
    //case 2: no condition is true
    a=2;
    priority if (a>10)
      $display("a>10"); 
    else if (a>12)
      $display("a>12");
    else 
      $display("a>20");
    //case 3: no condition is true and no else block
    a=2;
    priority if (a>10)
      $display("a>10"); 
    else if (a>12)
      $display("a>12");
    //case 4 : condition true no else block
    a=2;
    priority if (a<10)
      $display("a<10"); 
    else if (a>12)
      $display("a>12");
    //case 5 : multiple conditions are true
    a=2;
    priority if (a<10)
      $display("a<10"); 
    else if (a<12)
      $display("a<12");
    else 
      $display("a>20");
  end
endmodule

| Feature / Condition                           | `unique if`                                 | `priority if`                        |
| --------------------------------------------- | ------------------------------------------- | ------------------------------------ |
| Main Meaning                                  | Exactly one condition should be true        | Conditions checked in priority order |
| Execution Style                               | Parallel mutual-exclusive logic             | Sequential priority-based logic      |
| One condition true                            | ✅ Allowed                                   | ✅ Allowed                            |
| Multiple conditions true                      | ❌ Warning/Error                             | ✅ Allowed                            |
| Which branch executes when multiple are true? | First true branch executes + overlap error  | First true branch executes only      |
| No condition true + no else                   | ❌ Warning/Error                             | ❌ Warning/Error                      |
| Overlap checking                              | ✅ Yes                                       | ❌ No                                 |
| Missing condition detection                   | ✅ Yes                                       | ✅ Yes                                |
| Priority checking                             | ❌ No                                        | ✅ Yes                                |
| Else block recommended?                       | Yes                                         | Yes                                  |
| Hardware Interpretation                       | Parallel decoder / mutually exclusive logic | Priority encoder                     |
| Compiler Optimization                         | Better parallel optimization                | Maintains priority chain             |
| Common RTL Usage                              | FSM, opcode decoder, mux select             | Interrupt priority, arbitration      |
