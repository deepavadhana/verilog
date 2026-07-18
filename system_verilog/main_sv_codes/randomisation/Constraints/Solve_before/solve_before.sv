class seq;
  rand bit [3:0] value;
  rand bit en;
  constraint cons {solve en before value;
      if (en==1) {value inside {[10:20]};}}
endclass
module without_solve_before;
  seq s=new();
  initial begin
    repeat(10)begin
      s.randomize();
      $display("without solve before the value =%0d ,en=%0d",s.value,s.en);
    end
  end
endmodule
