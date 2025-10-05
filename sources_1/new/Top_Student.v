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


module Top_Student (
    input clk, input btnC, btnL, btnR,
    input sw[4],
    output [7:0] JC
    );
    
    // OLED
    wire [15:0] oled_data;
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    Oled_Display uDisplay(
      .clk(clock_6p25MHz), .reset(btnC), 
      .frame_begin(frame_begin), .sending_pixels(sending_pixels),
      .sample_pixel(sample_pixel), 
      .pixel_index(pixel_index), .pixel_data(oled_data), 
      .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]), .pmoden(JC[7]));

    Task_P_Gordon taskP(.clk(clk),
                        .btnC(btnC),
                        .btnL(btnL),
                        .btnR(btnR),
                        .pixel_index(pixel_index),
                        .pixel_data(taskP_pixel_data));
    
    
endmodule
