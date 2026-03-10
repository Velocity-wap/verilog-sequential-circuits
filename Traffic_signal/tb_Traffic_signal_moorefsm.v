// Module: traffic_signal_moorefsm
// Description: 3-state Moore FSM, cycles GREEN→YELLOW→RED every clock edge.

module tb_Traffic_signal_moorefsm;

reg clk;
wire [2:0] light;
wire [1:0] sigout;

traffic_signal_moorefsm dut(
    .clk(clk),
    .light(light),
    .sigout(sigout)
);

//clock generation 
initial begin 
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin 
    $dumpfile("Traffic_signal_moorefsm.vcd");
    $dumpvars(0, tb_Traffic_signal_moorefsm);
    #100
    $finish
end
endmodule