function [8:0] sum8;
        input [7:0] a, b;
        begin
            sum8 = a + b;
        end
    endfunction

//Testbench

  module tb_sum8;
reg [7:0] a, b;
    wire [8:0] result;
function [8:0] sum8;
 input [7:0] a, b;
        begin
            sum8 = a + b;
        end
    endfunction
 assign result = sum8(a, b);
initial begin
      a = 8'd100; b = 8'd55;   #1 $display("a=%d b=%d -> sum=%d", a, b, result);
      a = 8'd200; b = 8'd100;  #1 $display("a=%d b=%d -> sum=%d", a, b, result);
       $finish;
       end
       endmodule
