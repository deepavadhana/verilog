//DATAFLOW MODELLING

module and_gate(input a,b,output out_and);
assign out_and=a&b;
endmodule

//STRUCTURAL MODELLING

module and_gate(input a,b,output out_and);
and a1(out_and,a,b);
endmodule

//BEHAVIOURAL MODELLING

module and_gate(input a,b,output reg out_and);
always@(a or b)
out_and=a&b;
endmodule

//TESTBENCH

module and_tb;
reg a,b;
wire out_and;
and_gate dut(.a(a),.b(b),.out_and(out_and));
initial begin
$display("AND GATE TRUTH TABLE");
  $monitor("a : %b b : %b     OUT : %b ",a,b,out_and);
a = 0 ; b = 0 ; #10 ;
a = 0 ; b = 1 ; #10 ;
a = 1 ; b = 0 ; #10 ;
a = 1 ; b = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
$dumpfile("and_gate.vcd");
$dumpvars(0,and_tb);
end
endmodule
