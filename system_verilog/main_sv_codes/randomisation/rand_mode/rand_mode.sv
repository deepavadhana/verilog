// Code your design here
class generator ;
  rand bit [2:0] data;
  rand bit [1:0] data1;
  int state;
  function void rand_mode1(int a);
    if (a==0) begin
      rand_mode(a);
      state=a;
    end
 else if (a==1) begin
      rand_mode(a);
      state=a;
    end
  endfunction
endclass
module randomisation_mode();
  generator gen=new();
  int state_mod;
  int i;
  initial begin
    $display("Initial values before randomisation data=%0d ,data1=%0d",gen.data,gen.data1);
    if(gen.data.rand_mode())
      if(gen.data1.rand_mode())
    begin
      gen.state=1;
        $display("Randomisation is initialised");
      $display("Initial values while enabling randomisation data=%0d ,data1=%0d,state",gen.data,gen.data1,gen.state);
     end
    for(int i=0;i<=6;i++) begin
     state_mod=gen.randomize();
      $display("AFter Randomisation is initialised");
      $display("Initial values after enabling randomisation data=%0d ,data1=%0d,state",gen.data,gen.data1,gen.state);
      end
    if (i==3) begin
      gen.rand_mode1(0);
      $display("Randomisation is ended/disabled");
      $display(" values after disabling randomisation data=%0d ,data1=%0d,state",gen.data,gen.data1,gen.state);
    end
  end
    endmodule
  
    
    
    
  
    
  
    
