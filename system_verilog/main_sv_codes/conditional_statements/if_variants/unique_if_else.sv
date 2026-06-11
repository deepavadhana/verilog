module uniqueif_conditions;
  initial begin
    int a;
//case 1:normal condition
    a=10;
    unique if (a>12)
      $display ("a>12");
    else if (a<10)
      $display ("a<10");
    else
      $display ("a<=10");
// case 2: no else and condition is true 
    a=2;
    unique if (a>12)
      $display ("a>12");
    else if (a<10)
      $display ("a<10");
// case 3: no else and no condition is true 
    a=2;
    unique if (a>12)
      $display ("a>12");
    else if (a>10)
      $display ("a>10");
//case 4: multiple conditions are true
     a=2;
    unique if (a<12)
      $display ("a<12");
    else if (a<10)
      $display ("a<10");
    else
      $display("a>=10");
//case 5: unique0 with no condition are true
      a=2;
    unique0 if (a>12)
      $display ("a>12");
    else if (a>10)
      $display ("a>10");
//case 6: unique0 with multiple condition are true
       a=2;
    unique0 if (a<12)
      $display ("a<12");
    else if (a<10)
      $display ("a<10");
  end
    endmodule



| Feature / Condition            | `unique if`                              | `unique0 if`                       |
| ------------------------------ | ---------------------------------------- | ---------------------------------- |
| Meaning                        | Exactly one condition must be true       | Zero or one condition can be true  |
| One condition true             | ✅ Allowed                                | ✅ Allowed                          |
| Multiple conditions true       | ❌ Warning/Error                          | ❌ Warning/Error                    |
| No condition true              | ❌ Warning/Error                          | ✅ Allowed                          |
| Else block mandatory?          | Recommended if all cases must be covered | Optional                           |
| Runtime overlap checking       | ✅ Yes                                    | ✅ Yes                              |
| Detects missing conditions     | ✅ Yes                                    | ❌ No                               |
| Detects overlapping conditions | ✅ Yes                                    | ✅ Yes                              |
| Synthesizable                  | ✅ Yes                                    | ✅ Yes                              |
| Common RTL Usage               | FSM, opcode decoder, mux                 | Optional enables, partial decoders |
