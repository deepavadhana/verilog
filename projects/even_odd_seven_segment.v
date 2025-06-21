module bcd_7segment(
    output reg [7:0] seven_seg,reg [3:0] digit_sel,
    input [3:0] num
    );
    
    always @(*) begin
        case(num)
            4'b0000 : seven_seg<= 8'b00000010;
            4'b0001 : seven_seg<= 8'b10011111;
            4'b0010 : seven_seg<= 8'b00100100;
            4'b0011 : seven_seg<= 8'b00001101;
            4'b0100 : seven_seg<= 8'b10011000;
            4'b0101 : seven_seg<= 8'b01001001;
            4'b0110 : seven_seg<= 8'b01000000;
            4'b0111 : seven_seg<= 8'b00011111;
            4'b1000 : seven_seg<= 8'b00000000;
            4'b1001 : seven_seg<= 8'b00001001;
            default : seven_seg<= 8'b00000000;
        endcase
      end    
        
        always @(*) begin
            if (num%2==0)
            digit_sel<= 3'b010;
            else
            digit_sel<= 3'b001;
        end
endmodule
