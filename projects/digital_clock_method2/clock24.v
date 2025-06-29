module clock24(
    output reg [3:0] digit_sel,
           reg [7:0] seven_seg,
    input sys_clk, rst
    );
    reg clk_1hz, clk_500hz;
    reg[24:0] count1=0,count2=0;
    always @(posedge sys_clk) begin
         if(rst) begin
         count1 <= 0;
         clk_1hz <= 0;
         end
         else begin
            if(count1==24999999) begin
              clk_1hz <= ~clk_1hz;
              count1 <= 0;
            end
            else count1 <= count1+1;
         end    
    end
    always @(posedge sys_clk) begin
         if(rst) begin
         count2 <= 0;
         clk_500hz <= 0;
         end
         else begin
            if(count2==49000) begin //toggle each 49,000 cycle
              clk_500hz <= ~clk_500hz;
              count2 <= 0;
            end
            else count2 <= count2+1;
         end    
    end
   reg [5:0] min, sec;
   reg [3:0] curr_digit; 
   reg [1:0] index=0;
    always @(posedge clk_500hz) begin
        case(index) 
        2'b00:begin
              digit_sel<=4'b0001;
              curr_digit<=sec%10;
            end
        2'b01:begin
              digit_sel<=4'b0010;
              curr_digit<=sec/10;
            end
        2'b10:begin
              digit_sel<=4'b0100;
              curr_digit<=min%10;
            end
        2'b11:begin
              digit_sel<=4'b1000;
              curr_digit<=min/10;
            end
        endcase
        index<=index+1; 
    end
    always @(*) begin
        case(curr_digit)
            4'b0000 : seven_seg<= 8'b00000011;
            4'b0001 : seven_seg<= 8'b10011111;
            4'b0010 : seven_seg<= 8'b00100101;
            4'b0011 : seven_seg<= 8'b00001101;
            4'b0100 : seven_seg<= 8'b10011001;
            4'b0101 : seven_seg<= 8'b01001001;
            4'b0110 : seven_seg<= 8'b01000001;
            4'b0111 : seven_seg<= 8'b00011111;
            4'b1000 : seven_seg<= 8'b00000001;
            4'b1001 : seven_seg<= 8'b00001001;
        endcase
      end    
    always @(posedge clk_1hz or posedge rst) begin
        if(rst) begin
            min<=0; sec<= 0;
        end
        else begin
            if(sec==59)begin
            sec<=0;
            min<= (min==59)?0:min+1;
            end
            else sec<=sec+1;
        end
    end
    endmodule
