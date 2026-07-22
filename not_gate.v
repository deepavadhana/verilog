//DATAFLOW MODELLING

module not_gate(input a,output out_not);
assign out_not=~a;
endmodule

//STRUCTURAL MODELLING

module not_gate(input a,output out_not);
not n1(out_not,a);
endmodule

//BEHAVIOURAL MODELLING

module not_gate(input a,output reg out_not);
always@(a)
out_not=~a;
endmodule

//TESTBENCH

module not_tb;
reg a;
wire out_not;
  and_gate dut(.a(a),.out_not(out_not));
initial begin
  $display("NOT GATE TRUTH TABLE");
  $monitor("a : %b  OUT : %b ",a,out_not);
a = 0 ;  #10 ;
a = 0 ;  #10 ;
a = 1 ;  #10 ;
a = 1 ;  #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
  $dumpfile("not_gate.vcd");
  $dumpvars(0,not_tb);
end
endmodule
