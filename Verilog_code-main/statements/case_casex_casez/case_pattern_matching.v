module case_problems_pattern_matching(input [3:0]a,output reg [2:0] out);
  always@(a)begin
    case(a)
      4'b1111:out=3'b001;
      4'b0100:out=3'b010;
      4'b0011:out=3'b011;
      4'b0001:out=3'b101;
      default:out=3'b000;
    endcase
  end
endmodule
     
  //TESTBENCH
module case_problems_pattern_matching(input [3:0]a,output reg [2:0] out);
  always@(a)begin
    case(a)
      4'b1111:out=3'b001;
      4'b0100:out=3'b010;
      4'b0011:out=3'b011;
      4'b0001:out=3'b101;
      default:out=3'b000;
    endcase
  end
endmodule
     
      
  
