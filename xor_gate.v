//DATAFLOW MODELLING

module xor_gate(input a,b,output out_xor);
assign out_xor=a^b;
endmodule

//STRUCTURAL MODELLING

module xor_gate(input a,b,output out_xor);
  xor x1(out_xor,a,b);
endmodule

//BEHAVIOURAL MODELLING

module xor_gate(input a,b,output reg out_xor);
always@(a or b)
out_xor=a^b;
endmodule

//TESTBENCH

module xor_tb;
reg a,b;
wire out_xor;
  xor_gate dut(.a(a),.b(b),.out_xor(out_xor));
initial begin
  $display("XOR GATE TRUTH TABLE");
  $monitor("a : %b b : %b     OUT : %b ",a,b,out_xor);
a = 0 ; b = 0 ; #10 ;
a = 0 ; b = 1 ; #10 ;
a = 1 ; b = 0 ; #10 ;
a = 1 ; b = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
  $dumpfile("xor_gate.vcd");
  $dumpvars(0,xor_tb);
end
endmodule
