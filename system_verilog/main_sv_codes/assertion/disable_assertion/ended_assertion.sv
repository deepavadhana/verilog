// Code your testbench here
// or browse Examples
module seq;
  bit clk,d,k;
  always #5 clk=~clk;
  initial begin
    clk=0;
    #5;d=0;
    #5;k=0;
    #5;d=1;
    #5;k=0;
    #5;d=0;
    #5;k=1;
    #5;d=1;
    #5;k=1;
    #10;
    $finish;
  end
  sequence seqA;
    @(posedge clk) 
        d;
  endsequence
   sequence seqB;
    @(posedge clk) 
        ##4 k;
  endsequence
  
  property pr;
    @(posedge clk) seqA.ended|->##4 seqB.ended;
  endproperty
  time_a: assert property(pr)
    $info ("Pass");
    else
      $error("Fail");
    endmodule

    Clock1
│
├── seq_1 ends (d = 1)
│
├── Wait 4 clocks (##4)
│
Clock2
Clock3
Clock4
Clock5
│
├── seq_2 starts
│
├── Wait 4 clocks (##4 inside seq_2)
│
Clock6
Clock7
Clock8
Clock9
│
└── k = 1
    seq_2 ends
    
