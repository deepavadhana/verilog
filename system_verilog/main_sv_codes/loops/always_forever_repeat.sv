// Code your design here
module demo;

initial begin

    $display("REPEAT");

    repeat(3)
        $display("Hello");

end

initial begin

    #20;

    $display("FOREVER");

    forever begin
        #10;
        $display("Tick");
    
#20 $finish;
    end
end

always begin

    #5;

    $display("ALWAYS");

end

endmodule
