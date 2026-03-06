// Module: up_down_counter
// Description: 4-bit Up Down Counter
module tb_up_down_counter;
    reg clk;
    reg rst;
    reg en;
    reg dir;
    wire [3:0] count;

up_down_counter dut(
    .clk(clk),
    .rst(rst),
    .en(en),
    .dir(dir),
    .count(count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("up_down_counter.vcd");
    $dumpvars(0, tb_up_down_counter);

    // Initial values
    rst = 1; en = 0; dir = 0;
    #20;
    // Release reset (hold test)
    rst = 0; en = 0; dir = 0;
    #20;
    // Count up
    rst = 0; en = 1; dir = 1;
    #60;
    // Hold
    rst = 0; en = 0; dir = 1;
    #20;
    // Count down
    rst = 0; en = 1; dir = 0;
    #60;
    // Reset while counting
    rst = 1;
    #20;
    rst = 0; en = 1; dir = 1;
    #40;
    $finish;
end
endmodule