`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 17:17:53
// Design Name: 
// Module Name: draw_9
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


module draw_9(
    input set, [15:0] colour, // if set is true, draws 9. colour is the 9 to be drawn
    input [6:0] px, py, base_x, base_y, // px, py is current index, basex and y are top left
    output [15:0] oled_data // output colour (for top module to set oled_data to)
    );
    localparam BLACK = 16'h0000;
    
    // scale these 3 evenly or else it looks like shit
    localparam WIDTH = 28;
    localparam HEIGHT = 48;
    localparam THICKNESS = 8;
    
    localparam BOXGAP = (HEIGHT - 3*THICKNESS) / 2; // make sure no flooring!
    localparam RIGHTCOL = BOXGAP + THICKNESS;
    
    wire [6:0] rx, ry;
    // get relative indexes
    assign rx = px - base_x;
    assign ry = py - base_y;
    
    assign oled_data = (
               (set && rx < WIDTH && ry < HEIGHT) && 
               ((rx >= 0 && rx < WIDTH && ry >= 0 && ry < THICKNESS) ||
               (rx >= 0 && rx < THICKNESS && ry >= THICKNESS && ry < RIGHTCOL) ||
               (rx >= RIGHTCOL && rx < WIDTH && ry >= THICKNESS && ry < RIGHTCOL) ||
               (rx >= 0 && rx < WIDTH && ry >= RIGHTCOL && ry < RIGHTCOL + THICKNESS) ||
               (rx >= RIGHTCOL && rx < WIDTH && ry >= RIGHTCOL + THICKNESS && ry < HEIGHT-THICKNESS) ||
               (rx >= 0 && rx < WIDTH && ry >= HEIGHT-THICKNESS && ry < HEIGHT))) ? colour : BLACK;
endmodule
