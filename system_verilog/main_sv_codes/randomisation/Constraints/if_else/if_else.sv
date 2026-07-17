// Code your design here
class packet;
  rand bit [2:0] value;
  rand enum {LOW,HIGH}state;
  constraint cons { if(state==LOW) value>10;
                   else value<10;};
endclass
module if_else_constraint();
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
