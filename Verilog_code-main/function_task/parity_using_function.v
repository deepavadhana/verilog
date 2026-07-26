
function parity_bit;
  input [7:0] in;
  begin
    parity_bit=^in;
  end
endfunction

//TESTBENCH

module tb;
  reg [7:0] in;
  wire result;
  
  function parity_bit;
  input [7:0] in;
  begin
    parity_bit=^in;
  end
endfunction
  assign result=parity_bit(in);
  initial begin
    $monitor("in=%0b parity_bit=%0b",in,result);
   #1 in=8'b00101010;
    #1 in=8'b00101110;
  end
   
endmodule
