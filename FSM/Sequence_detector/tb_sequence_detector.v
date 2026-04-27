module tb_sequence_detector;

reg clk;
reg bin;
reg rst;
wire det;

sequence_detector dut (
    .clk(clk), 
    .bin(bin),
    .rst(rst),
    .det(det)
);

initial begin 
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin 
    $dumpfile("sequence_detector.vcd");
    $dumpvars(0, tb_sequence_detector);
    //rest
    bin = 0;
    rst = 1; #10;
    rst = 0;

    //input bitstream
    bin = 0; #10;
    bin = 1; #10;
    bin = 0; #10;
    bin = 1; #10;
    bin = 1; #10;
    bin = 0; #10;
    bin = 1; #10;
    bin = 0; #10;
    bin = 1; #10;
    bin = 1; #10;

    #20 $finish;
end
endmodule