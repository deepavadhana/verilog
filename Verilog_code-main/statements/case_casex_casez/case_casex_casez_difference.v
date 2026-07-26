module case_demo(
    input [1:0] sel,
    output reg out_case,
    output reg out_casex,
    output reg out_casez
);

    
    always @(*) begin
        case (sel)
            2'b00: out_case = 1'b0;
            2'b01: out_case = 1'b1;
            default: out_case = 1'bx;
        endcase
    end

    
    always @(*) begin
        casex (sel)
            2'b0x: out_casex = 1'b0;  
            2'b1x: out_casex = 1'b1;  
            default: out_casex = 1'bx;
        endcase
    end

   
    always @(*) begin
        casez (sel)
            2'b0?: out_casez = 1'b0; 
            2'b1?: out_casez = 1'b1;  
            default: out_casez = 1'bx;
        endcase
    end
endmodule
//TESTBENCH 
module tb_case_demo;
    reg [1:0] sel;
    wire out_case, out_casex, out_casez;

    case_demo uut (
        .sel(sel),
        .out_case(out_case),
        .out_casex(out_casex),
        .out_casez(out_casez)
    );

    initial begin
        $display("Time\t sel  case casex casez");
        $monitor("%4t\t %b     %b     %b     %b", $time, sel, out_case, out_casex, out_casez);

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        sel = 2'b0x; #10;
        sel = 2'b1x; #10;
        sel = 2'bz0; #10;
        sel = 2'b0z; #10;
        sel = 2'bzz; #10;
        sel = 2'bxx; #10;

        $finish;
    end
endmodule
