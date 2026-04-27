module sequence_detector(
    input clk,
    input bin,
    input rst,
    output reg det
);

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;

reg [2:0] state;
reg [2:0] next_state;

always @(posedge clk) begin
    if(rst) state <= S0;
    else state <= next_state;
end

always @(*) begin
    case(state)
    S0: begin
        if (bin)
            next_state = S1;
        else
            next_state = S0;
    end
    S1: begin
        if (bin)
            next_state = S1;
        else
            next_state = S2;
    end
    S2: begin
        if(bin)
            next_state = S3;
        else
            next_state = S0;
    end
    S3: begin
        if(bin)
            next_state = S4;
        else
            next_state = S2;
    end
    S4: begin
        if(bin)
            next_state = S1;
        else
            next_state = S2;
    end
    default: next_state = S0;
    endcase
end

always @(*) begin 
    case(state)
        S4: det = 1;
        default: det = 0;
    endcase
end 
endmodule