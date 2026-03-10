// Module: traffic_signal_moorefsm
// Description: 3-state Moore FSM, cycles GREEN→YELLOW→RED every clock edge.

module traffic_signal_moorefsm(
    input clk,
    output reg [2:0] light
);

parameter GREEN  = 2'b00;
parameter YELLOW = 2'b01;
parameter RED    = 2'b10;

reg [1:0] state;
reg [1:0] next_state;

always @(posedge clk) begin
    state <= next_state;
end

always @(*) begin
    case(state)
        GREEN : next_state = 2'b01;
        YELLOW : next_state = 2'b10;
        RED : next_state = 2'b01;
        default : next_state = 2'b00;
    endcase
end

always @(*) begin
    case(state)
        GREEN : light = 3'b001;
        YELLOW : light = 3'b010;
        RED : light = 3'b100;
        default : light = 3'b000;
    endcase
end
endmodule