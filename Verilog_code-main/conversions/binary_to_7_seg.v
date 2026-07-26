
module binary_to_7segment(
  input [2:0] in,
    output reg [6:0] out
);

    always @(*) begin
        case (in)
            3'b000: out = 7'b1111110; 
            3'b001: out = 7'b0110000; 
            3'b010: out = 7'b1101101; 
            3'b011: out = 7'b1111001; 
            3'b100: out = 7'b0110011; 
            3'b101: out = 7'b1011011; 
            3'b110: out = 7'b1011111; 
            3'b111: out = 7'b1110000; 
            default:out = 7'b0000000; 
        endcase
    end

endmodule

//Testbench

module binary_to_7segment_tb;

  reg [2:0] in;
  wire [6:0] out;

  binary_to_7segment uut (
    .in(in),
    .out(out)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, binary_to_7segment_tb);
    in = 3'b000; #10;
    in = 3'b001; #10;
    in = 3'b010; #10;
    in = 3'b011; #10;
    in = 3'b100; #10;
    in = 3'b101; #10;
    in = 3'b110; #10;
    in = 3'b111; #10;

    $finish;
  end

endmodule
