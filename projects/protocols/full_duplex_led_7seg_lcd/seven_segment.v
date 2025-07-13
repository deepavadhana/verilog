module seven_segment (
  input [4:0] bin,      
  output reg [6:0] seg   
);
  always @(*) begin
    case (bin)
      5'd0:  seg = 7'b0001000; // A
      5'd1:  seg = 7'b0000011; // B (b)
      5'd2:  seg = 7'b1000110; // C
      5'd3:  seg = 7'b0100001; // D (d)
      5'd4:  seg = 7'b0000110; // E
      5'd5:  seg = 7'b0001110; // F
      5'd6:  seg = 7'b0010000; // G ? 9
      5'd7:  seg = 7'b0001011; // H
      5'd8:  seg = 7'b1111001; // I ? 1
      5'd9:  seg = 7'b1110001; // J
      5'd10: seg = 7'b0001110; // K ? F
      5'd11: seg = 7'b1000111; // L
      5'd12: seg = 7'b1010100; // M (approx)
      5'd13: seg = 7'b0010101; // N (approx)
      5'd14: seg = 7'b1000000; // O
      5'd15: seg = 7'b0001100; // P
      5'd16: seg = 7'b0001000; // Q ? A
      5'd17: seg = 7'b0011111; // R (approx)
      5'd18: seg = 7'b0010010; // S ? 5
      5'd19: seg = 7'b0000111; // T
      5'd20: seg = 7'b1000001; // U
      5'd21: seg = 7'b1100001; // V (approx)
      5'd22: seg = 7'b1010000; // W (approx)
      5'd23: seg = 7'b0110111; // X (approx)
      5'd24: seg = 7'b0010001; // Y
      5'd25: seg = 7'b0100100; // Z ? 2
      default: seg = 7'b1111111; // Blank
    endcase
  end
endmodule
