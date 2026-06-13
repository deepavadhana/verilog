class home;
  int no_fans;
  bit [3:0] power;
  function new (bit [3:0] p,int n);
    power=p;
    no_fans=n;
  endfunction
endclass
  module const_obj_arr;
    home h[5];
    initial begin
      foreach(h[i])begin
        h[0]=new(4'b1010,4);
        h[1]=new(4'b1110,5);
        h[2]=new(4'b0110,0);
        h[3]=new(4'b1000,2);
        h[4]=new(4'b1111,3);
      end
      foreach(h[i])begin
        $display("power=%0d,No of fans=%0d",h[i].power,h[i].no_fans);
      end
    end
      endmodule
