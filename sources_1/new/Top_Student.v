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
    input sw,
    output [7:0] JC
    );
    
    wire clock_6p25MHz;
    Custom_Clock u6p25Mhz(clk, 7, clock_6p25MHz);
    
    // OLED
    wire [15:0] task_P_data;
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    Oled_Display uDisplay(
      .clk(clock_6p25MHz), .reset(btnC), 
      .frame_begin(frame_begin), .sending_pixels(sending_pixels),
      .sample_pixel(sample_pixel), 
      .pixel_index(pixel_index), .pixel_data(task_P_data), 
      .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]), .pmoden(JC[7]));

    wire [6:0] px; 
    wire [6:0] py;
    assign px = pixel_index % 96;
    assign py = pixel_index / 96;
    
    Task_P_Gordon taskP(.clk(clk),
                        .set(sw),
                        .btnC(btnC),
                        .btnL(btnL),
                        .btnR(btnR),
                        .x(px),
                        .y(py),
                        .oled_data(task_P_data)); // replace oled_data with taskP specific wire
    
endmodule
