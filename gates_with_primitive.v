//DATAFLOW MODELLING

module gate_with_primitives(input a,b,output out_and,out_or,out_not,out_nor,out_nand,out_xor,out_xnor);
  assign out_and=a&b;
  assign out_or=a|b;
  assign out_not=~a;
  assign out_nand=~(a&b);
  assign out_nor=~(a|b);
  assign out_xor=(a^b);
  assign out_xnor=~(a^b);
endmodule

//STRUCTURAL MODELLING

module gate_with_primitives(input a,b,output out_and,out_or,out_not,out_nor,out_nand,out_xor,out_xnor);
  and a1(out_and,a,b);
  or o1(out_or,a,b);
  not c1(out_not,a);
  nand n1(out_nand,a,b);
  nor n2(out_nor,a,b);
  xor x1(out_xor,a,b);
  xnor x2(out_xnor,a,b);
endmodule

//BEHAVOURIAL MODELLING

module gate_with_primitives(input a,b,output reg out_and,out_or,out_not,out_nor,out_nand,out_xor,out_xnor);
  always@(a or b)
    begin
     out_and=a&b;
     out_or=a|b;
     out_not=~a;
     out_nand=~(a&b);
     out_nor=~(a|b);
     out_xor=(a^b);
     out_xnor=~(a^b);
    end
endmodule

//TESTBENCH 

module gates_with_primitives_tb;
 reg a, b;
 wire out_and, out_or, out_not, out_nand, out_nor, out_xor, out_xnor;
  and  a1(out_and, a, b);
  or   o1(out_or, a, b);
  not  c1(out_not, a);
  nand n1(out_nand, a, b);
  nor  n2(out_nor, a, b);
  xor  x1(out_xor, a, b);
  xnor x2(out_xnor, a, b);
 initial begin
    $display("ALL GATES WITH PRIMITIVES");
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
   $monitor("a : %b b : %b     OUT : %b ",a,b,out_and,out_or, out_not, out_nand, out_nor, out_xor, out_xnor);
 end
  initial begin
    $dumpfile("gate_with_primitives.vcd");
    $dumpvars(0,gate_with_primitives_tb);
  endmodule
