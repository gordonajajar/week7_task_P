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

    
    // clocks
    wire clock_6p25MHz;
    wire clock_1000Hz;
    Custom_Clock u6p25Mhz(clk, 7, clock_6p25MHz);
    Custom_Clock u1000Hz(clk, 49999, clock_1000Hz);
    
    // toggle both 9s, with debouncing
    wire [1:0] set9; // left bit (MSB) sets left 9 drawn, right bit sets right 9 drawn
    button_controller(.clk(clk), .clock_1000Hz(clock_1000Hz), 
                      .btnL(btnL), .btnR(btnR), .set9(set9));

    
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
      
     draw_characters draw(.pixel_index(pixel_index), .set9(set9),
                          .clock_1000Hz(clock_1000Hz), .btnL(btnL), .btnR(btnR),
                          .oled_data(oled_data));

endmodule
