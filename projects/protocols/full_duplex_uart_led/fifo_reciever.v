module fifo_reciever#(parameter WIDTH=8,ADDRESS=4)
  (input clk_50Mhz,rst,
   input wen,ren,
   output full,empty,
   input [WIDTH-1:0]write_data,
   output [WIDTH-1:0]read_data);
  reg [WIDTH-1:0]mem[2**ADDRESS-1:0];
  reg [ADDRESS-1:0] wptr,rptr,wptr_buff,rptr_buff,wptr_next,rptr_next;
  reg full_buff,empty_buff,full_fifo,empty_fifo;
  wire write_enable;
  always@(posedge clk_50Mhz)
    if(write_enable)
      mem[wptr]<=write_data;
  
    assign read_data=mem[rptr];
 
  assign write_enable=wen&(~full);
 
  always@(posedge clk_50Mhz or posedge rst) begin
    if(rst)begin
      wptr<=0;
      rptr<=0;
      full_fifo<=1'b0;
      empty_fifo<=1'b1;
    end
    else begin
    wptr<= wptr_buff;
    rptr<= rptr_buff;
    full_fifo<=full_buff;
    empty_fifo<=empty_buff;
    end
  end
    always@(*)begin
      wptr_next=wptr+1;
      rptr_next=rptr+1;
      full_buff=full_fifo;
      empty_buff=empty_fifo;
      wptr_buff=wptr;
      rptr_buff=rptr;
      
      case({wen,ren})
        2'b01:begin
          if(~empty_fifo)begin
            rptr_buff=rptr_next;
            full_buff=1'b0;
          end
          if(rptr_next==wptr)
              empty_buff=1'b1;
        end
        2'b10: begin
          if(~full_fifo)begin
            wptr_buff=wptr_next;
            empty_buff=1'b0;
          end
          if(wptr_next==rptr)
            full_buff=1'b1;
        end
        2'b11:begin
          wptr_buff=wptr_next;
          rptr_buff=rptr_next;
        end
      endcase
    end
    
        assign full=full_fifo;
        assign empty=empty_fifo;
    endmodule
