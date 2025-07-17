`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:31:22 07/16/2025 
// Design Name: 
// Module Name:    watchdogtimer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module watchdogtimer(
input  wire clk,
    input  wire rst_n,
    input  wire kick,         // Rising edge resets the counter
    output reg  timeout

    );
	  parameter integer CLK_HZ     = 24000000;     // Clock frequency (default 24 MHz)
    parameter integer TIMEOUT_MS = 500;  
	 localparam integer CNT_MAX = (CLK_HZ / 1000) * TIMEOUT_MS;
	  localparam integer CNT_WIDTH = 25;
	  reg [CNT_WIDTH-1:0] cnt;
    reg kick_d;
  wire kick_pulse = kick & ~kick_d;
  always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt     <= 0;
            timeout <= 1'b0;
            kick_d  <= 1'b0;
        end else begin
            kick_d <= kick;
				 if (kick_pulse) begin
                cnt     <= 0;
                timeout <= 1'b0;
            end else if (cnt >= CNT_MAX) begin
                timeout <= 1'b1;
            end else begin
                cnt <= cnt + 1;
            end
        end
    end

endmodule
