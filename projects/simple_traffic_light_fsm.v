module traffic_light(
  input clk,
  input rst,
  output reg red,
  output reg green,
  output reg yellow
);
  parameter [1:0] 
    RED    = 2'b00,
    GREEN  = 2'b01,
    YELLOW = 2'b10;
  reg [1:0] current_state, next_state;
  reg [2:0] counter;
  always @(*) begin
    red    = (current_state == RED);
    green  = (current_state == GREEN);
    yellow = (current_state == YELLOW);
  end
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      current_state <= RED;
      counter <= 0;
    end else begin
      current_state <= next_state;

      if ((current_state == RED && counter == 5) ||
          (current_state == GREEN && counter == 4) ||
          (current_state == YELLOW && counter == 2))
        counter <= 0;
      else
        counter <= counter + 1;
    end
  end
  always @(*) begin
    case (current_state)
      RED:    next_state = (counter == 5) ? GREEN  : RED;
      GREEN:  next_state = (counter == 4) ? YELLOW : GREEN;
      YELLOW: next_state = (counter == 2) ? RED    : YELLOW;
      default:  next_state = RED;
    endcase
  end
    endmodule

//TESTBENCH

module traffic_light_tb;
  reg clk,rst;
  wire red,green,yellow;
  traffic_light uut(.clk(clk),.rst(rst),.red(red),.green(green),.yellow(yellow));
  initial clk=0;
  always#5 clk=~clk;
  initial begin
    rst=1;
    #10
    rst=0;
    $monitor("Traffic_light states: red=%0b green=%0b yellow=%0b",red,green,yellow);
    #10
    rst=0;
    #300
    $finish;
  end
endmodule
  
   //OUTPUT

Traffic_light states: red=1 green=0 yellow=0
Traffic_light states: red=0 green=1 yellow=0
Traffic_light states: red=0 green=0 yellow=1 
Traffic_light states: red=1 green=0 yellow=0 
Traffic_light states: red=0 green=1 yellow=0
Traffic_light states: red=0 green=0 yellow=1
Traffic_light states: red=1 green=0 yellow=0
# RUNTIME: Info: RUNTIME_0068 testbench.sv (18): $finish called.

