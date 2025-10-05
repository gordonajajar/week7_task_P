`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 29.09.2025 16:22:00
// Design Name: 
// Module Name: Counter
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


module Counter (
    input CLOCK,
    output reg [1:0] COUNT = 0
);
    always @(posedge CLOCK) begin
        COUNT <= (COUNT == 2'b11) ? 0 : COUNT + 1;
    end

endmodule
