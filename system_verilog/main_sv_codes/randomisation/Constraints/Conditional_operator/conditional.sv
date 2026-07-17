
class packet;
  rand bit [4:0] value;
  rand enum {LOW,HIGH} state;
  constraint cons { (value==(state==LOW)?20:10);}
endclass
module conditional_constraint();
  packet pkt=new();
  initial begin
    repeat(10)begin
      if(pkt.randomize())
        $display("Randomisation success %0s %0d",pkt.state.name(),pkt.value);
      else
        $display("Randomisation failed %0s %0d",pkt.state.name(),pkt.value);
    end
  end
endmodule
