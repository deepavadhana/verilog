class home;
  int no_of_fans;
  bit [3:0] power;
  task set_values(bit [3:0] p, int fans);
    power = p;
    no_of_fans = fans;
  endtask
endclass
module home_auto;
  home h[5];
  initial begin
    foreach (h[i]) begin
      h[i] = new();
    end
    h[0].set_values(0, 2);
    h[1].set_values(3, 4);
    h[2].set_values(5, 6);
    h[3].set_values(7, 8);
    h[4].set_values(9, 10);
    foreach (h[i]) begin
      $display("home:%0d power=%0d fans=%0d",
               i, h[i].power, h[i].no_of_fans);
    end
  end

endmodule
