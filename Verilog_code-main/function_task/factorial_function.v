function automatic [31:0] factorial;
  input [31:0]n;
  begin
    if(n==0||n==1)
      factorial=1;
    else 
      factorial=n*factorial(n-1);
  end
endfunction

//TESTBENCH

module function_tb;
  reg [31:0]n;
  wire [31:0] result;
  function automatic [31:0] factorial;
  input [31:0]n;
  begin
    if(n==0||n==1)
      factorial=1;
    else 
      factorial=n*factorial(n-1);
  end
endfunction
  assign result=factorial(n);
 initial begin
    n=32'd6;
    
     #1 $display("n=%0d factorial=%0d",n,result);
      n=32'd8;
    
     #1 $display("n=%0d factorial=%0d",n,result);
     
     $finish;
  end
  
endmodule
