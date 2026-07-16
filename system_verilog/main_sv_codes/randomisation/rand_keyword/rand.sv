
class rand_mtd;
  rand logic [2:0] a;
  endclass
 module rand_top;
   rand_mtd r;
   initial begin
     r=new();
     $display("randomisation");
     for(int i=0;i<=10;i++)begin
       if(r.randomize())
       $display("Values of a : %b ",r.a);
   end
   end
 endmodule
