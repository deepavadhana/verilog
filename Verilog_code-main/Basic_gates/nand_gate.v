//DATAFLOW MODELLING

module nand_gate(input a,b,output out_nand);
assign out_nand=~(a&b);
endmodule

//STRUCTURAL MODELLING

module nand_gate(input a,b,output out_nand);
nand n1(out_nand,a,b);
endmodule

//BEHAVIOURAL MODELLING

module nand_gate(input a,b,output reg out_nand);
always@(a or b)
out_nand=~(a&b);
endmodule

//TESTBENCH

module nand_tb;
reg a,b;
wire out_nand;
nand_gate dut(.a(a),.b(b),.out_nand(out_nand));
initial begin
  $display("NAND GATE TRUTH TABLE");
  $monitor("a: %b b : %b     OUT : %b ",a,b,out_nand);
a = 0 ; b = 0 ; #10 ;
a = 0 ; b = 1 ; #10 ;
a = 1 ; b = 0 ; #10 ;
a = 1 ; b = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
  $dumpfile("nand_gate.vcd");
  $dumpvars(0,nand_tb);
end
endmodule
