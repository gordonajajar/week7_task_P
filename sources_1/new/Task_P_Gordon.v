`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME:
//  STUDENT C NAME: 
//  STUDENT D NAME:  
//
//////////////////////////////////////////////////////////////////////////////////



module Task_P_Gordon (
    input clk, 
    input btnC, btnL, btnR,
    input [12:0] pixel_index,
    output [15:0] oled_data
    );
    
    // clocks
    wire clock_6p25MHz;
    wire clock_1000Hz;
    Custom_Clock u6p25Mhz(clk, 7, clock_6p25MHz);
    Custom_Clock u1000Hz(clk, 49999, clock_1000Hz);
    
    // toggle both 9s, with debouncing
    wire [1:0] set9; // left bit (MSB) sets left 9 drawn, right bit sets right 9 drawn
    button_controller(.clk(clk), .clock_1000Hz(clock_1000Hz), 
                      .btnL(btnL), .btnR(btnR), .set9(set9));

     draw_characters draw(.pixel_index(pixel_index), .set9(set9),
                          .clock_1000Hz(clock_1000Hz), .btnL(btnL), .btnR(btnR),
                          .oled_data(oled_data));

endmodule
