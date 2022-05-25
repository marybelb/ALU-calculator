`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Marybel and Victoria 
// 
// Create Date: 04/26/2022 07:59:12 PM
// Design Name: 
// Module Name: top_mod
// Project Name: ALU calculator
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


module top_mod(
    input [3:0] A,B,
    input type,
    input clk,
    input reset,
    input [1:0] select,
    output overflow,
    output [3:0] out,
    output [3:0] activate,
    output [6:0] LED_output
    );
    
    calculator c1(A, B, type, select, overflow, out);
    wire [3:0] in_values = out;
    ssd s1(clk, reset, in_values, activate, LED_output);
endmodule
