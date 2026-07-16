// Code your design here
module tb;
  bit [2:0] data;
  bit [7:0] mask;
  function bit [2:0] data_rand;
    while (1) begin
      data=$random;
      if (!mask[data])begin
        mask[data]=1;
        return data;
      end
      else if (&mask)begin
        mask=0;
        mask[data]=1;
      break;
    end
    end
    return data;
    endfunction
  initial begin
    repeat(3)
      begin
      repeat(8) begin
        $display("data=%0d", data_rand());
      end
      end
  end
endmodule
    
        
        
