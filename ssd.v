`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 07:56:33 PM
// Design Name: 
// Module Name: ssd
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


module ssd(
input clk,
input reset,
input [3:0] in_values,
output reg [3:0] activate,
output reg [6:0] LED_output
    );
    reg [26:0] one_count;
    wire one_enable;
    reg [15:0] display;
    reg [3:0] BCD;
    reg [19:0] refresh;
    wire [1:0] LED_activate;
    
    always @(posedge clk or posedge reset)
    begin
    if (reset==1)
    one_count <= 0;
    else
    begin 
    if (one_count >= 99999999)
    one_count <= 0;
    else 
    one_count <= one_count + 1;
    end
    end
    
    assign one_enable = (one_count == 99999999)?1:0;
    
    always @(posedge clk or posedge reset)
    begin
    if (reset == 1) 
    display <= 0;
    else if (one_enable ==1)
    display <= in_values;
    end
    
    always @(posedge clk or posedge reset)
    begin
    if (reset == 1)
    refresh <= 0; 
    else
    refresh <= refresh + 1;
    end
    assign LED_activate = refresh[19:18];
    
    always @(*)
    begin
    case(LED_activate)
    2'b00: begin
    activate = 4'b0111;
    BCD = display/1000;
    end
    2'b01: begin
    activate = 4'b1011;
    BCD = (display % 1000)/100;
    end
    2'b10: begin
    activate = 4'b1101;
    BCD = ((display % 1000)%100)/10;
    end
    2'b11: begin
    activate = 4'b1110;
    BCD = ((display % 1000)%100)%10;
    end
    endcase
    end
    
    always @(*)
    begin
    case(BCD)
    4'b0000: LED_output = 7'b1000000;
    4'b0001: LED_output = 7'b1111001;
    4'b0010: LED_output = 7'b0100100;
    4'b0011: LED_output = 7'b0110000;
    4'b0100: LED_output = 7'b0011001;
    4'b0101: LED_output = 7'b0010010;
    4'b0110: LED_output = 7'b0000010;
    4'b0111: LED_output = 7'b1111000;
    4'b1000: LED_output = 7'b0000000;
    4'b1001: LED_output = 7'b0011000;
    default: LED_output = 7'b1000000;
    endcase
    end
endmodule
