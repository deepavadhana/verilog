// Code your design here
module rand_case_mtd;

  initial begin
    for(int i=0;i<10;i++)begin
      randcase 
      0: $display("data0");
      1: $display("data1");
      2: $display("data2");
      3: $display("data3");
      endcase
    end
  end
endmodule
