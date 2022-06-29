`default_nettype none   //do not allow undeclared wires

module blinky (
    input  wire clk_p,
    input  wire clk_n,
    output wire led_p,
    output wire led_n,
    );

    wire clk_ibufg;
    wire clk;
    wire led;

    IBUFDS ibuf_inst (.I(clk_p), .IB(clk_n), .O(clk_ibufg));
    BUFG   bufg_inst (.I(clk_ibufg), .O(clk));

    reg [24:0] r_count = 0;

    always @(posedge(clk)) r_count <= r_count + 1;

    assign led = r_count[24];

    OBUFDS obuf_inst (.I(led), .O(led_p), .OB(led_n));

endmodule
