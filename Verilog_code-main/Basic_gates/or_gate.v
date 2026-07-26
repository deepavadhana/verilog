//DATAFLOW MODELLING

module or_gate(input a,b,output out_or);
assign out_or=a|b;
endmodule

//STRUCTURAL MODELLING

module or_gate(input a,b,output out_or);
or o1(out_or,a,b);
endmodule

//BEHAVIOURAL MODELLING

module or_gate(input a,b,output reg out_or);
always@(a or b)
out_or=a|b;
endmodule

//TESTBENCH

module or_tb;
reg a,b;
wire out_or;
or_gate dut(.a(a),.b(b),.out_or(out_or));
initial begin
$display("OR GATE TRUTH TABLE");
$monitor("a: %b b : %b     OUT : %b ",a,b,out_or);
a = 0 ; b = 0 ; #10 ;
a = 0 ; b = 1 ; #10 ;
a = 1 ; b = 0 ; #10 ;
a = 1 ; b = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
  $dumpfile("or_gate.vcd");
  $dumpvars(0,or_tb);
end
endmodule
