//DATAFLOW MODELLING

module nor_gate(input a,b,output out_nor);
assign out_nor=~(a|b);
endmodule

//STRUCTURAL MODELLING

module nor_gate(input a,b,output out_nor);
  nor n2(out_nor,a,b);
endmodule

//BEHAVIOURAL MODELLING

module nor_gate(input a,b,output reg out_nor);
always@(a or b)
out_nor=~(a|b);
endmodule

//TESTBENCH

module nor_tb;
reg a,b;
wire out_nor;
  nor_gate dut(.a(a),.b(b),.out_nor(out_nor));
initial begin
  $display("NOR GATE TRUTH TABLE");
  $monitor("a : %b b : %b     OUT : %b ",a,b,out_nor);
a = 0 ; b = 0 ; #10 ;
a = 0 ; b = 1 ; #10 ;
a = 1 ; b = 0 ; #10 ;
a = 1 ; b = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
  $dumpfile("nor_gate.vcd");
  $dumpvars(0,nor_tb);
end
endmodule
