//DATAFLOW MODELLING

module xnor_gate(input a,b,output out_xnor);
  assign out_xnor=~(a^b);
endmodule

//STRUCTURAL MODELLING

module xnor_gate(input a,b,output out_xnor);
  xnor x1(out_xnor,a,b);
endmodule

//BEHAVIOURAL MODELLING

module and_gate(input a,b,output reg out_xnor);
always@(a or b)
  out_xnor=~(a^b);
endmodule

//TESTBENCH

module xnor_tb;
reg a,b;
wire out_xnor;
  xnor_gate dut(.a(a),.b(b),.out_xnor(out_xnor));
initial begin
  $display("XNOR GATE TRUTH TABLE");
  $monitor("a : %b b : %b     OUT : %b ",a,b,out_xnor);
a = 0 ; b = 0 ; #10 ;
a = 0 ; b = 1 ; #10 ;
a = 1 ; b = 0 ; #10 ;
a = 1 ; b = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
  $dumpfile("xnor_gate.vcd");
  $dumpvars(0,xnor_tb);
end
endmodule
