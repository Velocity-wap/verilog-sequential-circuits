// Module: up_down_counter
// Description: 4-bit Up Down Counter
module up_down_counter(
    input clk,
    input rst,
    input en,
    input dir,
    output reg [3:0] count
);

always @(posedge clk)
    if(rst)
        count <= 0;
    else if (en) begin
        if(dir)
            count <= count +1;
        else
        count <= count -1;
end
endmodule

