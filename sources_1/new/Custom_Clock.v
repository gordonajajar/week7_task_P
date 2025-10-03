`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2025 14:58:34
// Design Name: 
// Module Name: Custom_Clock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Custom_Clock(
    input CLOCK,
    input [31:0] m,
    output reg NEW_CLOCK
    );
    reg [31:0] COUNT = 0;
    initial begin
        NEW_CLOCK = 0;
    end
    
    always @ (posedge CLOCK) begin
        COUNT <= (COUNT == m) ? 0 : COUNT + 1;
        NEW_CLOCK <= ( COUNT == 0 ) ? ~NEW_CLOCK : NEW_CLOCK;
    end
endmodule
