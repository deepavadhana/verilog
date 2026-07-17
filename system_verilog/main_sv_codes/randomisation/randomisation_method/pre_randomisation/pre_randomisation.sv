class generator;
  rand bit [4:0] a;
  int i = 0;
  function void pre_randomize();
if (i % 2 == 0) begin
      rand_mode(0);
      $display("Stopping randomisation");
    end
    else begin
      rand_mode(1);
    end
      i++;
endfunction
endclass
module pre_randomization;
  generator gen = new();
 initial begin
    for (int i = 1; i <= 8; i++) begin
      $display("time = %0t", $time);
      void'(gen.randomize());#1;
      $display("Loop i = %0d, gen.a = %0d", i, gen.a);
    end
 end
endmodule
