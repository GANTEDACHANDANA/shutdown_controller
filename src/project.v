/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

module project (
    input  wire clk,
    input  wire rst_n,
    input  wire [3:0] io_in,
    output wire [1:0] io_out
);

    esd_controller esd_inst (
        .clk(clk),
        .rst_n(rst_n),
        .estop_a_n(io_in[0]),
        .estop_b_n(io_in[1]),
        .ack_n(io_in[2]),
        .wdg_kick(io_in[3]),
        .shutdown_o(io_out[0]),
        .led_stat_o(io_out[1])
    );

endmodule
