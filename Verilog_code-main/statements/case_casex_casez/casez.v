module casez_problems_pattern_matching(input [3:0]a,output reg [2:0] out);
  always@(a)begin
    casez(a)
      4'b1???:out=3'b001;
      4'b01??:out=3'b010;
      4'b001?:out=3'b011;
      4'b0001:out=3'b101;
      default:out=3'b000;
    endcase
  end
endmodule
     
      //TESTBENCH

module casez_problems_pattern_matching(input [3:0]a,output reg [2:0] out);
  always@(a)begin
    casez(a)
      4'b1???:out=3'b001;
      4'b01??:out=3'b010;
      4'b001?:out=3'b011;
      4'b0001:out=3'b101;
      default:out=3'b000;
    endcase
  end
endmodule
     
      
