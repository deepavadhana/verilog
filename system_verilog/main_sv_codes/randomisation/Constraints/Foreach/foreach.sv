// Code your design here
typedef enum {LOW,MID1,MID2,HIGH} state;
class array_mtd;
  rand bit [7:0] assc[state];
  rand bit [2:0] dyn[];
  int i;
  constraint cons{ foreach (dyn[i]) {dyn[i]>i*i;}}
  constraint cons1 { dyn.size() inside{[2:9]};}
  function new();
    assc[LOW]=0;
    assc[MID1]=0;
    assc[MID2]=0;
    assc[HIGH]=0;
  endfunction
  constraint cons2{
    foreach(assc[i]){
      assc[i]<100;
    (i==LOW) -> assc[i]>30;
    (i==MID1) -> assc[i] inside {[30:50]};
    (i==MID2) -> assc[i] inside {[51:90]};
    (i==HIGH) -> assc[i] >90;
    }}
endclass
  module foreach_const();
    int i;
    array_mtd md=new();
    initial begin
      repeat(10) begin
        if(md.randomize())begin
          foreach(md.assc[i])
            $display("Randomisation success: assc[%s]=%0d ",i.name(),md.assc[i]);
          foreach(md.dyn[i])
            $display("Randomisation success: assc[%s]=%0d ",i,md.dyn[i]);
        end
        else 
          $display("Randomisation failed");
      end
    end
      endmodule
        
        
      
