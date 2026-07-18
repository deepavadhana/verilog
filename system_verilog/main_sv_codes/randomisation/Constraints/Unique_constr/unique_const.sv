// Code your design here
typedef enum {A0,A1,A2,A3} state;
class seq;
  rand bit [5:0] dyn[5];
  rand bit [5:0] assc[state];
  rand bit [3:0] val,val1,val2,val3;
  state st;
  constraint cons { unique {val,val1,val2,val3};}
  constraint cons2 {unique{dyn};}
  constraint cons1 { unique{assc};{assc.size==st.num};foreach (dyn[i]) dyn[i] inside{[10:20]};}
endclass
module unique_const;
  seq s=new();
  initial begin
    repeat (5) begin
      s.randomize();
      $display ("Values of the val=%0d ,val1=%0d ,val2=%0d , val3=%0d ",s.val,s.val1,s.val2,s.val3);
      foreach(s.dyn[i])
        $display ("Values of the dynamic array dyn[%0d]=%0d",i,s.dyn[i]);
      foreach(s.assc[i])
        $display ("Values of the assc array assc[%s]=%0d",i.name(),s.assc[i]);
    end
  end
endmodule
      
